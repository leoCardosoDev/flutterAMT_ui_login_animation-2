import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({@required this.controller})
      : buttonSqueeze = Tween(
          begin: 320.0,
          end: 60.0,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.150),
        )),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1, curve: Curves.bounceOut),
        ));

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget widget) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: buttonZoomOut.value <= 60
            ? _buildContainer(
                width: buttonSqueeze.value,
                height: 60.0,
                alignment: Alignment.center,
                borderRadius: BorderRadius.circular(30),
                widget: _buildInside(context))
            : _buildContainer(
                width: buttonZoomOut.value,
                height: buttonZoomOut.value,
                alignment: null,
                borderRadius: null,
                widget: Container()),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75)
      return Text(
        'Sign in',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      );
    else
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
  }

  Widget _buildContainer(
      {double width,
      double height,
      Alignment alignment,
      BorderRadius borderRadius,
      Widget widget}) {
    return Hero(
      tag: 'fade',
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 84, 106, 1),
          borderRadius: borderRadius,
        ),
        child: widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: buttonSqueeze,
      builder: _buildAnimation,
    );
  }
}
