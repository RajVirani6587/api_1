import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class shopsecode_Screen extends StatefulWidget {
  const shopsecode_Screen({Key? key}) : super(key: key);

  @override
  State<shopsecode_Screen> createState() => _shopsecode_ScreenState();
}

class _shopsecode_ScreenState extends State<shopsecode_Screen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300, 
        color: Colors.black,
        child: Image.network("${Provider.of(context,listen: false).Datapick?.image}"),
      ),
    );
  }
}
