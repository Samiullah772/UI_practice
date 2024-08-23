import 'package:flutter/material.dart';

import 'Details_Screen/Detail_UI.dart';
import 'Home_Screen/Home_UI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: detai_Screen(),
    );
  }
}