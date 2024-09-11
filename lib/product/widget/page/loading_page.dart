import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/product/enums/animation_enums.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: _body()
    );
  }
  _body()
  {
    return Center(
        child: SizedBox(
            height: context.width*.4,
            width: context.width*.4,
            child: Lottie.asset(
              AnimationEnums.loading.toPath,
            ),
          ),
      );
  }
}


