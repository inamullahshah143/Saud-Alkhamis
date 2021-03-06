// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/dashboard_subs/order_form.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:url_launcher/url_launcher.dart';

class PopupMenuBth extends StatefulWidget {
  double x, y;
  PopupMenuBth({
    Key key,
    @required this.y,
    @required this.x,
  }) : super(key: key);

  @override
  State<PopupMenuBth> createState() => _PopupMenuBthState(x: x, y: y);
}

class _PopupMenuBthState extends State<PopupMenuBth> {
  double x, y;
  _PopupMenuBthState({
    @required this.y,
    @required this.x,
  });
  bool isAnimated;
  @override
  void initState() {
    isAnimated = true;
    Timer(Duration(milliseconds: 50), () {
      setState(() {
        isAnimated = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            top: isAnimated ? y : y + 75,
            left: isAnimated ? x - 5 : x - 50,
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    launchURL(
                        'https://saudalkhamis.net/wp-content/uploads/2020/01/C.V.pdf');
                  },
                  height: 40,
                  minWidth: 40,
                  color: yellowFonts,
                  textColor: darkFonts,
                  padding: EdgeInsets.zero,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/cv.png'),
                    size: 16,
                  ),
                  shape: CircleBorder(),
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
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            top: isAnimated ? y : y + 75,
            left: isAnimated ? x : x + 50,
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showModalBottomSheet(
                      enableDrag: true,
                      isScrollControlled: true,
                      isDismissible: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) => Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        child: OrderForm(),
                      ),
                    );
                  },
                  height: 40,
                  minWidth: 40,
                  color: yellowFonts,
                  textColor: darkFonts,
                  padding: EdgeInsets.zero,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/winking-face.png'),
                    size: 16,
                  ),
                  shape: CircleBorder(),
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
          ),
          Positioned(
            top: y,
            left: x,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  isAnimated = true;
                });
                Timer(Duration(milliseconds: 100), () {
                  Navigator.of(context).pop();
                });
              },
              height: 40,
              minWidth: 40,
              color: whiteFonts,
              textColor: darkFonts,
              padding: EdgeInsets.zero,
              child: ImageIcon(
                AssetImage('assets/images/icons/close.png'),
                size: 16,
              ),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
