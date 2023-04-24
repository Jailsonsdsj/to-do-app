import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class Data {
  static List<Map<String, String>> _datas = [];

  static Future<List<Map<String, String>>> loadData() async {
    String dataString = await rootBundle.loadString('assets/data.json');
    List<dynamic> dataJson = json.decode(dataString);
    _datas = dataJson.map((dados) => Map<String, String>.from(dados)).toList();

    return _datas;
  } //method to load data from json file

  static Future<void> updateData(List<Map<String, String>> data) async {
    _datas = data;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/data.json');
    String dataString = json.encode(_datas);
    if (kDebugMode) {
      print(dataString);
    }
    await file.writeAsString(dataString);
  } //to update data from json file
}
