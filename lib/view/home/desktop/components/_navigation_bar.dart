// ignore_for_file: must_be_immutable




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/init/lang/locale_keys.g.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/product/widget/complex/appbar_title.dart';
import 'package:online_cv/view/home/components/theme_widget.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({super.key,  required this.size, required this.autoScrollController});
  final Size size;
  final AutoScrollController autoScrollController;

  @override
  ConsumerState<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return               //navigation Bar
              SizedBox(
                height: widget.size.height * 0.1,
                width: widget.size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 30,
                        width: 100,
                        child: ThemeWidget(),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: tabMenuItem.length,
                            child: TabBar(
                              indicatorColor: Colors.transparent,
                              dividerColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index, ref);
                              },
                              tabs: _tabs,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );

  }
  List<String> tabMenuItem = [
    LocaleKeys.general_about,
    LocaleKeys.general_experience,
    LocaleKeys.general_references,
    LocaleKeys.general_resume,
    LocaleKeys.general_projects
  ];

  List<Widget> get _tabs
  {
    return 
    List.generate(tabMenuItem.length, (int index)=>Tab(child: FittedBox(child: AppBarTitle(text: tabMenuItem[index], isMultiLang: true,)),));
  }



    Future _scrollToIndex(int index, WidgetRef ref) async {
    await widget.autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
        widget.autoScrollController.highlight(index);
        ref.read(providerActiveIndex.notifier).state = index;

  }
}