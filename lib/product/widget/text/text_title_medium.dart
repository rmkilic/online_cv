
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextTitleMedium extends StatelessWidget {
  const TextTitleMedium({super.key, required this.text, /* this.color ,  */this.fontSize, this.fontWeight, this.isMultiLang = false });
  final String? text;
 /*  final Color ?color; */
  final double ?fontSize;
  final FontWeight ?fontWeight;
  final bool isMultiLang;

  @override
  Widget build(BuildContext context) {
        if(isMultiLang)
    {
      return Text(text ?? "", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: fontSize, fontWeight: fontWeight,/*  color: color ?? Colors.white */),).tr();

    }
    else
    {
      return Text(text ?? "", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: fontSize, fontWeight: fontWeight ,/*  color: color ?? Colors.white */),);


    }
  }
}