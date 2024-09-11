import 'package:flutter/material.dart';
import 'package:online_cv/product/widget/text/index.dart';

class AppBarTitle extends StatelessWidget {
  
  final String text;
  final bool isMultiLang;

  const AppBarTitle({super.key, required this.text, this.isMultiLang = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0,), 
        child: TextTitleSmall(text: text, textAlign: TextAlign.center, letterSpacing: 3.0, /* color: ConsColor.cream, */ isMultiLang: isMultiLang,)
      ),
    );
  }
}