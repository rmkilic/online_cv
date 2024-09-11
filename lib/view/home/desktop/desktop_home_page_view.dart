import 'package:flutter/material.dart';
import 'package:online_cv/core/constant/cons_application.dart';
import 'package:online_cv/product/enums/icon_enums.dart';
import 'package:online_cv/product/utility/method.dart';
import 'package:online_cv/view/about/about_view.dart';
import 'package:online_cv/view/experience/experience_view.dart';
import 'package:online_cv/view/home/desktop/components/_navigation_bar.dart';
import 'package:online_cv/view/home/desktop/components/language_widget.dart';
import 'package:online_cv/view/home/desktop/desktop_home_page_business.dart';
import 'package:online_cv/view/project/projects_view.dart';
import 'package:online_cv/view/references/references_view.dart';
import 'package:online_cv/view/resume/resume_view.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'components/_social_bar.dart';

class DesktopHomeView extends StatefulWidget {
  const DesktopHomeView({super.key});

  @override
  _DesktopHomeViewState createState() => _DesktopHomeViewState();
}

class _DesktopHomeViewState extends DesktopHomeViewBusiness {


  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body);
  }

  Widget get _body
  {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
          physics: const ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomNavigationBar(size:size, autoScrollController: autoScrollController,),
              Row(
                children: [
                  //Social Icon
                  _SocialBar(size: size),
                  Expanded(
                    child: SizedBox(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(index: 1, child: const ExperienceView()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),
                              _wrapScrollTag(index: 2, child: const ReferencesView()),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              _wrapScrollTag(index: 3, child: const ResumeView()),
                              SizedBox(
                                height: size.height * 0.10,
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
                 ],
              ),
            ],
          ),
        );
        
  }
}
