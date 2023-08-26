import 'package:flutter/material.dart';

class AppButtons {
  static Widget button1(text, textColor, backColor, width, function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: backColor),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Sk-Modernist',
                  fontSize: 16,
                  color: textColor)),
        ),
      ),
    );
  }
}
