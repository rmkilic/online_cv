import 'package:flutter/material.dart';

class LanguageManager{

  static LanguageManager ?_instance;
  static LanguageManager get instance{
    _instance ??= LanguageManager._init();
    return _instance!;
    
  }

  LanguageManager._init();
  final trLocale =  const Locale("tr","TR");
  final enLocale =  const Locale("en","US");
  final deLocale =  const Locale("de","DE");
  
  
  List<Locale> get supportedLocales => [trLocale, enLocale, deLocale];
}