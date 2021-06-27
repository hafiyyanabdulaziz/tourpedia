import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/utils/my_colors.dart';
import 'package:tourpedia/utils/settings.dart';

class CardMustSee extends StatelessWidget {
  final String image;
  final String title;
  final GestureTapCallback onTap;
  const CardMustSee(
      {Key? key, required this.image, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(Settings.urlBackend + '/storage/' + image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: MyColors.bluePrimary.withOpacity(0.75),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: MyColors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 10,
            child: TouchableOpacity(
              onTap: () {},
              child: const Icon(
                Icons.favorite,
                size: 30,
                color: MyColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
