import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:basic_crud/pages/home/controller.dart';

void showForm(BuildContext context) {
  final formController = Get.put(FormController());

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Task'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              String title = titleController.text;
              String description = descriptionController.text;
              formController.addData(title, description);
              titleController.clear();
              descriptionController.clear();

              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
