import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
 
 final String hint;
 final bool obscure;
 final IconData icon;
 
 InputField({this.hint, this.obscure, this.icon});
 
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      border: Border(
       bottom: BorderSide(
        color: Colors.white,
       ),
      ),
     ),
     child: TextFormField(
      obscureText: obscure,
      style: TextStyle(
       color: Colors.white,
      ),
      decoration: InputDecoration(
       border: InputBorder.none,
       icon: Icon(icon, color: Colors.white,),
       hintText: hint,
       hintStyle: TextStyle(color: Colors.white, fontSize: 15,),
       contentPadding: EdgeInsets.fromLTRB(5, 30, 30, 30)
      ),
     ),
    );
  }
}
