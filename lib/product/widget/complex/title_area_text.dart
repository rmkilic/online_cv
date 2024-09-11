import 'package:flutter/material.dart';
import 'package:online_cv/core/constant/cons_application.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/product/widget/text/index.dart';

class TitleTextArea extends StatelessWidget {
  const TitleTextArea({super.key, required this.titleText, this.isMultiLang = false});
  final String titleText;
  final bool isMultiLang;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextHeadlineLarge(text: titleText,isMultiLang: isMultiLang, /*  color: ConsColor.bolumBaslikRengi, */ fontWeight: FontWeight.w700,),
        const SizedBox(height: 10,),
        
        SizedBox(
          width:  context.width < ConsApplication.DESKTOPWIDTH ? context.width*.13 : context.width*.03,
          height: 10,
          child: const Divider()
         // color: ConsColor.turquoise,
        ),
      ],
    );
  }


}