import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/constant/cons_application.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/models/program_model.dart';
import 'package:online_cv/product/constant/cons_padding.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/widget/complex/title_area_text.dart';
import 'package:online_cv/product/widget/text/index.dart';
import 'package:online_cv/view/project/components/project_image.dart';

part 'components/project_card.dart';

class ProjectsView extends ConsumerStatefulWidget {
  const ProjectsView({super.key});

  @override
  ConsumerState<ProjectsView> createState() => _ProjectView2State();
}

class _ProjectView2State extends ConsumerState<ProjectsView> {

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: ConsPadding.pagePadding(context),
      child: SizedBox(
        height: context.height,
        width: context.width,
        child: _body,
      ),
    );
  }
  Widget get _body
  {
    List<Program> list = ref.watch(provideProgramList);
    return _list(list);
  }


  Widget _list(List<Program> list)
  {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const TitleTextArea( titleText: LocaleKeys.general_projects, isMultiLang: true,),
        SizedBox(
          height: context.height * 0.07,
        ),
        Column(
          children: List<Widget>.generate(list.length, (index) => _ProjectCard(program: list[index])),),
      ],
    );
  }



}