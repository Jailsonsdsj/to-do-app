import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Crud Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Basic Crud'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var data = [
      {
        'title': 'title1',
        'description': 'description1',
        'image': 'image1',
        'nagivationId': '1',
      },
      {
        'title': 'title2',
        'description': 'description2',
        'image': 'image2',
        'nagivationId': '2',
      },
      {
        'title': 'title3',
        'description': 'description3',
        'image': 'image3',
        'nagivationId': '3',
      }
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint("add");
                    },
                    child: const Text("Add Task"))),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: 2,
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          debugPrint("tapped on ${data[index]["title"]}");
                        },
                        child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.all(15),
                                  child: Text(
                                      data[index]["title"] ?? "Not Found",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        iconSize: 30,
                                        icon: const Icon(Icons.done),
                                        color: Colors.blue[800],
                                        onPressed: () {
                                          debugPrint("done");
                                        },
                                      ),
                                      // IconButton(
                                      //   iconSize: 25,
                                      //   icon: const Icon(Icons.edit),
                                      //   onPressed: () {
                                      //     debugPrint("edit");
                                      //   },
                                      // ),
                                      IconButton(
                                        iconSize: 30,
                                        icon: const Icon(Icons.delete),
                                        color: Colors.grey[500],
                                        onPressed: () {
                                          debugPrint("delete");
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ));
                },
                itemCount: data.length),
          ],
        ));
  }
}
