import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class logo_image extends StatelessWidget {
  logo_image({Key? key,required this.img}) : super(key: key);
  var img;
  @override
  Widget build(BuildContext context) {
    return Image(height: 110, width: 110, image: AssetImage(img))
        .box
        .roundedFull
        .make();
  }
}
