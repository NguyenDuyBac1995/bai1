import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/colors.dart';

class Common {
  TextFormField textFromField({String labelValue = "",
    String hintValue = "",
    bool? validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? textStyle,
    String? validationError,
    bool obscureText = false,
    bool isReadOnly = false,
    Widget? icons,
    Widget? suffixIcon,
    FocusNode? fn,
    VoidCallback? callBackSearch,
    VoidCallback? callback,
    String? text,
  }) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
      obscureText: obscureText,
      focusNode: fn,
      onChanged: (String? val) {
        val = text;
        callBackSearch;
      },
      validator: (String? val) {
        if (validation!) {
          if (val!.isEmpty) {
            return validationError;
          }
        }
      },
      decoration: InputDecoration(
        hintText: hintValue,
        prefixIcon: icons,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0.5, color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.5, color: Colors.black38),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
    return textFormField;
  }

  GestureDetector ButtonStyle({
    String? textValue,
    Color? color,
    double? width,
    VoidCallback? callback,
    bool icon = true,
  }) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( textValue??'',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(width: 5),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ) ,
          ],
        ),
      ),
      onTap: () {
        callback;
      },
    );
  }
  void showToastSuccess(String str) {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.white,
        textColor: Colors.blue,
        fontSize: 16.0);
  }
}