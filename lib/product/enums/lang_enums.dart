import 'package:flutter/material.dart';

///Project Supported Locale Enums
enum LanguageEnums
{
  ///Turkish Locale
  tr(localeCode: Locale('tr','TR')  , languageCode: 'tr-TR', countryCode: 'tr'),
  ///English Locale
  en(localeCode: Locale('en','US')  , languageCode: 'en-US', countryCode: 'us');

  ///German Locale
//  de(localeCode: Locale('de','DE')  , languageCode: 'de-DE', countryCode: 'de');
  const LanguageEnums({
    required this.languageCode,
    required this.countryCode,
    required this.localeCode,

  });
  final String languageCode;
  final String countryCode; // for flag.
  final Locale localeCode;
  ///For Country Flag


}


