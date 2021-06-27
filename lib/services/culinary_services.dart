import 'package:flutter/material.dart';
import 'package:tourpedia/models/culinaries_explore_model.dart';
import 'package:tourpedia/models/culinaries_random_model.dart';
import 'package:tourpedia/models/tourism_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:tourpedia/utils/settings.dart';

class CulinaryServices {
  Future<TourismDetailModel?> getDataTourismDetail(int id) async {
    String url = Settings.urlBackend + '/api/destinations/' + id.toString();
    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: {"Accept": "aplication/json"});
      if (response.statusCode == 200) {
        debugPrint("data tourism success");
        final tourismDetailModel = tourismDetailModelFromJson(response.body);
        return tourismDetailModel;
      } else {
        debugPrint("error status " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      debugPrint("error catch $e");
      return null;
    }
  }

  Future<CulinariesExploreModel?> getDataCulinariesExplore() async {
    String url = Settings.urlBackend + '/api/culinaries';
    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: {"Accept": "aplication/json"});
      if (response.statusCode == 200) {
        debugPrint("data tourism success");
        final culinariesExploreModel =
            culinariesExploreModelFromJson(response.body);
        return culinariesExploreModel;
      } else {
        debugPrint("error status " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      debugPrint("error catch $e");
      return null;
    }
  }

  Future<CulinariesRandomModel?> getDataCulinariesRandom() async {
    String url = Settings.urlBackend + '/api/culinaries/random';
    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: {"Accept": "aplication/json"});
      if (response.statusCode == 200) {
        debugPrint("data tourism success");
        final culinariesRandomModel =
            culinariesRandomModelFromJson(response.body);
        return culinariesRandomModel;
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
