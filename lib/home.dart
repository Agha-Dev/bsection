import 'package:cloud_firestore/cloud_firestore.dart';
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
            StreamBuilder<QuerySnapshot>(
                stream: null,
                builder: (context, snapshot) {
                  snapshot.data!.docs..forEach((element) {});
                  return Container(
                    height: 250,
                    width: 200,
                    color: Colors.amberAccent,
                  );
                })
          ],
        ),
      ),
    );
  }
}
