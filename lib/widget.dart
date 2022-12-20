import 'package:flutter/material.dart';
import 'package:mevolve/sizes.dart';

import 'formmater.dart';

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

Widget result(double sHeight, double sWidth, String date, Function? onTap) {
  return Container(
    height: resHeight(42, sHeight),
    width: resWidth(148.6, sWidth),
    decoration: BoxDecoration(
        color: Color(0xFFEDF8FF),
        borderRadius: BorderRadius.circular(15)
    ),
    child: Padding(
      padding:EdgeInsets.only(left: resHeight(16, sHeight), right: resHeight(16, sHeight)),
      child: Row(
        children: [
          Icon(Icons.calendar_today_outlined, color: Color(0xFF1DA1F2), size: resHeight(14, sHeight),),
          SizedBox(width: resWidth(8, sWidth),),
          Text(shortDate(date), style: TextStyle(color: Color(0xFF1DA1F2), fontSize: resHeight(14, sHeight))),
          SizedBox(width: resWidth(8, sWidth),),
          GestureDetector(
              onTap: onTap as void Function()?,
              child: Icon(Icons.remove, color: Color(0xFF1DA1F2), size: resHeight(13, sHeight),))
        ],
      ),
    ),
  );
}