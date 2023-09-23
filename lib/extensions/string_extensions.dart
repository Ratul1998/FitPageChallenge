import 'dart:ui';

import 'package:fir_page_challenge/enums/criteria_type.dart';
import 'package:fir_page_challenge/enums/variable_type.dart';
import 'package:flutter/material.dart';

extension EnumMapping on String {
  VariableType get variableType {
    if (this == VariableType.indicator.name) {
      return VariableType.indicator;
    }

    return VariableType.value;
  }

  CriterionType get criteriaType {
    if (this == CriterionType.plainText.key) {
      return CriterionType.plainText;
    }

    return CriterionType.variable;
  }

  Color? get colorFromName {
    if (this == 'green') {
      return Colors.green;
    }

    if (this == 'red') {
      return Colors.red;
    }

    return null;
  }
}
