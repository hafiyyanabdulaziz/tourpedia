import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/utils/my_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final GestureTapCallback? searchTap;
  const CustomSearchBar({Key? key, required this.searchTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: searchTap,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: MyColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'Search',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 15,
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
