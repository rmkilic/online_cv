
import 'package:flutter/material.dart';


extension BuildContextExtension<T> on BuildContext
{


  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;


  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get dividerColor => Theme.of(this).dividerTheme.color!;

}