import 'package:fir_page_challenge/constants/routes.dart';
import 'package:fir_page_challenge/extensions/string_extensions.dart';
import 'package:fir_page_challenge/models/data_model.dart';
import 'package:fir_page_challenge/service/data_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with DataService {
  List<StocksData> stocks = [];

  bool loading = true;

  @override
  void initState() {
    getStocksData().then((value) => setState(() {
          loading = false;
          stocks.addAll(value);
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Visibility(
          visible: !loading,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: stocks
                  .map((e) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.criteriaPage,
                              arguments: {
                                'criterion': e.criteria,
                                'title': e.name
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.name),
                              Text(
                                e.tag,
                                style: TextStyle(
                                    fontSize: 10, color: e.color.colorFromName),
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
