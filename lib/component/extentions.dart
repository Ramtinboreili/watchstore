
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizedBoxExtention on double {
  SizedBox get height => SizedBox(height: toDouble(),);
  SizedBox get width => SizedBox(width: toDouble(),);
  
}

extension Intigerextention on int {

  String get seppratWithComma {
    final numberformat = NumberFormat.decimalPattern();
    return numberformat.format(this);
  }
}