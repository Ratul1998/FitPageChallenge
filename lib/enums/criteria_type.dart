import 'package:fir_page_challenge/constants/routes.dart';
import 'package:fir_page_challenge/models/data_model.dart';
import 'package:fir_page_challenge/utils/helper_functions.dart';
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
                                Navigator.of(context)
                                    .pushNamed(Routes.variablePage, arguments: {
                                  'variableData': criterion.variableMap![e]!,
                                  'title': e
                                });
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
