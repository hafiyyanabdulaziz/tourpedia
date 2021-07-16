import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/ui/widgets/custom_header.dart';
import 'package:tourpedia/ui/widgets/custom_search_bar.dart';
import 'package:tourpedia/utils/my_colors.dart';

enum WisataCategory { wisataBuatan, wisataAlam, wisataAir, wisataBinatang }

class TourismCategory extends StatefulWidget {
  final WisataCategory wisataCategory;

  const TourismCategory({Key? key, required this.wisataCategory})
      : super(key: key);

  @override
  _TourismCategoryState createState() => _TourismCategoryState();
}

class _TourismCategoryState extends State<TourismCategory> {
  String titleAppbar(WisataCategory wisataCategory) {
    if (wisataCategory == WisataCategory.wisataBuatan) {
      return 'Wisata Buatan';
    }
    if (wisataCategory == WisataCategory.wisataAlam) {
      return 'Wisata Alam';
    }
    if (wisataCategory == WisataCategory.wisataAir) {
      return 'Wisata Air';
    }
    return 'Wisata Binatang';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.bluePrimary,
        title: Text(titleAppbar(widget.wisataCategory)),
      ),
    );
  }
}
