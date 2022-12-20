import 'package:flutter/material.dart';
import 'package:mevolve/sizes.dart';

Widget button(double sHeight, double sWidth, String text, Function? onTap) {
  return Padding(
    padding: EdgeInsets.only(left: resHeight(16, sHeight), right: resHeight(16, sHeight)),
    child: GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        height : resHeight(50, sHeight),
        width: resWidth(396, sWidth),
        decoration: BoxDecoration(
          color: Color(0xFF1DA1F2),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: resHeight(16, sHeight), color: Colors.white,
          fontWeight: FontWeight.w500, ),),
        ),
      ),
    ),
  );
}

Widget presetButton(bool action, double sHeight, double sWidth, String text, Function? onTap) {
  return Padding(
    padding: EdgeInsets.only(top: resHeight(24, sHeight)),
    child: GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        height : resHeight(35, sHeight),
        width: resWidth(174, sWidth),
        decoration: BoxDecoration(
            color: action ? const Color(0xFF1DA1F2): const Color(0xFFEDF8FF),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: resHeight(16, sHeight), color: action ? Colors.white : const Color(0xFF1DA1F2),
            fontWeight: FontWeight.w500, ),),
        ),
      ),
    ),
  );
}