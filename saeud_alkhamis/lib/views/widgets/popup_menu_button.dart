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
