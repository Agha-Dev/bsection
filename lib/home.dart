import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(),
   body: Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Column(
  children: [

    Container(
      height: 250,
      width:200,
      color: Colors.amberAccent,
    ) 
  ],

    ),
   ),

    );
  }
}