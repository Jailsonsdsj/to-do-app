import 'package:basic_crud/pages/home/controller.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:basic_crud/pages/home/widgets/addTask.dart';
import 'package:get/get.dart';
import '../../components/largeButton.dart';
import '../../pages/home/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FormController _formController = Get.put(FormController());

  final RxList _data = [].obs;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    List<Map<String, String>> data = await _formController.loadData();
    setState(() {
      _data.value = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            largeButton("Add Task", () {
              showForm(context);
            }),
            Obx(
              () => ListView.builder(
                  itemCount: _data.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 2,
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {},
                          child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  cardTitle(_data[index]["title"]),
                                  buttonsContainer()
                                ],
                              )),
                        ));
                  }),
            )
          ],
        ));
  }
}
