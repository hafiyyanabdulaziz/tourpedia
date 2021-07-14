import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/models/tourism_detail_model.dart';
import 'package:tourpedia/services/favorite_services.dart';
import 'package:tourpedia/services/tourism_services.dart';
import 'package:tourpedia/ui/widgets/card_must_see.dart';
import 'package:tourpedia/ui/widgets/image_slider.dart';
import 'package:tourpedia/ui/widgets/maps.dart';
import 'package:tourpedia/utils/my_colors.dart';
import 'package:tourpedia/utils/settings.dart';
import 'package:tourpedia/models/tourism_model_random.dart' as tourism_random;

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TourismDetailModel tourismDetailModel = TourismDetailModel(
      meta: Meta(code: 0, status: '', message: ''),
      data: Data(
          id: 0,
          title: '',
          description: '',
          linkMaps: '',
          images: [],
          address: '',
          category: '',
          contact: '',
          time: ''));

  bool loading = true;
  bool isFavorite = false;

  tourism_random.TourismModelRandom tourismModelRandom =
      tourism_random.TourismModelRandom(
          meta: tourism_random.Meta(code: 0, message: '', status: ''),
          data: tourism_random.Data(item: []));

  Future<void> getDataDetailTourism() async {
    await TourismServices().getDataTourismDetail(widget.id).then((value) {
      setState(() {
        tourismDetailModel = value!;
      });
    });
    _convertImages();
  }

  Future<void> getDataTourismRandom() async {
    await TourismServices().getDataTourismRandom().then((value) {
      setState(() {
        tourismModelRandom = value!;
      });
    });
  }

  Future<void> getStatusFavorite() async {
    String token = SpUtil.getString('token', defValue: '')!;
    await FavoriteServices()
        .checkFavoriteDestination(id: widget.id, token: token)
        .then((value) {
      setState(() {
        isFavorite = value!;
      });
    });
  }

  Future<void> sendFavorite() async {
    String token = SpUtil.getString('token', defValue: '')!;
    await FavoriteServices()
        .sendFavoriteDestination(id: widget.id, token: token);
  }

  @override
  void initState() {
    getDataTourismRandom();
    getStatusFavorite();
    getDataDetailTourism().whenComplete(() => loading = false);
    super.initState();
  }

  List<String> _convertImages() {
    List<String> images = [];
    for (var item in tourismDetailModel.data.images) {
      images.add(Settings.urlBackend + '/storage/' + item.linkImage);
    }
    debugPrint(images.toString());
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            backgroundColor: MyColors.white,
            body: ListView(
              children: [
                Stack(
                  children: [
                    ImageSlider(images: _convertImages()),
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
                          onTap: () {
                            Navigator.pop(context);
                          },
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
                          onTap: () {
                            setState(() {
                              sendFavorite();
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: (isFavorite)
                                  ? MyColors.button
                                  : MyColors.white,
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 15),
                  child: Text(
                    tourismDetailModel.data.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     // ignore: prefer_const_literals_to_create_immutables
                //     children: [
                //       /**
                //  * REVIEW
                //  */
                //       Column(
                //         children: [
                //           Row(
                //             // ignore: prefer_const_literals_to_create_immutables
                //             children: [
                //               const Icon(
                //                 Icons.star_rounded,
                //                 size: 30,
                //                 color: MyColors.button,
                //               ),
                //               const Text(
                //                 '4.5',
                //                 style: TextStyle(fontSize: 18),
                //               ),
                //             ],
                //           ),
                //           const Text(
                //             '20 Ulasan',
                //             style: TextStyle(fontSize: 14),
                //           ),
                //         ],
                //       ),
                //       Column(
                //         // ignore: prefer_const_literals_to_create_immutables
                //         children: [
                //           const Icon(
                //             Icons.favorite_border,
                //             size: 30,
                //           ),
                //           const Text('15 Favorites'),
                //         ],
                //       ),
                //     ],
                //   ),
                /**
           * ABOUT
           */
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  child: Text(
                    'Tentang',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 20),
                  child: Text(
                    tourismDetailModel.data.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Maps(url: tourismDetailModel.data.linkMaps),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
                  child: Text(
                    'Rekomendasi Lainnya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: tourismModelRandom.data.item.length,
                      itemBuilder: (context, index) => CardMustSee(
                            image: tourismModelRandom
                                .data.item[index].images[0].linkImage,
                            title: tourismModelRandom.data.item[index].title,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(
                                        id: tourismModelRandom
                                            .data.item[index].id),
                                  ));
                            },
                          )),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 20, right: 20, top: 20, bottom: 5),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     // ignore: prefer_const_literals_to_create_immutables
                //     children: [
                //       const Text(
                //         'Rating dan Ulasan',
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //       ElevatedButton(
                //         onPressed: () {},
                //         child: const Text('Buat Ulasan'),
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20),
                //   child: Row(
                //     // ignore: prefer_const_literals_to_create_immutables
                //     children: [
                //       const Icon(
                //         Icons.star_rounded,
                //         size: 25,
                //         color: MyColors.button,
                //       ),
                //       const Text(
                //         '4.5 / 5',
                //         style: TextStyle(fontSize: 15),
                //       ),
                //     ],
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(left: 20),
                //   child: Text(
                //     '20 Ulasan',
                //     style: TextStyle(fontSize: 14),
                //   ),
                // ),
                // const CardRating(),
                // const CardRating(),
                // const CardRating(),
                // const CardRating(),
                // const CardRating(),
                const SizedBox(height: 50),
              ],
            ),
          );
  }
}
