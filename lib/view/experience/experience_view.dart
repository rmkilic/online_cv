import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/models/experience_model.dart';
import 'package:online_cv/product/constant/cons_padding.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/widget/complex/title_area_text.dart';
import 'package:online_cv/product/widget/text/index.dart';
import 'package:online_cv/product/widget/text/text_body_medium.dart';


class ExperienceView extends ConsumerStatefulWidget {
  const ExperienceView({super.key});

  @override
  ConsumerState<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends ConsumerState<ExperienceView> {
  @override
  Widget build(BuildContext context) {
    List<Experience> experienceList = ref.watch(provideExperienceList);
    return Padding(
      padding: ConsPadding.pagePadding(context),
      child: SizedBox(
        height: context.height*.6,
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleTextArea( titleText: LocaleKeys.general_experience, isMultiLang: true,),
            SizedBox(
              height: context.height * 0.07,
            ),
            Expanded(child: _page(experienceList))
            //_body,
          ],
        ),
      ),
    ); }



  Widget _page(List<Experience> item)
  {
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) => _listItem(item[index]));
  }

  Widget _listItem(Experience item)
  {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Row(
            children: [
              Icon( item.endYear.isEmpty ? IconEnums.circleDot.icon : IconEnums.circle.icon ,  color:  item.endYear.isEmpty ? context.dividerColor : context.dividerColor.withOpacity(.4),),
              const SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraint.maxWidth*.8,
                    child: TextTitleLarge(text: item.name, /* color: ConsColor.cream, */)),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: constraint.maxWidth *.8,
                    child: TextTitleSmall(text: item.position, /* color: Colors.white54, */)),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      TextBodyMedium(text: "${item.startYear} - ",/*  color: Colors.white38, */),
                      TextBodyMedium(text: item.endYear.isEmpty ? (LocaleKeys.general_present) : (item.endYear), isMultiLang: item.endYear.isEmpty,/*  color: Colors.white38 */)

                    ],
                  ),
                ],
              )
            ],
          );
        }
      ),
    );
  }

}
