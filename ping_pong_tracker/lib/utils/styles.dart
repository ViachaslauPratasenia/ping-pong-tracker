import 'package:flutter/material.dart';

var defaultTextButtonStyle = TextButton.styleFrom(
  padding: const EdgeInsets.all(16),
  textStyle: defaultTextStyle.copyWith(
    color: Colors.blue,
    fontSize: 24
  ),
);

var defaultTextStyle = const TextStyle(
  fontSize: 20,
);

const customInputDecoration = InputDecoration(
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(
    vertical: 4,
    horizontal: 12,
  ),
);

var defaultBoxDecoration = BoxDecoration(
  border: Border.all(color: Colors.black),
  borderRadius: BorderRadius.circular(8),
);
