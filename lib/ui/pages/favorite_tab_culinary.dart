import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tourpedia/models/my_list_favorite_model.dart';
import 'package:tourpedia/services/favorite_services.dart';
import 'package:tourpedia/ui/pages/detail_culinary.dart';
import 'package:tourpedia/ui/widgets/card_explore.dart';

class FavoriteTabCulinary extends StatefulWidget {
  const FavoriteTabCulinary({Key? key}) : super(key: key);

  @override
  _FavoriteTabCulinaryState createState() => _FavoriteTabCulinaryState();
}

class _FavoriteTabCulinaryState extends State<FavoriteTabCulinary> {
  MyListFavoriteModel myListFavoriteModel = MyListFavoriteModel(
      meta: Meta(code: 0, message: '', status: ''), data: []);

  bool loading = true;

  // ignore: unused_field
  late Future _data;

  Future<void> getDataFavoriteCulinary() async {
    String token = SpUtil.getString('token', defValue: '')!;
    debugPrint('getDataFavoriteCulinary Jalan');
    await FavoriteServices()
        .getMyListFavoriteCulinary(token: token)
        .then((value) {
      setState(() {
        myListFavoriteModel = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _data = getDataFavoriteCulinary().whenComplete(() => loading = false);
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
                        builder: (context) => DetailCulinary(
                            id: myListFavoriteModel.data[index].id),
                      ));
                },
              ),
            ),
    );
  }
}
