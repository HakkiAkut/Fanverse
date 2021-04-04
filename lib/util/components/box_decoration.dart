import 'package:flutter/material.dart';

/// base box decoration
final boxStyle = BoxDecoration(
  color: Colors.orange.shade900,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
