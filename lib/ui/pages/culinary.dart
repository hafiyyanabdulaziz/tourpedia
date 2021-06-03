import 'package:flutter/material.dart';
import 'package:tourpedia/ui/widgets/card_explore.dart';
import 'package:tourpedia/ui/widgets/card_must_see.dart';
import 'package:tourpedia/ui/widgets/custom_header.dart';

class Culinary extends StatefulWidget {
  const Culinary({Key? key}) : super(key: key);

  @override
  _CulinaryState createState() => _CulinaryState();
}

class _CulinaryState extends State<Culinary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomHeader(
            searchTap: () {},
            type: Type.culinary,
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
          const CardExplore(),
          const CardExplore(),
          const CardExplore(),
        ],
      ),
    );
  }
}
