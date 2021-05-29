import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:tourpedia/utils/my_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Container(
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width - 40,
        height: 40,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13),
              topRight: Radius.circular(13),
              bottomLeft: Radius.circular(13),
              bottomRight: Radius.circular(13)),
          color: MyColors.button,
        ),
      ),
    );
  }
}
