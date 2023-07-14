import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.greenAccent, // Set the primary color to accent green
      ),
      initialRoute: '/',
      routes: {
        '': (context) => BackgroundPage(),
        '/home': (context) => HomePage(),
      },
      home: BackgroundPage() ,
    );
  }
}

