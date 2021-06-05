import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/ui/widgets/card_rating.dart';
import 'package:tourpedia/ui/widgets/image_slider.dart';
import 'package:tourpedia/ui/widgets/maps.dart';
import 'package:tourpedia/ui/widgets/stars_in_rating.dart';
import 'package:tourpedia/utils/my_colors.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              const ImageSlider(),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 15,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TouchableOpacity(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: MyColors.white,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.only(top: 20, left: 20),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  ),
                  TouchableOpacity(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: MyColors.white,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.only(top: 20, right: 20),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          /**
           * NAME
           */
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 15),
            child: Text(
              'Gunung Tangkuban Perahu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              /**
               * REVIEW
               */
              Column(
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 30,
                        color: MyColors.button,
                      ),
                      const Text(
                        '4.5',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const Text(
                    '20 Ulasan',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                  const Text('15 Favorites'),
                ],
              ),
            ],
          ),
          /**
           * ABOUT
           */
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: Text(
              'Tentang',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Scelerisque adipiscing in aliquet turpis ut amet. Mattis fermentum, purus nisi, id eget. Eget lacus, facilisis fermentum odio sagittis, mattis euismod quam. Urna habitant amet lectus cursus senectus ultricies risus feugiat. Fusce netus interdum hac vehicula gravida tempus leo volutpat eu. Neque quisque nisi, vestibulum molestie faucibus vestibulum a massa. Pretium risus, augue eget ut. In mauris, porttitor risus eget sed accumsan tellus.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Maps(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Rating dan Ulasan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buat Ulasan'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(
                  Icons.star_rounded,
                  size: 25,
                  color: MyColors.button,
                ),
                const Text(
                  '4.5 / 5',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '20 Ulasan',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const CardRating(),
          const CardRating(),
          const CardRating(),
          const CardRating(),
          const CardRating(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
