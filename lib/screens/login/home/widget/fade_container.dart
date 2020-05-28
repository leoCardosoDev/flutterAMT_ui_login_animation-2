import 'package:flutter/material.dart';

class FadeContainer extends StatelessWidget {
 final Animation<Color> fadeColor;
 
 FadeContainer({this.fadeColor});
  @override
  Widget build(BuildContext context) {
    return Hero(
     tag: 'fade',
     child: Container(
      decoration: BoxDecoration(
       color: fadeColor.value
      ),
     ),
    );
  }
}
