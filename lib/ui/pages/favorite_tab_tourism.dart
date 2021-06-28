import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tourpedia/models/my_list_favorite_tourism_model.dart';
import 'package:tourpedia/services/favorite_services.dart';
import 'package:tourpedia/ui/pages/detail.dart';
import 'package:tourpedia/ui/widgets/card_explore.dart';

class FavoriteTabTourism extends StatefulWidget {
  const FavoriteTabTourism({Key? key}) : super(key: key);

  @override
  _FavoriteTabTourismState createState() => _FavoriteTabTourismState();
}

class _FavoriteTabTourismState extends State<FavoriteTabTourism> {
  MyListFavoriteTourismModel myListFavoriteModel = MyListFavoriteTourismModel(
      meta: Meta(code: 0, message: '', status: ''), data: []);

  bool loading = true;

  // ignore: unused_field
  late Future _data;

  Future<void> getDataFavoriteDestination() async {
    String token = SpUtil.getString('token', defValue: '')!;
    debugPrint('getDataFavoriteCulinary Jalan');
    await FavoriteServices()
        .getMyListFavoriteTourism(token: token)
        .then((value) {
      setState(() {
        myListFavoriteModel = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _data = getDataFavoriteDestination().whenComplete(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (loading)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: myListFavoriteModel.data.length,
              itemBuilder: (context, index) => CardExplore(
                imageURL:
                    'https://1.bp.blogspot.com/-q_aWwmxKbPA/YKCGnia76SI/AAAAAAAAK84/s2yqJl7U5eI1AFATqNqe9TeujZGgrIstQCLcBGAsYHQ/s1768/Screenshot%2Bfrom%2B2021-05-16%2B09-39-58.png',
                isFavorite: false,
                name: myListFavoriteModel.data[index].title,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detail(id: myListFavoriteModel.data[index].id),
                      ));
                },
              ),
            ),
    );
  }
}
