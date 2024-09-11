
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_cv/core/init/theme/index.dart';
import 'package:online_cv/product/constant/cons_colors.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: textTheme,
        drawerTheme: drawerThemeData,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 16.0, color: ConsColor.cream),
        dividerTheme: const DividerThemeData( color: ConsColor.turquoise),
        cardTheme: CardTheme(
          color: Colors.white.withOpacity(.1)
        )


      
      );

  @override
    final DrawerThemeData drawerThemeData = DrawerThemeData(backgroundColor: ThemeData.dark().scaffoldBackgroundColor);

  @override
  final TextTheme textTheme = TextTheme(
          headlineLarge: ThemeData.dark().textTheme.headlineLarge!.copyWith(color: ConsColor.bolumBaslikRengi),
          titleLarge: ThemeData.dark().textTheme.titleLarge!.copyWith(color: ConsColor.titleTextColor),
          titleMedium: ThemeData.dark().textTheme.titleMedium!.copyWith(color: ConsColor.subTextColor),
          titleSmall: ThemeData.dark().textTheme.titleSmall!.copyWith(color: ConsColor.subTextColor),
          bodyMedium: ThemeData.dark().textTheme.bodyMedium!.copyWith( color: ConsColor.subTextColor)
        );
}