import 'package:flutter/material.dart';
import 'package:projeto/adicionar.dart';
import 'tela_login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
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
      routes: <String, WidgetBuilder>{
          "/adicionar": (BuildContext context) => new TelaAdicionar()
      },
    );
  }
}


