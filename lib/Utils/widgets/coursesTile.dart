import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Utils/widgets/colorButton.dart';
import 'package:interactive_cares_edu/Utils/widgets/expandedText.dart';
import 'package:velocity_x/velocity_x.dart';

class coursesTile extends StatelessWidget {
  const coursesTile(
      {Key? key,
      required this.image,
      required this.text,
      required this.buttonText,
      required this.buttonTap})
      : super(key: key);

  final image, text, buttonText, buttonTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
            width: 90,
            height: 60,
            fit: BoxFit.cover,
            image: AssetImage(image)),
        SizedBox(width: 5),
        expandedText(
            txt: text,
            maxLine: 2,
            size: 13.0,
            weight: FontWeight.w500),
        colorButton(
            txt: buttonText,
            height: 25.0,
            width: 120.0,
            onTap: buttonTap).marginOnly(right: 5),
      ],
    )
        .box
        .height(60)
        .margin(EdgeInsets.only(top: 2.5, bottom: 2.5))
        .color(Vx.gray100)
        .customRounded(BorderRadius.all(Radius.circular(2)))
        .make();
  }
}
