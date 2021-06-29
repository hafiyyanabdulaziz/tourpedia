import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import 'package:tourpedia/models/user_model.dart';
import 'package:tourpedia/ui/widgets/bottom_tab_bar.dart';
import 'package:tourpedia/ui/widgets/custom_button.dart';
import 'package:tourpedia/utils/my_colors.dart';
import 'package:http/http.dart' as http;
import 'package:tourpedia/utils/settings.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();

  bool canLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.greyOne,
      body: ListView(
        children: [
          // ignore: avoid_unnecessary_containers
          Stack(
            children: [
              Container(
                color: MyColors.white,
                child: const Image(
                  //color: MyColors.white,
                  image: AssetImage(
                      'lib/assets/images/ilustration_login_register.png'),
                ),
              ),
              TouchableOpacity(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: MyColors.white,
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
            ],
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: TextField(
              controller: textEditingControllerEmail,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "Email Address",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
            child: TextField(
              controller: textEditingControllerPassword,
              obscureText: true,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "Password",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
          ),
          Center(
              child: CustomButton(
            title: 'LOGIN',
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => FutureProgressDialog(
                  _login(),
                  message: const Text('Loading'),
                ),
              );
              (canLogin) ? Navigator.pop(context) : null;
              (canLogin)
                  ? Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomTabBar(),
                      ))
                  : null;
            },
          )),
        ],
      ),
    );
  }

  Future _login() async {
    String url = Settings.urlBackend + "/api/user/login";
    try {
      if (textEditingControllerEmail.text.isEmpty &&
          textEditingControllerPassword.text.isEmpty) {
        showTopSnackBar(
            context,
            const CustomSnackBar.error(
                message: 'Email dan Password harus diisi'));
        return null;
      }

      http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Accept": "aplication/json"},
        body: {
          "email": textEditingControllerEmail.text,
          'password': textEditingControllerPassword.text
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.body);

        final userModel = userModelFromJson(response.body);
        SpUtil.putString('token', userModel.data.accessToken);
        SpUtil.putString('email', userModel.data.user.email);
        SpUtil.putString('name', userModel.data.user.name);
        (userModel.data.user.phone != null)
            ? SpUtil.putString('phone', userModel.data.user.phone)
            : null;
        SpUtil.putString('photo', userModel.data.user.profilePhotoUrl);
        SpUtil.putInt('id', userModel.data.user.id);

        canLogin = true;

        return '';

        // showTopSnackBar(context,
        //     CustomSnackBar.info(message: textEditingControllerPassword.text));

      } else {
        throw ('Email atau Password salah');
      }
    } catch (e) {
      debugPrint("error catch $e");
      showTopSnackBar(context, CustomSnackBar.error(message: e.toString()));
      return null;
    }
  }
}
