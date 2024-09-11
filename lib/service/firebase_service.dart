// ignore_for_file: constant_identifier_names
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:online_cv/models/about_model.dart';
import 'package:online_cv/models/experience_model.dart';
import 'package:online_cv/models/program_model.dart';
import 'package:online_cv/models/references_model.dart';
import 'package:online_cv/models/resume_model.dart';
import 'package:online_cv/product/enums/lang_enums.dart';
import 'package:online_cv/product/enums/network_path.dart';

class FirebaseService
{
  static const FIREBASE_URL = "https://online-cv-37682-default-rtdb.firebaseio.com/";

String checkLanguageCode(LanguageEnums lang)
{
  if(lang == LanguageEnums.en)
  {
    return "en";
  }
  else
  {
    return lang.countryCode;
  }
}

  Future<List<Program>> getPrograms(LanguageEnums language)async{
    try
    { 
      String langCode = checkLanguageCode(language);
    final String networkPath = "${NetworkPath.program.getPath}/$langCode.json";
    final uri =  Uri.parse("$FIREBASE_URL$networkPath");
    final response = await http.get(uri);
     

    switch(response.statusCode)
    {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body);
        final programList = jsonModel.map((e) => Program.fromJson(e as Map<String,dynamic>)).toList().cast<Program>();
        return programList;
      default:
        return Future.error(response.statusCode);
    }
    }
    catch(e)
    {
      throw Exception(e);
    }
    
  }

    Future<About> getAbout(LanguageEnums language)async{
    String langCode = checkLanguageCode(language);

    final String networkPath = "${NetworkPath.about.getPath}/$langCode.json";
    final uri =  Uri.parse("$FIREBASE_URL$networkPath");
    final response = await http.get(uri);

    switch(response.statusCode)
    {
      case HttpStatus.ok:
      try
      {
        final jsonModel = json.decode(response.body);
        About model = About.fromJson(jsonModel);        
        return   model;
      }
      catch(e)
      {
        throw Exception(e);
      }
        
      default:
        return Future.error(response.statusCode);
    }
  }

    Future<List<Experience>> getExperience(LanguageEnums language)async{
    String langCode = checkLanguageCode(language);

    final String networkPath = "${NetworkPath.experience.getPath}/$langCode.json";
    final uri =  Uri.parse("$FIREBASE_URL$networkPath");
    final response = await http.get(uri);

    switch(response.statusCode)
    {
      case HttpStatus.ok:
      List<Experience> liste = [];
        final jsonModel = json.decode(response.body);
        for(var item in jsonModel)
        {
          Experience model = Experience.fromJson(item);
          liste.add(model);
        }
       // var model = List<Experience>.from(jsonModel);        
        return liste;
      default:
        return Future.error(response.statusCode);
    }
  }

    Future<Resume> getResume(LanguageEnums language)async{
    String langCode = checkLanguageCode(language);

    final String networkPath = "${NetworkPath.resume.getPath}/$langCode.json";
    final uri =  Uri.parse("$FIREBASE_URL$networkPath");
    final response = await http.get(uri);

    switch(response.statusCode)
    {
      case HttpStatus.ok:
      try
      {
        final jsonModel = json.decode(response.body);
        Resume model = Resume.fromJson(jsonModel.first);        
        return   model;
      }
      catch(e)
      {
        throw Exception(e);
      }
      default:
        return Future.error(response.statusCode);
    }
  }

      Future<List<References>> getReferences(LanguageEnums language)async{
    String langCode = checkLanguageCode(language);
      List<References> liste = [];

    final String networkPath = "${NetworkPath.references.getPath}/$langCode.json";
    final uri =  Uri.parse("$FIREBASE_URL$networkPath");
    final response = await http.get(uri);

    switch(response.statusCode)
    {
      case HttpStatus.ok:
      try
      {
        final jsonModel = json.decode(response.body);
        for(var item in jsonModel)
        {
          References model = References.fromJson(item);

          liste.add(model);
        }
        return liste;
        
        
      }
      catch(e)
      {
        throw Exception(e);
      }
      default:
        return Future.error(response.statusCode);
    }
  }
}