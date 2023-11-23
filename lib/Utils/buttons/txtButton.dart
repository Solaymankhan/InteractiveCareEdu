import 'package:flutter/material.dart';
import 'package:get/get.dart';

class txtButton extends StatelessWidget {
  txtButton({Key? key,required this.txt,required this.txtColor,required this.fontSize
    ,required this.onTap}) : super(key: key);

  var onTap,txt,txtColor,fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          txt,
          style: TextStyle(
              fontSize: fontSize,
              color: txtColor,
              fontWeight: FontWeight.w500),
        ).paddingOnly(left: 5, right: 5),
      ),
    );
  }
}
