import 'package:flutter/material.dart';
import 'package:tourpedia/models/culinaries_explore_model.dart';
import 'package:tourpedia/services/culinary_services.dart';
import 'package:tourpedia/services/tourism_services.dart';
import 'package:tourpedia/ui/pages/detail.dart';
import 'package:tourpedia/ui/widgets/card_explore.dart';
import 'package:tourpedia/ui/widgets/card_must_see.dart';
import 'package:tourpedia/ui/widgets/custom_header.dart';
import 'package:tourpedia/models/tourism_model_random.dart' as tourism_random;
import 'package:tourpedia/utils/settings.dart';

class Culinary extends StatefulWidget {
  const Culinary({Key? key}) : super(key: key);

  @override
  _CulinaryState createState() => _CulinaryState();
}

class _CulinaryState extends State<Culinary> {
  tourism_random.TourismModelRandom tourismModelRandom =
      tourism_random.TourismModelRandom(
          meta: tourism_random.Meta(code: 0, message: '', status: ''),
          data: tourism_random.Data(item: []));

  CulinariesExploreModel culinariesExploreModel = CulinariesExploreModel(
      meta: Meta(code: 0, status: '', message: ''),
      data: Data(favorite: 0, item: [], total: 0));

  bool loadingExplore = true;
  bool loadingRandom = true;

  Future<void> getDataCulinariesExplore() async {
    await CulinaryServices().getDataCulinariesExplore().then((value) {
      setState(() {
        culinariesExploreModel = value!;
      });
    });
  }

  Future<void> getDataTourismRandom() async {
    await TourismServices().getDataTourismRandom().then((value) {
      setState(() {
        tourismModelRandom = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataTourismRandom().whenComplete(() => loadingRandom = false);
    getDataCulinariesExplore().whenComplete(() => loadingExplore = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomHeader(
            itemTotal: 0,
            searchTap: () {},
            type: Type.culinary,
            favoriteTotal: 0,
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
            child: (loadingRandom)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
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
          (loadingExplore)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: culinariesExploreModel.data.item.length,
                  itemBuilder: (context, index) => CardExplore(
                    imageURL: Settings.urlBackend +
                        '/storage/' +
                        culinariesExploreModel
                            .data.item[index].images[0].linkImage,
                    isFavorite: false,
                    name: culinariesExploreModel.data.item[index].title,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(
                                id: culinariesExploreModel.data.item[index].id),
                          ));
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
