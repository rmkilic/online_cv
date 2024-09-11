import 'package:flutter/material.dart';
import 'package:online_cv/view/home/desktop/desktop_home_page_view.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

abstract class DesktopHomeViewBusiness extends State<DesktopHomeView>
{

  late AutoScrollController autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpanded = true;

  bool get _isAppBarExpanded {
    return autoScrollController.hasClients &&
        autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpanded != false
                ? setState(
                    () {
                      isExpanded = false;
                    },
                  )
                : {}
            : isExpanded != true
                ? setState(() {
                    isExpanded = true;
                  })
                : {},
      );
    super.initState();
  }


}