import 'package:a/util/my_button.dart';
import 'package:flutter/material.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,


  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orangeAccent,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

          //get user input

          TextField(
            controller:controller ,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"add a new task",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,


            children: [
            MyButton(text: "save", onPressed: onSave),
            const SizedBox(width: 8),
            MyButton(text: "cancel", onPressed: onCancel),

          ],)


        ],),
      ),
    );
  }
}
