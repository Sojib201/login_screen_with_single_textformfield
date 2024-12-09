import 'package:flutter/material.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);
const colorOrange = Color.fromRGBO(230, 126, 34, 1.0);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1.0);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);
const colorLight = Color.fromRGBO(211, 211, 211, 1.0);

TextStyle Head1Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'popins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle Head6Text(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontFamily: 'popins',
    fontWeight: FontWeight.w400,
  );
}

TextStyle HeadText7(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 13,
    fontFamily: 'popins',
    fontWeight: FontWeight.w400,
  );
}

TextStyle HeadText9(textColor) {
  return TextStyle(
    color: textColor,
    fontSize: 9,
    fontFamily: 'popins',
    fontWeight: FontWeight.w400,
  );
}

InputDecoration PasswordInputDeceration(label, hinttext, Widget icon,icon1) {
  return InputDecoration(
    prefixIcon: icon,
    suffixIcon: icon1,
    filled: true,
    fillColor: colorWhite.withOpacity(0.2),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorLightGray, width: 3),
    ),
    labelText: label,
    hintText: hinttext,
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorLightGray, width: 2),
    ),
    //fillColor: colorWhite,
    //filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
  );
}

InputDecoration EmailInputDeceration1(label, hinttext, Widget icon) {
  return InputDecoration(
    prefixIcon: icon,
    filled: true,
    fillColor: colorWhite.withOpacity(0.2),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorLightGray, width: 3),
    ),
    labelText: label,
    hintText: hinttext,
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorLightGray, width: 2),
    ),
    //fillColor: colorWhite,
    //filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
    elevation: 2,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

TextStyle ButtonTextStyle() {
  return TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400);
}

Ink SuccessButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(
        color: colorGreen, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: ButtonTextStyle(),
      ),
    ),
  );
}




ButtonStyle AppStatusButtonStyle(btnColor) {
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: btnColor,
  );
}
