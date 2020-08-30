import 'package:flutter/material.dart';
import 'package:todo_app_clone/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: kPrimaryYellow,
          )
        ],
      ),
    );
  }
}
