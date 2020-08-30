import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'screens/home.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: HomeScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    );
  }
}
