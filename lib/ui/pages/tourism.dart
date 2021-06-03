import 'package:flutter/material.dart';
import 'package:tourpedia/ui/widgets/custom_header.dart';

class Tourism extends StatefulWidget {
  final GestureTapCallback? onTap;
  const Tourism({Key? key, this.onTap}) : super(key: key);

  @override
  _TourismState createState() => _TourismState();
}

class _TourismState extends State<Tourism> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomHeader(searchTap: widget.onTap),
          const Text('data'),
        ],
      ),
    );
  }
}
