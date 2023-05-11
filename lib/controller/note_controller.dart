

import 'package:get/get.dart';
import 'package:noteapp_getx/database/database_helper.dart';

class NoteController extends GetxController{
 final dbHelper = DatabaseHelper.instance;
 List<dynamic>? dataList = [];
 RxBool isLoading = false.obs;

 NoteController(){
  getNoteData();
 }

 getNoteData() async {
  isLoading.value = true;
  dataList = await dbHelper.queryAllRows();
  print("dataList=$dataList");
  isLoading.value = false;
  return dataList;
 }


}