import 'package:flutter/material.dart';
import 'package:flutter_stream_demo/ex1/home_ex1.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeEx1(),
    );
  }
}
