import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:pray_for_an_hour/models/prayer_model.dart';

Future<String> _loadPrayerAsset() async {
  // return await rootBundle.loadString('assets/data/dev.json');
  return await rootBundle.loadString('assets/data/default.json');
}

Future loadPrayer() async {
  print('👋 Requested data');
  String jsonPrayer = await _loadPrayerAsset();
  final jsonResponse = json.decode(jsonPrayer);
  PrayersList prayersList = PrayersList.fromJson(jsonResponse);
  return prayersList;
}
