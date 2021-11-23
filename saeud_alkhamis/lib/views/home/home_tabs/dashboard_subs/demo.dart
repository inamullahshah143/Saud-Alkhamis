// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class Demo extends StatefulWidget {
  double x, y;
  Demo({
    Key key,
    @required this.y,
    @required this.x,
  }) : super(key: key);

  @override
  State<Demo> createState() => _DemoState(x: x, y: y);
}

class _DemoState extends State<Demo> {
  double x, y;
  _DemoState({
    @required this.y,
    @required this.x,
  });
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorDark.withOpacity(0.75),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: y,
              left: x,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

