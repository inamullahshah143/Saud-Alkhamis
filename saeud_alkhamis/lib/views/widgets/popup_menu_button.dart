// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/dashboard_subs/order_form.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: y,
            left: x,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: whiteFonts,
                ),
                child: ImageIcon(
                  AssetImage('assets/images/icons/close.png'),
                  color: darkFonts,
                ),
              ),
            ),
          ),
          Positioned(
            top: y + 75,
            left: x - 50,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: yellowFonts,
                    ),
                    child: ImageIcon(
                      AssetImage('assets/images/icons/cv.png'),
                      color: darkFonts,
                    ),
                  ),
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
          Positioned(
            top: y + 75,
            left: x + 50,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
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
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: yellowFonts,
                    ),
                    child: ImageIcon(
                      AssetImage('assets/images/icons/winking-face.png'),
                      color: darkFonts,
                    ),
                  ),
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
        ],
      ),
    );
  }
}
