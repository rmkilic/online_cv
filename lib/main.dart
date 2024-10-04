import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/init/lang/product_localization.dart';
import 'package:online_cv/core/init/theme/index.dart';
import 'package:online_cv/firebase_options.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/view/home/home_main_view.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await EasyLocalization.ensureInitialized();
  runApp(ProductLocalization(child: const ProviderScope(child:  MyApp())));

}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RMK CV',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: ref.watch(provideThemeLight) ? ThemeMode.light : ThemeMode.dark,
      home:  const HomeMainView(),
    );
  }
}





