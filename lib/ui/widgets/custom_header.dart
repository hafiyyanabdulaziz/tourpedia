import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourpedia/ui/widgets/custom_search_bar.dart';
import 'package:tourpedia/utils/my_colors.dart';

class CustomHeader extends StatefulWidget {
  final GestureTapCallback? searchTap;
  const CustomHeader({Key? key, required this.searchTap}) : super(key: key);

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Image(
          image: AssetImage('lib/assets/images/background_custom_header.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /**
                   * SEARCH
                   */
            CustomSearchBar(searchTap: widget.searchTap),
            /**
                   * TOURISM BANDUNG
                   */
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 24, color: MyColors.black),
                  children: [
                    TextSpan(text: "TOURISM "),
                    TextSpan(
                        text: "BANDUNG",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyColors.blueSecondary)),
                  ],
                ),
              ),
            ),
            /**
                   * YOUR TRIP
                   */
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 6),
              child: Text(
                'Your Trip',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            /**
                   * CONTAINER BANDUNG
                   */
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width - 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/city_bandung.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    /**
                           * TEXT BANDUNG 2021
                           */
                    const Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        'BANDUNG 2021',
                        style: TextStyle(
                          color: MyColors.greyOne,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /**
                               * LOCATION
                               */
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: MyColors.blueThird,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            '15 Locations',
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        /**
                               * Favorite
                               */
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: MyColors.blueThird,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            '10 Favorites',
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
