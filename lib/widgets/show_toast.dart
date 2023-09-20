import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/constants.dart';
import 'package:flutter/material.dart';
class ShowToast{
  static void showToastMessage({required String message}) {
    Fluttertoast.showToast(msg: '$message',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: PrimaryColor,
    fontSize: 16,
    textColor: Colors.black,
    );
  }
}