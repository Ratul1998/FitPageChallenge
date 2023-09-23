import 'package:fir_page_challenge/enums/criteria_type.dart';
import 'package:fir_page_challenge/enums/variable_type.dart';
import 'package:fir_page_challenge/extensions/string_extensions.dart';

class StocksData {
  int id;
  String name;
  String tag;
  String color;
  List<Criterion> criteria;

  StocksData({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory StocksData.fromJson(Map<String, dynamic> json) {
    return StocksData(
        id: json['id'],
        name: json['name'],
        tag: json['tag'],
        color: json['color'],
        criteria: (json['criteria'] as List<dynamic>)
            .map((e) => Criterion.fromJson(e))
            .toList());
  }
}

class Criterion {
  CriterionType type;
  String text;
  Map<String, VariableData>? variableMap;

  Criterion({
    required this.type,
    required this.text,
    this.variableMap,
  });

  factory Criterion.fromJson(Map<String, dynamic> json) {
    return Criterion(
        type: json['type'].toString().criteriaType,
        text: json['text'],
        variableMap: (json['variable'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, VariableData.fromJson(value))));
  }
}

class VariableData {
  VariableType type;
  List<double>? values;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;

  VariableData(
      {required this.type,
      this.values,
      this.defaultValue,
      this.maxValue,
      this.minValue,
      this.parameterName,
      this.studyType});

  factory VariableData.fromJson(Map<String, dynamic> json) {
    return VariableData(
        type: json['type'].toString().variableType,
        defaultValue: json['default_value'],
        maxValue: json['max_value'],
        minValue: json['min_value'],
        parameterName: json['parameter_name'],
        studyType: json['study_type'],
        values: (json['values'] as List<dynamic>?)
            ?.map((e) => double.parse(e.toString()))
            .toList());
  }
}
