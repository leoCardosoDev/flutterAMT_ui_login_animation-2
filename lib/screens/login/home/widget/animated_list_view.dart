import 'package:flutter/material.dart';
import 'package:loginanimation2app/screens/login/home/widget/list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Dedicação para desenvolver Apps',
          image: AssetImage('images/perfil.jpg'),
         margin: listSlidePosition.value * 2,
        ),
       ListData(
        title: 'Estudar Python e NodeJs',
        subtitle: 'Dedicação para desenvolver Apps',
        image: AssetImage('images/perfil.jpg'),
        margin: listSlidePosition.value * 1,
       ),
       ListData(
        title: 'Estudar Banco de Dados',
        subtitle: 'Dedicação para desenvolver Apps',
        image: AssetImage('images/perfil.jpg'),
        margin: listSlidePosition.value * 0,
       ),
      ],
    );
  }
}
