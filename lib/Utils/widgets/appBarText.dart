import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../functions/hexColor.dart';

class appBarText extends StatelessWidget {
  appBarText({Key? key,required this.txt}) : super(key: key);
  String txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18),
    );
  }
}
