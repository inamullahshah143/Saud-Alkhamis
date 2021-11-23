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
    return Stack(
      children: [
        Positioned(
          top: y,
          left: x,
          child: MaterialButton(
            color: whiteFonts,
            shape: CircleBorder(),
            textColor: darkFonts,
            child: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Positioned(
          top: y + 75,
          left: 0,
          right: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  MaterialButton(
                    color: yellowFonts,
                    shape: CircleBorder(),
                    textColor: darkFonts,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/icons/cv.png',
                      ),
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'السيرة الذاتية',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: whiteFonts,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  MaterialButton(
                    color: yellowFonts,
                    shape: CircleBorder(),
                    textColor: darkFonts,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/icons/winking-face.png',
                      ),
                      size: 16,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'طلب خدمة',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: whiteFonts,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
