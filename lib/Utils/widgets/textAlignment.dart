import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class textAlignment extends StatelessWidget {
  textAlignment({Key? key,required this.txt,required this.alignment}) : super(key: key);

  var txt,alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: this.alignment,
        child:Text(
          txt,
          style: TextStyle(
              fontSize: 13.0,
              color: Vx.gray600,
              fontWeight: FontWeight.w500),
        )
    );
  }
}
