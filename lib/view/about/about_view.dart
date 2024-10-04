import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/constant/cons_application.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/models/about_model.dart';
import 'package:online_cv/product/constant/cons_padding.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/widget/complex/title_area_text.dart';
import 'package:online_cv/product/widget/text/index.dart';
import 'package:online_cv/product/widget/text/text_body_medium.dart';
import 'package:online_cv/view/about/components/profile_image.dart';

part 'components/personal_info.dart';
part 'components/skills_info.dart';



class AboutView extends ConsumerStatefulWidget {
  const AboutView({super.key});

  @override
  ConsumerState<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends ConsumerState<AboutView> {
  

  @override
  Widget build(BuildContext context) {

    return _body;
  }

  Widget get _body
  {
   About? about = ref.watch(provideAbout);
    return Padding(
      padding: ConsPadding.pagePadding(context),
      child: SizedBox(
        height: context.width < ConsApplication.DESKTOPWIDTH ? 1600 : 800,
        width: context.width ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const TitleTextArea(titleText: LocaleKeys.general_aboutMe, isMultiLang:true),
              SizedBox(
                height: context.height * 0.07,
              ),
              _page(about)
          ],
        ),
      ),
    );
  }

  Widget _page(About? item)
  {
    return  Expanded(
      child: Padding(
        padding: ConsPadding.subPagePadding(context),
        child: Column(
          children: [
        TextBodyMedium(text: item?.description ?? ""),
        const SizedBox(height: 40.0,),
        context.width < ConsApplication.DESKTOPWIDTH ?
          _mobile(item) : _desktop(item)
        
        
          ],
        ),
      ),
    );
  }

  Widget _desktop(About ? item)
  {
    return Expanded(child: Row(
        children: [
          SizedBox(
            width: context.width/5,
            height: context.height,
            child: const AspectRatio(
              aspectRatio: 3.2,
              child: ProfileImage(),),
          ),
          SizedBox(width: context.width*.05,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Expanded(child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _PersonalInfo(about: item,)),
                    Expanded(child: _SkillsInfo(skills: item?.skills ?? []))
          
                  ],
                ),
                )
            ],
          ),
          )
        ],
      ),
      );
  }


  Widget _mobile(About ?item)
  {
    return Expanded(
      child: Column(
          children: [
            
            
            SizedBox(
              width: context.width*.8,
              height: context.width*.8,
              child: const AspectRatio(
                aspectRatio: 3.2,
                child: ProfileImage(),),
            ),
            SizedBox(width: context.width*.1,),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PersonalInfo(about: item,),
                  Expanded(child:_SkillsInfo(skills: item?.skills ?? []))
                ],
              ),
            )
          ],
        ),
    );
  }


   
   





}

