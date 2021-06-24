import 'package:flutter/material.dart';
import 'package:tourpedia/models/tourism_model.dart';
import 'package:http/http.dart' as http;
import 'package:tourpedia/utils/settings.dart';

class TourismServices {
  Future<TourismModel?> getDataTourismExplore() async {
    String url = Settings.urlBackend + '/api/destinations';
    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: {"Accept": "aplication/json"});
      if (response.statusCode == 200) {
        debugPrint("data tourism success");
        final tourismModel = tourismModelFromJson(response.body);
        return tourismModel;
      } else {
        debugPrint("error status " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      debugPrint("error catch $e");
      return null;
    }
  }
}
