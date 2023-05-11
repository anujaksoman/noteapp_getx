import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp_getx/add_note.dart';
import 'package:noteapp_getx/controller/note_controller.dart';
import 'package:noteapp_getx/database/database_helper.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {

  final noteController = Get.put(NoteController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
            Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.to(AddNote());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add New Note",style: TextStyle(fontSize: 14,color: Colors.blue),),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Icon(Icons.add,color: Colors.white,),
                    )
                  ],
                ),
              ),
              Obx(()=>
                  noteController.isLoading.value==true?Container(child: CircularProgressIndicator(),):noteController.dataList!.length>0?ListView.builder(
                  shrinkWrap: true,
                  itemCount: noteController.dataList!.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 70,
                      padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),

                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(noteController.dataList![index]["note_text"].toString()),
                              ),

                              Text(noteController.dataList![index]["note_date"])
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ):
                  Container(
                    child:Text("No Data Found")
                  ))
            ],
          ),
        )

      ),
    );
  }



}
