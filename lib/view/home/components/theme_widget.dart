import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:online_cv/product/enums/animation_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';

class ThemeWidget extends ConsumerStatefulWidget {
  const ThemeWidget({super.key});

  @override
  ConsumerState<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends ConsumerState<ThemeWidget>  with TickerProviderStateMixin {

  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2), value: 1);
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   bool isLight = ref.watch(provideThemeLight);

    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ()
      {
        _controller.animateTo(isLight ? 0.5 : 1);
        isLight = !isLight;
        ref.read(provideThemeLight.notifier).state = isLight;
        
      },
      child: SizedBox(
        height: 50.0,
        width: 150.0,
        child: Lottie.asset(
                controller: _controller,
                AnimationEnums.theme.toPath,
              ),
      ),
    );
  }
}