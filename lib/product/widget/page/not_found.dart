import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_cv/core/extension/context_extension.dart';
import 'package:online_cv/product/enums/animation_enums.dart';

class NotFound extends StatefulWidget {
  const NotFound({super.key});

  @override
  State<NotFound> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<NotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              AnimationEnums.notfound.toPath,
            ),
          ),
      );
  }
}


