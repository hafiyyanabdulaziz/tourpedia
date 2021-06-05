import 'package:flutter/material.dart';
import 'package:tourpedia/models/tourism_model.dart';
import 'package:tourpedia/services/tourism_services.dart';
import 'package:tourpedia/ui/widgets/card_explore.dart';
import 'package:tourpedia/ui/widgets/card_must_see.dart';
import 'package:tourpedia/ui/widgets/custom_header.dart';

class Tourism extends StatefulWidget {
  final GestureTapCallback? onTap;
  const Tourism({Key? key, this.onTap}) : super(key: key);

  @override
  _TourismState createState() => _TourismState();
}

class _TourismState extends State<Tourism> {
  TourismModel tourismModel = TourismModel();

  void getDataTourism() async {
    await TourismServices().getDataTourismExplore().then((value) {
      setState(() {
        tourismModel = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataTourism();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomHeader(
            searchTap: widget.onTap,
            type: Type.tourism,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: Text(
              'Must See',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const CardMustSee(),
                const CardMustSee(),
                const CardMustSee(),
                const CardMustSee(),
                const CardMustSee(),
                const CardMustSee(),
                const CardMustSee(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              'Explore',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          (tourismModel.data == null)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  //physics: const ClampingScrollPhysics(),
                  itemCount: tourismModel.data!.length,
                  itemBuilder: (context, index) => CardExplore(
                    imageURL: tourismModel.data![index].mainImage,
                    isFavorite: tourismModel.data![index].isFavorite,
                    name: tourismModel.data![index].name,
                  ),
                ),
          // const CardExplore(),
          // const CardExplore(),
          // const CardExplore(),
        ],
      ),
    );
  }
}
