import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:basic_crud/models/data.dart';

class FormController extends GetxController {
  var data = <Map<String, String>>[].obs;

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  addData(String title, String description) {
    data.add({'title': title, 'description': description});
    Data.updateData(data);
  }

  removeData(int index) {
    data.removeAt(index);
    Data.updateData(data);
  }

  updateData(int index, String title, String description) {
    data[index]['title'] = title;
    data[index]['description'] = description;
    Data.updateData(data);
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<List<Map<String, String>>> loadData() async {
    List<Map<String, String>> data = await Data.loadData();
    this.data.value = data;
    return data;
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}

// class DataController extends GetxController {
//   RxList<Map<String, String>> data = RxList<Map<String, String>>([]);

//   Future<void> loadData() async {
//     await Data.loadData();
//     data.value = Data.data;
//   }

//   void updateData(List<Map<String, String>> newData) {
//     Data.updateData(newData);
//     data.value = newData;
//   }
// }
