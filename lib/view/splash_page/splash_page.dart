import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gipher/presenter/presenter.dart';

class SplashPage extends StatelessWidget {
  final GetXSplashPresenter presenter;
  SplashPage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
            }
          });
          return Center(
            child: Container(
              child: AnimatedTextKit(
                onFinished: () => presenter.navigateToPage('/'),
                animatedTexts: [
                  FadeAnimatedText('Choose',
                      textStyle: TextStyle(
                          fontSize: 38.0, fontWeight: FontWeight.bold),
                      duration: Duration(milliseconds: 1200)),
                  FadeAnimatedText(
                    'and send by',
                    textStyle:
                        TextStyle(fontSize: 38.0, fontFamily: 'Canterbury'),
                  ),
                  TypewriterAnimatedText(
                    'GIPHER',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
