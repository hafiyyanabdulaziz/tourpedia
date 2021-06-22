import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  String? token = '';
  @override
  void initState() {
    token = SpUtil.getString('token');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('halo'),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(token!),
          const Text('data'),
        ],
      ),
    );
  }
}
