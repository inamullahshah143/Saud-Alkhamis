
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'views/home/home.dart';
import 'views/widgets/const.dart';

 class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  VideoPlayerController controller;
  Timer timer;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/images/splash.mp4')
      ..initialize().then((_) {
        controller.setPlaybackSpeed(0.5);
        controller.play();
        setState(() {});
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          controller.position.then((value) {
            if ("${value.inSeconds}" == "4") {
              pushReplacement(context, Home());
            }
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: controller.value.size?.width ?? 0,
              height: controller.value.size?.height ?? 0,
              child: VideoPlayer(controller),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    controller.dispose();
  }
}