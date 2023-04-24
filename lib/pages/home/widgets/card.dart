import 'package:flutter/material.dart';

Container cardTitle(title) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.all(10),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Container buttonsContainer() {
  return Container(
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
  );
}
