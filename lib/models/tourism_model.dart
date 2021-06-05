// To parse this JSON data, do
//
//     final tourismModel = tourismModelFromJson(jsonString);

import 'dart:convert';

TourismModel tourismModelFromJson(String str) =>
    TourismModel.fromJson(json.decode(str));

String tourismModelToJson(TourismModel data) => json.encode(data.toJson());

class TourismModel {
  TourismModel({
    this.data,
    this.message,
  });

  List<Datum>? data;
  String? message;

  factory TourismModel.fromJson(Map<String, dynamic> json) => TourismModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.mainImage,
    this.name,
    this.isFavorite,
  });

  int? id;
  String? mainImage;
  String? name;
  bool? isFavorite;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        mainImage: json["main_image"],
        name: json["name"],
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main_image": mainImage,
        "name": name,
        "is_favorite": isFavorite,
      };
}
