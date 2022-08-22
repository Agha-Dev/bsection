import 'package:bsection/button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Buttons(),
    );
  }
}

class Fields extends StatefulWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  bool error = false;
  TextEditingController cont = TextEditingController();
  String country = "";
  String city = "";
  String state = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid)),
                  width: 100,
                  child: CountryCodePicker(
                    onChanged: print,
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'pk',

                    // optional. Shows only country name and flag
                    showCountryOnly: true,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                ),
                SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: cont,
                      maxLength: 10,
                      onEditingComplete: () {
                        if (cont.text.length != 10) {
                          setState(() {
                            error = true;
                          });
                        } else {
                          setState(() {
                            error = false;
                          });
                        }
                      },
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Field is empty";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ))
              ],
            ),
            error == true ? const Text("Invalid Number") : const Text(""),
            const SizedBox(
              height: 20,
            ),
            SelectState(
              onCountryChanged: (value) {
                setState(() {
                  country = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  state = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  city = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
