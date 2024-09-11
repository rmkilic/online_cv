
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextTitleSmall extends StatelessWidget {
  const TextTitleSmall({super.key, required this.text, this.color , this.fontSize, this.fontWeight, this.letterSpacing, this.textAlign, this.isMultiLang = false });
  final String? text;
  final Color ?color;
  final double ?fontSize;
  final FontWeight ?fontWeight;
  final double ?letterSpacing;
  final TextAlign ?textAlign;
  final bool isMultiLang;

  @override
  Widget build(BuildContext context) {
        if(isMultiLang)
    {
      return Text(text ?? "", textAlign: textAlign, style: Theme.of(context).textTheme.titleSmall!.copyWith( fontSize: fontSize, fontWeight: fontWeight , letterSpacing: letterSpacing, color: color,),).tr();

    }
    else
    {
      return Text(text ?? "", textAlign: textAlign, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: fontSize, fontWeight: fontWeight  , letterSpacing: letterSpacing, color: color ,),);


    }
  }
}