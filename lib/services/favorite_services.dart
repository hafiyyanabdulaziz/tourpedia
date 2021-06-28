import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourpedia/models/favorite_model.dart';
import 'package:tourpedia/utils/settings.dart';

class FavoriteServices {
  Future<bool?> checkFavoriteCulinary(
      {required int id, required String token}) async {
    String url = Settings.urlBackend +
        '/api/user/culinaries/check-favorite/' +
        id.toString();
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Accept": "aplication/json",
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        debugPrint("data favorite success");
        final favoriteModel = favoriteModelFromJson(response.body);
        return favoriteModel.data;
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
