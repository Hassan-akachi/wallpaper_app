import 'package:flutter/material.dart';

const kSearchEditTextDecoration=InputDecoration(
  hintText: 'search wallpaper',
  hintStyle: TextStyle(color: Colors.grey),
  fillColor: Color(0xFFE3F2FD),
  filled: true,
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.transparent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTextstyle = TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25);