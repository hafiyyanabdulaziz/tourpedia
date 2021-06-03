import 'package:flutter/material.dart';
import 'package:tourpedia/ui/widgets/custom_button.dart';
import 'package:tourpedia/utils/my_colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyOne,
      body: ListView(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            color: MyColors.white,
            child: const Image(
              //color: MyColors.white,
              image: AssetImage(
                  'lib/assets/images/ilustration_login_register.png'),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 30,
                color: MyColors.white,
              ),
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: MyColors.greyOne,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      height: 2,
                      margin: const EdgeInsets.only(top: 2),
                      width: 70,
                      color: MyColors.bluePrimary,
                    ),
                  ],
                ),
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'REGISTER',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      height: 2,
                      margin: const EdgeInsets.only(top: 2),
                      width: 100,
                      color: MyColors.bluePrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "Email Address",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "Password",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
          ),
          Center(
              child: CustomButton(
            title: 'LOGIN',
            onTap: () {},
          )),
        ],
      ),
    );
  }
}
