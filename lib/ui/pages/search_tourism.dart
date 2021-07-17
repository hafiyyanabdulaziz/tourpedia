import 'package:flutter/material.dart';
import 'package:tourpedia/models/search_tourism_model.dart';
import 'package:tourpedia/services/search_services.dart';
import 'package:tourpedia/ui/pages/detail_culinary.dart';
import 'package:tourpedia/ui/widgets/card_explore.dart';
import 'package:tourpedia/utils/my_colors.dart';
import 'package:tourpedia/utils/settings.dart';

class SearchTourism extends StatefulWidget {
  const SearchTourism({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _SearchTourismState createState() => _SearchTourismState();
}

class _SearchTourismState extends State<SearchTourism> {
  SearchTourismModel searchTourismModel = SearchTourismModel(
      meta: Meta(code: 0, message: '', status: ''), data: Data(data: []));

  bool loading = true;

  Future<void> getDataSearch() async {
    await SearchServices().getDataDestinationsSearch(widget.text).then((value) {
      setState(() {
        searchTourismModel = value!;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataSearch().whenComplete(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: MyColors.bluePrimary,
      ),
      body: (loading)
          ? const Center(child: CircularProgressIndicator())
          : (searchTourismModel.data.data.isEmpty)
              ? const Center(child: Text('Data tidak ada'))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: searchTourismModel.data.data.length,
                  itemBuilder: (context, index) => CardExplore(
                    imageURL: Settings.urlBackend +
                        '/storage/' +
                        searchTourismModel.data.data[index].images[0].linkImage,
                    isFavorite: false,
                    name: searchTourismModel.data.data[index].title,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailCulinary(
                                id: searchTourismModel.data.data[index].id),
                          ));
                    },
                  ),
                ),
    );
  }
}
