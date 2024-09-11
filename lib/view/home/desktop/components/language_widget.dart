import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/product_localization.dart';
import 'package:online_cv/product/enums/lang_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/service/firebase_service.dart';

class LanguageWidget extends ConsumerStatefulWidget {
  const LanguageWidget({super.key});

  @override
  ConsumerState<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends ConsumerState<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: LanguageEnums.values.length *50,
      width: 50,
      child: Column(
        children: List.generate(LanguageEnums.values.length, (index)=>_flag(LanguageEnums.values[index])),
      ),
    );
  }

  _flag(LanguageEnums lang)
  {
    LanguageEnums activeLang = ref.watch(provideLanguage);
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ()async
      {
          ProductLocalization.updateLanguage(context: context, value: lang);
          ref.read(provideLanguage.notifier).state = lang;
           LanguageEnums activeLang = ref.watch(provideLanguage);
           await FirebaseService().getPrograms(activeLang).then((value)
          {
            ref.read(provideProgramList.notifier).state = value;
          });
          await FirebaseService().getAbout(activeLang).then((value)
          {
            ref.read(provideAbout.notifier).state = value;
          });
    
          await FirebaseService().getExperience(activeLang).then((value)
          {
            ref.read(provideExperienceList.notifier).state = value;
          });
          await FirebaseService().getReferences(activeLang).then((value)
          {
            ref.read(provideReferences.notifier).state = value;
          });
          await FirebaseService().getResume(activeLang).then((value)
          {
            ref.read(provideResume.notifier).state = value;
          });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: Container(
          decoration: BoxDecoration(
        border: Border.all(
          width: 1.2,
          color: lang.countryCode == activeLang.countryCode ? context.dividerColor : Colors.transparent
          
        ),
        borderRadius: BorderRadius.circular(6)
      ),
      padding: const EdgeInsets.all(2),
          width: 40,
          height: 30,
          child: AspectRatio(
            aspectRatio: 1.8,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: CountryFlag.fromCountryCode(lang.countryCode, shape: const RoundedRectangle(6),),
            ),
          ),
        ),
      ),
    );
  }

}



