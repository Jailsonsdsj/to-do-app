import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:basic_crud/models/data.dart';

class FormController extends GetxController {
  RxList<Map<String, String>> data = RxList<Map<String, String>>([]);

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  Future<void> loadData() async {
    data.value = await Data.loadData();
  }

  addData(String title, String description) {
    var newData = {'title': title, 'description': description};
    updateData([...data, newData]);
  }

  removeData(int index) {
    data.removeAt(index);
    Data.updateData(data);
  }

  Future<void> updateData(List<Map<String, String>> newData) async {
    await Data.updateData(newData);
    data.value = newData;
  }
}
