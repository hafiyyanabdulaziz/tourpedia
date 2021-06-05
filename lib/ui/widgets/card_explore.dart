import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/utils/my_colors.dart';

class CardExplore extends StatelessWidget {
  final String? imageURL;
  final String? name;
  final bool? isFavorite;
  const CardExplore(
      {Key? key,
      required this.imageURL,
      required this.name,
      required this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(imageURL!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: MyColors.bluePrimary.withOpacity(0.75),
                ),
                child: Text(
                  name!,
                  style: const TextStyle(
                    color: MyColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: TouchableOpacity(
                onTap: () {},
                child: const Icon(
                  Icons.favorite,
                  size: 35,
                  color: MyColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
