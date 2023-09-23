import 'package:fir_page_challenge/models/data_model.dart';
import 'package:fir_page_challenge/screens/variable_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum CriterionType { plainText, variable }

extension CriteriaTypeMapping on CriterionType {
  String get key {
    switch (this) {
      case CriterionType.plainText:
        return 'plain_text';
      case CriterionType.variable:
        return 'variable';
    }
  }

  Widget typeWidget(
      {required Criterion criterion, required BuildContext context}) {
    switch (this) {
      case CriterionType.plainText:
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Text(criterion.text),
        );
      case CriterionType.variable:
        String text = criterion.text;

        List<String> textSpans =
            splitString(text, criterion.variableMap!.keys.toList());

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
                text: '',
                children: textSpans
                    .map((e) => TextSpan(
                        text: e,
                        recognizer: criterion.variableMap!.containsKey(e)
                            ? (TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => VariablePage(
                                        title: e,
                                        variableData:
                                            criterion.variableMap![e]!)));
                              })
                            : null,
                        style: TextStyle(
                            color: criterion.variableMap!.containsKey(e)
                                ? Colors.blueAccent
                                : Colors.black)))
                    .toList()),
          ),
        );
    }
  }
}

List<String> splitString(String input, List<String> splitSubstrings) {
  String joinedPattern = splitSubstrings.map((substring) {
    return RegExp.escape(substring);
  }).join('|');

  RegExp pattern = RegExp(joinedPattern);

  List<String> substrings = input.split(pattern);

  List<String> result = [];

  int j = 0;

  for (int i = 0; i < substrings.length; i++) {
    result.add(substrings[i]);

    if (i < substrings.length - 1 && j < splitSubstrings.length) {
      result.add(splitSubstrings[j]);
      j++;
    }
  }

  return result;
}
