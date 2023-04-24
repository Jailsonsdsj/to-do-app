import 'package:basic_crud/pages/home/controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class BindingHome implements Bindings {
  @override
  void dependencies() {
    Get.put(FormController());
  }
}
