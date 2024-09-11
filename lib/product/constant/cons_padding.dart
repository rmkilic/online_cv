import 'package:flutter/material.dart';
import 'package:online_cv/core/extension/context_extension.dart';

class ConsPadding extends EdgeInsets{
   ///Page Padding  => Screen Width .1
   ConsPadding.pagePadding(BuildContext context):super.symmetric(horizontal: context.width*.1);

   ConsPadding.subPagePadding(BuildContext context):super.only(left: context.width*.03);

  


}