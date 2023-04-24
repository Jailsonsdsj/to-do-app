import 'package:flutter/material.dart';

SizedBox largeButton(String title, action) {
  return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            action();
          },
          child: Text(title)));
}
