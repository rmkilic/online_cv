import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_cv/core/init/theme/index.dart';
import 'package:online_cv/product/constant/cons_colors.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        scaffoldBackgroundColor: Colors.white,
        textTheme: textTheme,
        drawerTheme: drawerThemeData,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 16.0, color: ConsColor.darkScaffold),
        dividerTheme: const DividerThemeData( color: ConsColor.lightDivider),
        cardTheme: CardTheme(
          color: Colors.black.withOpacity(.1)
        )

        
      );

  @override

    final DrawerThemeData drawerThemeData = const DrawerThemeData(backgroundColor: ConsColor.cream);
    @override
      final TextTheme textTheme = TextTheme(
          headlineLarge: ThemeData.light().textTheme.headlineLarge!.copyWith(color: ConsColor.lightBolumBaslik),
          titleLarge: ThemeData.light().textTheme.titleLarge!.copyWith(color: ConsColor.lightThemeText),
          titleMedium: ThemeData.light().textTheme.titleMedium!.copyWith(color: ConsColor.lightThemeText),
          titleSmall: ThemeData.light().textTheme.titleSmall!.copyWith(color: ConsColor.lightThemeText),
          bodyMedium: ThemeData.light().textTheme.bodyMedium!.copyWith( color: ConsColor.lightThemeText)
        );
}