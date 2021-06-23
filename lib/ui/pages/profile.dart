import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:tourpedia/ui/pages/get_started.dart';
import 'package:tourpedia/ui/widgets/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:tourpedia/utils/settings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
          child: CustomButton(
        title: 'LOGOUT',
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => FutureProgressDialog(
              _logout(),
              message: const Text('Loading'),
            ),
          );
        },
      )),
    );
  }

  Future _logout() async {
    String url = Settings.urlBackend + '/api/user/logout';
    String token = SpUtil.getString('token', defValue: '')!;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "aplication/json",
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.body);

        SpUtil.clear();

        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GetStarted(),
            ));
      } else {
        throw ('Logout Gagal');
      }
    } catch (e) {
      debugPrint("error catch $e");
      showTopSnackBar(context, CustomSnackBar.error(message: e.toString()));
      return null;
    }
  }
}
