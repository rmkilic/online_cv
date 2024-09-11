

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/models/about_model.dart';
import 'package:online_cv/models/experience_model.dart';
import 'package:online_cv/models/program_model.dart';
import 'package:online_cv/models/references_model.dart';
import 'package:online_cv/models/resume_model.dart';
import 'package:online_cv/product/enums/lang_enums.dart';

/// Provides the active index for Drawer & Navigation Bar
final providerActiveIndex = StateProvider<int>(((ref) => 0));

///Provide is Loading
final provideLoading = StateProvider<bool>(((ref) => true));


/// Provide Firebase Project List
final provideProgramList = StateProvider<List<Program>>(((ref) => []));

/// Provide Firebase About
final provideAbout = StateProvider<About?>(((ref) => null));

/// Provide Firebase Experience List
final provideExperienceList = StateProvider<List<Experience>>(((ref) => []));

/// Provide Firebase Reference List
final provideReferences = StateProvider<List<References>>(((ref)=>[]));

/// Provide Firebase Resume 
final provideResume = StateProvider<Resume?>(((ref)=> null));

///Provide Application Language
final provideLanguage = StateProvider<LanguageEnums>(((ref) => LanguageEnums.tr));

///Theme Data is Light
final provideThemeLight = StateProvider<bool>(((ref) => true));


