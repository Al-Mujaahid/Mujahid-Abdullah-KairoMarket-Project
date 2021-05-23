import 'package:flutter/material.dart';

const Color primary = Colors.blue;

InputDecoration getInputDecoration({hintText}) {
  return InputDecoration(
    hintText: '$hintText'
  );
}