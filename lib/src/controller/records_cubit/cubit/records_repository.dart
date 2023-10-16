import 'dart:convert';

import 'package:contacts_app/src/models/records.dart';
import 'package:flutter/services.dart' show rootBundle;

class RecordsRepository {
  Future<List<dynamic>?> getData() async {
    try {
      //Reading the JSON Array file
      String rawData = await rootBundle.loadString("assets/data/records.json");
      //Decoding JSON Array String to List<Map>
      List<dynamic> decodeData = jsonDecode(rawData);
    } catch (ex) {
      return null;
    }
    return null;
  }

  map(RecordModel Function(dynamic item) param0) {}
}
