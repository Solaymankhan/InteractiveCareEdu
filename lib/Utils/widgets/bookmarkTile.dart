import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class bookmarkTile extends StatelessWidget {
  bookmarkTile(
      {Key? key,
      required this.time,
      required this.description,
      required this.onTap})
      : super(key: key);

  var time, description, onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time + ' sec',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        SizedBox(width: 5),
        Icon(CupertinoIcons.multiply, size: 18).onTap(onTap)
      ],
    )
        .constrainedBox(BoxConstraints(
          maxWidth: 250, // Set your maximum width here
        ))
        .centered()
        .box
        .color(Vx.gray200)
        .rounded
        .padding(EdgeInsets.only(left: 5, right: 5))
        .margin(EdgeInsets.only(left: 2, right: 2))
        .make();
  }
}
