import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: YellowBird(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: const Text("Press"), onPressed: () async {});
  }
}

class YellowBird extends StatefulWidget {
  const YellowBird({Key? key}) : super(key: key);

  @override
  State<YellowBird> createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  var data;
  @override
  Widget build(BuildContext context) {
    return data == null
        ? ElevatedButton(
            child: const Text("Press"),
            onPressed: () async {
              const url = "https://api.imgflip.com/get_memes";
              final response = await http.get(Uri.parse(url));
              if (response.statusCode == 200) {
                final apiData = jsonDecode(response.body);
                final memeData = apiData['data']['memes'];
                print(memeData);
                setState(() {
                  data = memeData;
                });
              }
            })
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    alignment: Alignment.center,
                    width: data[index]['width'].toDouble(),
                    height: data[index]['height'].toDouble(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data[index]['url']))),
                    child: Text(
                      "${data[index]['name']}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ));
            });
  }
}
