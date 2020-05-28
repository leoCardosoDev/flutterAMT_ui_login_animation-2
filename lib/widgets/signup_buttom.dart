import 'package:flutter/material.dart';

class SignupButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 160),
      onPressed: () {},
      child: Text(
        'Não possui uma conta? Cadastre-se!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
