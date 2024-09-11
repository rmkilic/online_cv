// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/widget/text/index.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CustomTabItem extends ConsumerWidget {
   CustomTabItem({super.key, required this.index, required this.autoScrollController});
  final int index;
  final AutoScrollController autoScrollController;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int activeIndex = ref.watch(providerActiveIndex);
    Color iconColor = Theme.of(context).iconTheme.color!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                _scrollToIndex(index, ref);
              
                },
                child: ListTile(
                  leading: Icon(_getIcon(index),  color: activeIndex == index ? iconColor : iconColor.withOpacity(.6),),
                  title: TextTitleMedium(text: tabMenuItem[index], isMultiLang: true,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: SizedBox(
                  width: constraint.maxWidth*.2,
                  height: 1.0,
                  child:  ColoredBox(color: activeIndex == index ? context.dividerColor : Colors.transparent),
                ),
              )
              
            ],
          );
        }
      ),
    );
  }
    IconData _getIcon(int index)
  {
    switch(index)
    {
      case 0:
        return IconEnums.about.icon;
      case 1:
        return IconEnums.experience.icon;
      case 2:
        return IconEnums.resume.icon;
      case 3:
        return IconEnums.projects.icon;
      default:
        return IconEnums.skipNext.icon;
    }
  }

      Future _scrollToIndex(int index, WidgetRef ref) async {
    await autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
        autoScrollController.highlight(index);
        ref.read(providerActiveIndex.notifier).state = index;
        
  }

      List<String> tabMenuItem = [
    LocaleKeys.general_about,
    LocaleKeys.general_experience,
    LocaleKeys.general_references,
    LocaleKeys.general_resume,
    LocaleKeys.general_projects
  ];
  }
