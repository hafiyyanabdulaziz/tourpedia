import 'package:flutter/material.dart';
import 'package:tourpedia/models/tourism_model.dart';
import 'package:http/http.dart' as http;

class TourismServices {
  Future<TourismModel?> getDataTourismExplore() async {
    String url = "https://api.jsonbin.io/b/60bb007892164b68bec0756d";
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
