import 'package:fir_page_challenge/enums/criteria_type.dart';
import 'package:fir_page_challenge/models/data_model.dart';
import 'package:flutter/material.dart';

class CriteriaPage extends StatelessWidget {
  final List<Criterion> criterion;
  final String title;

  const CriteriaPage({required this.criterion, super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: criterion
            .map((e) => e.type.typeWidget(criterion: e, context: context))
            .toList(),
      ),
    );
  }
}
