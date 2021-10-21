import 'package:flutter/material.dart';
import 'tela_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenFren',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: TelaLogin(),
    );
  }
}


