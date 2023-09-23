import 'package:fir_page_challenge/enums/variable_type.dart';
import 'package:fir_page_challenge/models/data_model.dart';
import 'package:flutter/material.dart';

class VariablePage extends StatelessWidget {
  final VariableData variableData;
  final String title;

  const VariablePage(
      {required this.variableData, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: variableData.type.getWidget(data: variableData),
    );
  }
}
