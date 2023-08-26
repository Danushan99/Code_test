import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prac_test/common/app_colors.dart';

Widget vertical(double height) {
  return SizedBox(height: height);
}

Widget horizontal(double width) {
  return SizedBox(width: width);
}

Widget slidePoint(Color color) {
  return Container(
    height: 8,
    width: 8,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}

gradient7() {
  return const LinearGradient(colors: [
    Color.fromARGB(255, 212, 245, 249),
    Color.fromARGB(255, 212, 245, 249)
  ]);
}

gradient3() {
  return const LinearGradient(colors: [Colors.blue, Colors.green]);
}

Future<bool?> successToast(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.greenColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<bool?> failedToast(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.redColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
