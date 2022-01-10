import 'package:flutter/material.dart';
import 'package:nosavewa/pages/homeview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      color: Colors.deepOrangeAccent,
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
