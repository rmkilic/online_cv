
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextTitleLarge extends StatelessWidget {
  const TextTitleLarge({super.key, required this.text, /* this.color , */ this.fontSize, this.fontWeight, this.letterSpacing, this.isMultiLang = false });
  final String? text;
  /* final Color ?color; */
  final double ?fontSize;
  final FontWeight ?fontWeight;
  final double ?letterSpacing;
  final bool isMultiLang;

  @override
  Widget build(BuildContext context) {
    if(isMultiLang)
    {
      return Text(text ?? "", overflow: TextOverflow.visible, style: Theme.of(context).textTheme.titleLarge!.copyWith(letterSpacing: letterSpacing, fontSize: fontSize, fontWeight: fontWeight ?? FontWeight.bold , /* color: color ?? Colors.white */),).tr();

    }
    else
    {
      return Text(text ?? "", overflow: TextOverflow.visible, style: Theme.of(context).textTheme.titleLarge!.copyWith(letterSpacing: letterSpacing, fontSize: fontSize, fontWeight: fontWeight ?? FontWeight.bold , /* color: color ?? Colors.white */),);


    }
  }
}