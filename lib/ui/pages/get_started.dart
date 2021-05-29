import 'package:flutter/material.dart';
import 'package:tourpedia/ui/widgets/custom_button.dart';
import 'package:tourpedia/utils/my_colors.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Image(
            image: AssetImage('lib/assets/images/ilustration_get_started.png'),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              //height: 100,
              //margin: const EdgeInsets.only(top: 10),
              //transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: MyColors.bluePrimary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 25, color: MyColors.white),
                        children: [
                          TextSpan(text: "Let's start on vacation to "),
                          TextSpan(
                              text: "Bandung",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    // child: Text(
                    //   "Let's start on vacation to Bandung",
                    //   style: TextStyle(fontSize: 25, color: Colors.white),
                    //   textAlign: TextAlign.center,
                    // ),
                  ),
                  const CustomButton(
                    title: "halo",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
