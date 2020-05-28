import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginanimation2app/screens/login/home/home_screen.dart';
import 'package:loginanimation2app/widgets/form_container.dart';
import 'package:loginanimation2app/widgets/signup_buttom.dart';
import 'package:loginanimation2app/widgets/stagger_animation.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
 
 AnimationController _animationController;
 
 
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
     vsync: this,
     duration: Duration(seconds: 2)
    );
    _animationController.addStatusListener((status) {
     if(status == AnimationStatus.completed)
      Navigator.of(context).pushReplacement(MaterialPageRoute(
       builder: (context) => HomeScreen()
      ));
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
   _animationController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
             alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 70, bottom: 32),
                      child: Image.asset(
                        'images/tickicon.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                    FormContainer(),
                    SignupButtom(),
                  ],
                ),
               StaggerAnimation(controller: _animationController.view),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
