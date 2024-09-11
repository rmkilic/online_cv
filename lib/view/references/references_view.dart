import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/models/references_model.dart';
import 'package:online_cv/product/constant/cons_padding.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/utility/method.dart';
import 'package:online_cv/product/widget/complex/title_area_text.dart';
import 'package:online_cv/product/widget/text/index.dart';
import 'package:online_cv/product/widget/text/text_body_medium.dart';

class ReferencesView extends ConsumerStatefulWidget {
  const ReferencesView({super.key});

  @override
  ConsumerState<ReferencesView> createState() => _ReferencesViewState();
}

class _ReferencesViewState extends ConsumerState<ReferencesView> {
  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget get _body
  {
   List<References> referencesList = ref.watch(provideReferences);
    return Padding(
      padding: ConsPadding.pagePadding(context),
      child: SizedBox(
        height:  context.height*.9,
        width: context.width ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const TitleTextArea(titleText: LocaleKeys.general_references, isMultiLang:true),
              SizedBox(
                height: context.height * 0.07,
              ),
              _page(referencesList)
          ],
        ),
      ),
    );
  }

  Widget _page(List<References> list)
  {
    return Column(
      children: List.generate(list.length, (index)=> _listItem(list[index])),
    );
  }

  Widget _listItem(References item)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: FittedBox(
                  child: Icon(IconEnums.person.icon, size: 40,),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTitleSmall(text: item.name, fontWeight: FontWeight.bold,),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextTitleSmall(text: item.position),
                  ),
                  _listTile(item.phone),
                  _listTile(item.linkedin, isLink: true),
              
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
Method method = Method();

    _listTile(String title,{bool isLink = false})
  {
    return Padding(
      padding: const EdgeInsets.only(left:10.0, top: 5),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap:  isLink ? (){
          _onTap(title);
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

  _onTap(String link)
  {
  
    method.launchURL("https://www.$link");
  }
}