import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/models/tourism_detail_model.dart';
import 'package:tourpedia/services/tourism_services.dart';
import 'package:tourpedia/ui/widgets/image_slider.dart';
import 'package:tourpedia/ui/widgets/maps.dart';
import 'package:tourpedia/utils/my_colors.dart';
import 'package:tourpedia/utils/settings.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TourismDetailModel tourismDetailModel = TourismDetailModel(
      meta: Meta(code: 0, status: '', message: ''),
      data: Data(id: 0, title: '', description: '', linkMaps: '', images: []));
  bool loading = true;

  Future<void> getDataDetailTourism() async {
    await TourismServices().getDataTourismDetail(widget.id).then((value) {
      setState(() {
        tourismDetailModel = value!;
      });
    });
    _convertImages();
  }

  @override
  void initState() {
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
