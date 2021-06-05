import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            //width: 250,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage('lib/assets/images/ilustration_maps.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 20, right: 20),
                //height: 200,
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: const Text(
                  'Lihat Lokasi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
