import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageService{

  static successMessage(String message){
    return Fluttertoast.showToast(
        msg: message,
         toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green,
      timeInSecForIosWeb: 1,
       textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static errorMessage(String message){
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  static waringMessage(String message){
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: const Color(0xFFF8A232),
      timeInSecForIosWeb: 1,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }


}