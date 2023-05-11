

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_getx/database/database_helper.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final dbHelper = DatabaseHelper.instance;
  TextEditingController dataText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Add New Note",style: TextStyle(color: Colors.blue,fontSize: 16),),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: dataText,
              decoration: InputDecoration(
                hintText: "Enter Note",
              ),
              maxLines: 5,
            ),

            SizedBox(height: 50,),

            ElevatedButton(
                onPressed: (){

                  var rng = new Random();
                  var code = rng.nextInt(900000) + 100000;
                  Map<String,dynamic> noteData = {
                    DatabaseHelper.columnId : code,
                    DatabaseHelper.columnNote : dataText.text,
                    DatabaseHelper.columnDate: DateTime.now().toIso8601String()
                  };
                  dbHelper.insert(noteData);
                  Get.close(1);
                  
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
