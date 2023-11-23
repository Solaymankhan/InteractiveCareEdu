import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class circleIconButton extends StatelessWidget {
  circleIconButton({Key? key,required this.icon,this.iconColor,required this.bgColor,required this.onTap}) : super(key: key);

  var icon,iconColor,onTap,bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: bgColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
            height: 35, width: 35, child: Icon(icon,color: iconColor)),
      ),
    );
  }
}
