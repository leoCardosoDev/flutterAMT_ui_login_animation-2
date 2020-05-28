import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final List<String> categories = [
    'Meditar',
    'Estudar',
    'Treinar',
    'Trabalhar',
  ];

  int _category = 0;

  void selectForward() {
    setState(() {
      _category++;
    });
  }

  void selectBackward() {
    setState(() {
     _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
           disabledColor: Colors.white24,
            onPressed: _category > 0 ? selectBackward : null,
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          Text(
            categories[_category].toUpperCase(),
            style: TextStyle(
                color: Colors.white, letterSpacing: 1.2, fontSize: 18, fontWeight: FontWeight.w300),
          ),
          IconButton(
           disabledColor: Colors.white24,
            onPressed: _category < categories.length -1 ? selectForward : null,
            icon: Icon(Icons.arrow_forward_ios),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
