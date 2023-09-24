import 'package:fir_page_challenge/constants/routes.dart';
import 'package:fir_page_challenge/screens/criteria_page.dart';
import 'package:fir_page_challenge/screens/home_page.dart';
import 'package:fir_page_challenge/screens/variable_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  dynamic arguments = settings.arguments;

  switch (settings.name) {
    case Routes.criteriaPage:
      return MaterialPageRoute(
          builder: (_) => CriteriaPage(
              criterion: arguments['criterion'], title: arguments['title']));
    case Routes.variablePage:
      return MaterialPageRoute(
          builder: (_) => VariablePage(
              variableData: arguments['variableData'],
              title: arguments['title']));
    default:
      return MaterialPageRoute(builder: (_) => const MyHomePage());
  }
}
