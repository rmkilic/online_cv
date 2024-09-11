import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/constant/cons_application.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/models/resume_model.dart';
import 'package:online_cv/product/constant/cons_padding.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/utility/method.dart';
import 'package:online_cv/product/widget/complex/title_area_text.dart';
import 'package:online_cv/product/widget/text/index.dart';
import 'package:online_cv/product/widget/text/text_body_medium.dart';
import 'dart:html' as html;
class ResumeView extends ConsumerStatefulWidget {
  const ResumeView({super.key});

  @override
  ConsumerState<ResumeView> createState() => _ResumeViewState();
}

class _ResumeViewState extends ConsumerState<ResumeView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConsPadding.pagePadding(context),
      child: SizedBox(
        height:   context.width < ConsApplication.DESKTOPWIDTH ? context.height*1.5: context.height*.9,
        width: context.width,
        child: _body,
      ),
    );
  }
  
  Widget get _body
  {
    Resume ?_resume = ref.watch(provideResume);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleTextArea(titleText: LocaleKeys.general_resume, isMultiLang:true),
          const Padding(
        padding:  EdgeInsets.all(8.0),
        child: TextTitleSmall(text: LocaleKeys.general_educationWork, isMultiLang: true,),
      ),
        SizedBox(
          height: context.height * 0.07,
        ),
      
        Expanded(child: _page(_resume))
      ],
    );
  }

  _page(Resume? _resume)
  {
    return 
    _resume == null ? Container():
    context.width < ConsApplication.DESKTOPWIDTH
      ? _mobile(_resume)
      : _desktop(_resume);
  }
  _mobile(Resume resume)
  {
    return ListView(
      children: [
            _summary(resume.summary),
            _education(resume.education),
            _profession(resume.profession)
      ],
    );
  }
  
  _desktop(Resume resume)
  {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Column(
              children: [
                _summary(resume.summary),
                const SizedBox(height: 10,),
                _education(resume.education)
              ],
            )),
            Expanded(child: _profession(resume.profession)),
        
          ],
        ),
        const SizedBox(height: 20,),
        _downloadButton()
      ],
    );
  }
  
  Widget _downloadButton()
  {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.dividerColor
      ),
      onPressed: ()async{
        await downloadFile();
      }, child: const TextTitleSmall(text: LocaleKeys.general_downloadCV, isMultiLang: true, color: Colors.white));
  }

Future<void> downloadFile() async {
  try {
    // Firebase Storage referansını al
    final storageRef = FirebaseStorage.instance.ref().child(ConsApplication.firebaseCVFolderPath);
    
    // Dosya URL'sini al
    final url = await storageRef.getDownloadURL();
    
    // Dosyayı indirmek için bir bağlantı oluştur
    final anchor = html.AnchorElement(href: url);
    anchor.setAttribute('download', 'CV_RaufMüminKilicarslan.pdf'); // Dosya adı
    anchor.click(); // Bağlantıya tıklayarak indirme başlatılır

    
  } catch (e) {
    Exception(e);
  }
}

  _summary(Summary summary)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitleLarge(text: summary.title),
        const SizedBox(height: 10,),
        Row(
          children: [
            
            //_verticalDivider(),
            const SizedBox(width: 20.0,),
            Expanded(child: _summaryDesc(summary))
          ],
        )
      ],
    );
  }

  _summaryDesc(Summary summary)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitleMedium(text: summary.name),
        const SizedBox(height: 20,),
        TextBodyMedium(text: summary.about),
        const SizedBox(height: 10,),
        SizedBox(        
          height: 150,
          child: _summaryContact(summary.contact),
        )
      ],
    );
  }
  _summaryContact(Contact contact)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _listTile(contact.city),
        _listTile(contact.phone),
        _listTile(contact.email),
        _listTile(contact.github, isLink: true, linkAdress: ConsApplication.GITHUBADRESS),
        _listTile(contact.linkedin, isLink: true, linkAdress: ConsApplication.LINKEDINADRESS)
      ],
    );
  }

  _education(List<Education> educationList)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitleLarge(text: educationList.first.title),
        const SizedBox(height: 10,),
        Column(
          children: List.generate(educationList.length, (index) => _educationItem(educationList[index])),
        )
      ],
    );
  }
  _educationItem(Education item)
  {
    return Row(
          children: [
           // _verticalDivider(),
            const SizedBox(width: 20.0,),
            _educationDesc(item)
          ],
        );
  }

  _educationDesc(Education item)
  {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleMedium(text: item.name, fontWeight: FontWeight.bold,),
          const SizedBox(height: 5,),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: context.dividerColor.withOpacity(.1),
            child: TextTitleSmall(text: item.year),
          ),
          const SizedBox(height: 5,),

          TextBodyMedium(text: item.school)
        ],
      ),
    );
  }

  _profession(Profession item)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitleLarge(text: item.title),
        const SizedBox(height: 20,),
        Column(
          children: List.generate(item.business.length, (index) => _professionItem(item.business[index])),
        )
      ],
    );
  }

  _professionItem(Business item)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleMedium(text: item.name, fontWeight: FontWeight.bold,),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: context.dividerColor.withOpacity(.1),
            child: TextTitleSmall(text: item.year),
          ),
          const SizedBox(height: 10,),

          TextBodyMedium(text: item.company, fontStyle: FontStyle.italic,),
          _professionAbout(item.description),
          const SizedBox(height: 10,),

          _projects(item.project)
        ],
      ),
    );
  }

  _professionAbout(String desc)
  {
    List<String> list = desc.split('-');
    list.removeAt(0);
    return Column(
      children: List.generate(list.length, (index)=> _listTile(list[index])),
    );
  }

  _projects(List<Project> projects)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextTitleSmall(text: LocaleKeys.general_projects, isMultiLang: true, fontWeight: FontWeight.bold,),
        const SizedBox(height: 10,),
        Column(
          children: List.generate(projects.length, (index)=> _listTileV2(projects[index].name, projects[index].description)),
        )
      ],
    );
  }

Method method = Method();

  _listTile(String title,{bool isLink = false, String linkAdress = ""})
  {
    return Padding(
      padding: const EdgeInsets.only(left:5.0, top: 5),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap:  isLink ? (){
          method.launchURL(linkAdress);
        } : null,
        child: Row(
          children: [
            Icon(IconEnums.substance.icon),
            Expanded(child: TextBodyMedium(text: title ,color: isLink ? context.dividerColor : null,))
          ],
            ),
      ),
    );
  }
  _listTileV2(String title,String desc)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Icon(IconEnums.substance.icon),
      Expanded(child: 
      RichText(
        text: TextSpan(
      text: "$title: ",
      style: context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
      children:  <TextSpan>[
        TextSpan(text: desc, style: context.textTheme.bodyMedium),
        
      ],
        ),
      )
      )
        ],
          ),
    );
  }

  _verticalDivider()
  {
     
    return Column(
              children: [
                Icon(IconEnums.circle.icon, color: context.dividerColor,),
                Expanded(child: Container(width: 2, color: context.dividerColor, child: const SizedBox(),))
              ],
            );
  }
}