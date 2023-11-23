import 'package:flutter/material.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:velocity_x/velocity_x.dart';

class colorButton extends StatelessWidget {
  colorButton({Key? key,required this.txt,required this.onTap,required this.height,required this.width}) : super(key: key);

  var onTap,txt,height,width;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: hexColor(interactive_color_1_hex),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: height,
          width: width,
          child: Text(
            txt,
            style: TextStyle(
                fontSize: 13.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ).box.alignCenter.make(),
        ),
      ),
    );
  }
}
