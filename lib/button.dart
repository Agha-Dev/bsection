import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool check = false;
  bool privacy = false;
  int a = 0;
  int group = 1;
  int b = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Checkbox(
                      value: check,
                      onChanged: (v) {
                        setState(() {
                          check = v!;
                        });
                      }),
                ),
                const Text("I accept the terms and Condtions")
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Checkbox(
                      value: privacy,
                      onChanged: (v) {
                        setState(() {
                          privacy = v!;
                        });
                      }),
                ),
                const Text("I accept the Privacy & Policy")
              ],
            ),
            Radio(
                value: a,
                groupValue: group,
                onChanged: (v) {
                  setState(() {
                    b = 0;
                    a = 1;
                  });
                }),
            Radio(
                value: b,
                groupValue: group,
                onChanged: (v) {
                  setState(() {
                    b = 1;
                    a = 0;
                  });
                }),
             Card(
              shadowColor: Colors.pinkAccent,
              elevation: 15.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                // child: Text("Abu Bakar"),
                child:Container(
                height:300, 
                width:250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Column(
                  children: [
                     SizedBox(height:100 ,),
                    Text("Abubakar"),
                  ],
                )

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
