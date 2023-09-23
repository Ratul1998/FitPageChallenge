import 'dart:convert';

import 'package:fir_page_challenge/constants/keys.dart';
import 'package:fir_page_challenge/models/data_model.dart';
import 'package:flutter/services.dart';

mixin DataService {
  Future<List<StocksData>> getStocksData() async {
    final data = await rootBundle.loadString(Keys.dataKey);

    List<dynamic> stocksData = jsonDecode(data);

    return stocksData.map((e) => StocksData.fromJson(e)).toList();
  }
}
