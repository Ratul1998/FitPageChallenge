import 'package:fir_page_challenge/constants/routes.dart';
import 'package:fir_page_challenge/utils/navigation_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Page Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.homePage,
    );
  }
}
