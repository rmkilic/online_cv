import 'package:flutter/material.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/widget/text/index.dart';
import 'package:online_cv/view/about/about_view.dart';
import 'package:online_cv/view/about/components/profile_image.dart';
import 'package:online_cv/view/experience/experience_view.dart';
import 'package:online_cv/view/home/components/theme_widget.dart';
import 'package:online_cv/view/home/desktop/desktop_home_page_view.dart';
import 'package:online_cv/view/home/mobile/components/language_combobox.dart';
import 'package:online_cv/view/home/mobile/components/tab_item.dart';
import 'package:online_cv/view/home/mobile/mobile_home_business.dart';
import 'package:online_cv/view/project/projects_view.dart';
import 'package:online_cv/view/references/references_view.dart';
import 'package:online_cv/view/resume/resume_view.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'components/drawer.dart';
class MobileHomeView extends StatefulWidget {
  const MobileHomeView({super.key});

  @override
  State<MobileHomeView> createState() => _MobileHomeViewState();
}

class _MobileHomeViewState extends MobileHomeViewBusiness {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar:  _appbar,
        body: _body2(context),
        drawer: _Drawer(autoScrollController: autoScrollController,) );
  }

  AppBar get _appbar
  {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        actions: const[
          
           SizedBox(
              height: 30,
              width: 100,
              child: ThemeWidget(),
            ),
          SizedBox(width: 10.0,),

          SizedBox(           
            child: LanguageCombobox(),
          ),
          SizedBox(width: 10.0,)
        ],
      );
  }

  


  LayoutBuilder _body2(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          height: constraint.maxHeight,
          child: SingleChildScrollView(
              physics: const ScrollPhysics(),
          //    primary: true,
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: constraint.maxHeight ,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomScrollView(
                    controller: autoScrollController,
                    slivers: <Widget>[
                      SliverList(
                          delegate: SliverChildListDelegate([
                     
                            
                        
                        _wrapScrollTag(
                          index: 0,
                          child: const AboutView(),
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                            
                        //Where I've Worked
                        _wrapScrollTag(index: 1, child: const ExperienceView()),
                        SizedBox(
                          height: context.height * 0.10,
                        ),
                        _wrapScrollTag(index: 2, child: const ReferencesView()),
                              SizedBox(
                            height: context.height * 0.10,

                              ),

                        _wrapScrollTag(index: 3, child: const ResumeView()),
                              SizedBox(
                            height: context.height * 0.10,

                              ),
                            
                        //Some Things I've Built Main Project
                        _wrapScrollTag(
                            index: 4,
                            child: const ProjectsView()),
                            
                        const SizedBox(
                          height: 6.0,
                        ),
                            
                       ])),
                    ],
                  ),
                ),
              ),
            ),
        );
      }
    );
  }


    Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: autoScrollController,
      index: index,
      child: child,
    );
  }
}