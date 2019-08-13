//import 'package:book_app/screens/home_widget.dart';
import 'package:book_app/screens/splashscreen.dart';
import 'package:book_app/screens/walkthrough.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      // Establecer OpenSans como la fuente predeterminada de la aplicación
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Colors.white,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/walkthrough': (BuildContext context) => AppTutorial()
      },
    );
  }
}