
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextBodyMedium extends StatelessWidget {
  const TextBodyMedium({super.key, required this.text, this.color , this.fontSize, this.fontWeight, this.letterSpacing, this.textAlign, this.textOverflow, this.fontStyle, this.isMultiLang = false });
  final String text;
  //final Color ?color;
  final double ?fontSize;
  final FontWeight ?fontWeight;
  final double ?letterSpacing;
  final TextAlign ?textAlign;
  final TextOverflow? textOverflow;
  final bool isMultiLang;
  final Color ?color;
  final FontStyle ?fontStyle;

  @override
  Widget build(BuildContext context) {
    if(isMultiLang)
    {
      return Text(text, overflow: textOverflow, textAlign: textAlign, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: fontStyle,fontSize: fontSize, fontWeight: fontWeight, letterSpacing: letterSpacing, color: color ),).tr();

    }
    else
    {
      return Text(text, overflow: textOverflow, textAlign: textAlign, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontStyle: fontStyle, fontSize: fontSize, fontWeight: fontWeight, letterSpacing: letterSpacing, color: color ,),);


    }
  }
}