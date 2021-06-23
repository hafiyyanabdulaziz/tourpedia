import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:tourpedia/models/tourism_model.dart';
import 'package:tourpedia/models/user_model.dart';
import 'package:tourpedia/ui/widgets/bottom_tab_bar.dart';
import 'package:tourpedia/ui/widgets/custom_button.dart';
import 'package:tourpedia/utils/my_colors.dart';
import 'package:tourpedia/utils/settings.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  TextEditingController textEditingControllerRetypePassword =
      TextEditingController();

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
          Column(
            children: [
              const Text(
                'REGISTER',
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
              controller: textEditingControllerName,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "Nama",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: TextField(
              controller: textEditingControllerPhone,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "No Telephone",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: TextField(
              controller: textEditingControllerPassword,
              obscureText: true,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "Password",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
            child: TextField(
              controller: textEditingControllerRetypePassword,
              obscureText: true,
              decoration: const InputDecoration(
                  fillColor: Colors.amber,
                  labelText: "Retype Password",
                  labelStyle: TextStyle(color: MyColors.black, fontSize: 15)),
            ),
          ),
          Center(
              child: CustomButton(
            title: 'REGISTER',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => FutureProgressDialog(
                  _register(),
                  message: const Text('Loading'),
                ),
              );
            },
          )),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Future<TourismModel?> _register() async {
    String url = Settings.urlBackend + "/api/user/register";
    try {
      if (textEditingControllerEmail.text.isEmpty &&
          textEditingControllerPassword.text.isEmpty &&
          textEditingControllerRetypePassword.text.isEmpty &&
          textEditingControllerName.text.isEmpty &&
          textEditingControllerPhone.text.isEmpty) {
        showTopSnackBar(
            context, const CustomSnackBar.error(message: 'Semua Harus diisi'));
        return null;
      }

      if (textEditingControllerPassword.text !=
          textEditingControllerRetypePassword.text) {
        showTopSnackBar(
            context,
            const CustomSnackBar.error(
                message: 'Password dan Retype Password harus sama'));
        return null;
      }

      http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Accept": "aplication/json"},
        body: {
          "email": textEditingControllerEmail.text,
          'password': textEditingControllerPassword.text,
          'name': textEditingControllerName.text,
          'phone': textEditingControllerPhone.text
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.body);

        final userModel = userModelFromJson(response.body);
        SpUtil.putString('token', userModel.data.accessToken);
        SpUtil.putString('email', userModel.data.user.email);
        SpUtil.putString('name', userModel.data.user.name);
        SpUtil.putString('photo', userModel.data.user.profilePhotoUrl);
        SpUtil.putInt('id', userModel.data.user.id);
        Navigator.pop(context);

        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomTabBar(),
            ));

        // showTopSnackBar(context,
        //     CustomSnackBar.info(message: textEditingControllerPassword.text));

      }
      if (response.statusCode == 500) {
        throw ('Email sudah terdaftar sebelumnya');
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
