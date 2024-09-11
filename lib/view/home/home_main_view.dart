import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/product/enums/lang_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/widget/page/loading_page.dart';
import 'package:online_cv/service/firebase_service.dart';
import 'package:online_cv/view/home/desktop/desktop_home_page_view.dart';
import 'package:online_cv/view/home/mobile/mobile_home_view.dart';


class HomeMainView extends ConsumerStatefulWidget {
  const HomeMainView({super.key});

  @override
  ConsumerState<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends ConsumerState<HomeMainView> {


  @override
  void initState() {
// storageRef = FirebaseStorage.instance.ref();
Timer(const Duration(seconds: 1), ()async
{
  LanguageEnums _locale = LanguageEnums.values.where((e) => e.localeCode == context.locale).toList().first;
  ref.read(provideLanguage.notifier).state = _locale;
  LanguageEnums activeLang = ref.watch(provideLanguage);
  ref.read(provideLoading.notifier).state = true;
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

    ref.read(provideLoading.notifier).state = false;
});
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(provideLoading);
    return 
    isLoading ?  const Scaffold(
      body: LoadingPage(),
    ):
    
    LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return const DesktopHomeView();
        } else {
          return const MobileHomeView();
        }
      },
    );
  }
}
