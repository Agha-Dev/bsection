import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static Future store() async {
    final db = FirebaseFirestore.instance.collection("data");
    await db.doc().set({"name": "Abu bakar", "hobby": "Nice Handsome Guy"});
  }

  static Future get() async {
    final db = FirebaseFirestore.instance.collection("data");
    final doc = await db.doc("6WoeHq746J6kJ75t4JEF").get();
    print(doc.data());
  }
}
