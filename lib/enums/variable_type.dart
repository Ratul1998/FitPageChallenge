import 'package:fir_page_challenge/models/data_model.dart';
import 'package:flutter/material.dart';

enum VariableType { value, indicator }

extension VariableTypeMapping on VariableType {
  Widget getWidget({required VariableData data}) {
    switch (this) {
      case VariableType.value:
        return Column(
          children: data.values
                  ?.map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e.toString()),
                      ))
                  .toList() ??
              [],
        );

      case VariableType.indicator:
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.studyType ?? ''),
              Row(
                children: [
                  Text(data.parameterName ?? ''),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: data.defaultValue?.toString(),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
    }
  }
}
