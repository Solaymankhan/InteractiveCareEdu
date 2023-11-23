import 'package:flutter/material.dart';

class expandedText extends StatelessWidget {
  expandedText(
      {Key? key,
      required this.txt,
      required this.maxLine,
      required this.size,
      required this.weight})
      : super(key: key);

  var txt, maxLine, size, weight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        txt,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        style: TextStyle(fontSize: size, fontWeight: weight),
      ),
    );
  }
}
