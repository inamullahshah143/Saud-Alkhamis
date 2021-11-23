import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'dashboard_subs/filter_form.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double appBarHeight;
  @override
  void initState() {
    appBarHeight = 500.0;
    super.initState();
  }

  GlobalKey key = GlobalKey();

  double x, y;

  void getOffset(GlobalKey key) {
    RenderBox box = key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);

    setState(() {
      x = position.dx;
      y = position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: pagesColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: height * 0.5,
            collapsedHeight: height * 0.25,
            elevation: 0,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: appColorLight,
                ),
                child: ImageIcon(
                  AssetImage('assets/images/icons/person.png'),
                  color: darkFonts,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '04',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: yellowFonts,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'المتواجدون الان',
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
            flexibleSpace: BackgroundFlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'خدمة',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: whiteFonts,
                          fontSize: 12,
                        ),
                      ),
                      MaterialButton(
                        color: appColorLight,
                        shape: CircleBorder(),
                        textColor: darkFonts,
                        child: Icon(Icons.add),
                        onPressed: () {},
                      ),
                      Text(
                        'أطلب',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: whiteFonts,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    dense: true,
                    leading: ImageIcon(
                      AssetImage('assets/images/icons/filter.png'),
                      size: 16,
                      color: yellowFonts,
                    ),
                    trailing: Text(
                      'آخر التحديثات',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: yellowFonts,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [
                        Colors.transparent,
                        pagesColor,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) => Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        child: FilterForm(),
                      ),
                    );
                  },
                  child: customListTile(
                    'استشارت',
                    'تقديم استشارة في تجربة المستخدم',
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                    '03/05/2021',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
