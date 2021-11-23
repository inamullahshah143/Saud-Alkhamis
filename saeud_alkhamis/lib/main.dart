import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/home/home.dart';
import 'views/widgets/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      title: 'سعود-الخميس',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appThemeColor,
        brightness: Brightness.dark,
      ),
      home: const Home(),
    );
  }
}
