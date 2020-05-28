import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:loginanimation2app/screens/login/home/widget/animated_list_view.dart';
import 'package:loginanimation2app/screens/login/home/widget/fade_container.dart';
import 'package:loginanimation2app/screens/login/home/widget/home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({this.controller})
      : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease),
        listSlidePosition = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          end: EdgeInsets.only(bottom: 80),
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Interval(
                0.325,
                0.8,
                curve: Curves.ease,
              )),
        ),
        fadeColor = ColorTween(
          begin: Color.fromRGBO(247, 84, 106, 1),
          end: Color.fromRGBO(247, 84, 106, 0),
        ).animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color> fadeColor;

  Widget _buildAnimation(BuildContext context, Widget widget) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            HomeTop(
              containerGrow: containerGrow,
            ),
            AnimatedListView(
              listSlidePosition: listSlidePosition,
            ),
          ],
        ),
        IgnorePointer(child: FadeContainer(fadeColor: fadeColor,)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}
