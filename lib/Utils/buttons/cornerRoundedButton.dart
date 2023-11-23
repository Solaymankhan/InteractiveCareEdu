import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class cornerRoundedButton extends StatelessWidget {
  cornerRoundedButton({Key? key,required this.text,required this.height,required this.width
    ,required this.txtColor,required this.bgColor,required this.onTap})
      : super(key: key);
  var height,width,text,onTap,txtColor,bgColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      color: bgColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: this.onTap,
        child: Text(
          text,
          style: TextStyle(
              color: txtColor, fontWeight: FontWeight.bold, fontSize: 12),
        )
            .centered()
            .box
            .height(height)
            .width(width)
            .customRounded(BorderRadius.all(Radius.circular(20)))
            .make(),
      ),
    );
  }
}