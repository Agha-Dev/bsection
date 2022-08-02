import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({Key? key}) : super(key: key);

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  List<String> options = ["Male", "Female"];
  String selected = "Room";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DateTimePicker(
                readOnly: true,
                dateMask: "dd-MM-yyyy",
                initialValue: DateTime.now().toString(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'Date',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(hintText: "Gender"),
                items: options.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (v) {
                  print(v);
                }),
            // DropdownButton(
            //     hint: const Text("Gender"),
            //     value: selected,
            //     items: options.map((String items) {
            //       return DropdownMenuItem(
            //         value: items,
            //         child: Text(items),
            //       );
            //     }).toList(),
            //     //   items: options.map((String option){
            //     //   return DropdownMenuItem(
            //     //     value: option,
            //     //     child: Text(option));
            //     // }).toList(),
            //     onChanged: (v) {
            //       setState(() {
            //         selected = v.toString();
            //       });
            //     })
          ],
        ),
      ),
    );
  }
}
