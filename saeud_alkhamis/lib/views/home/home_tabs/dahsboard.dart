import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'dashboard_subs/filter_form.dart';
import 'dashboard_subs/notices.dart';

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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: pagesColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: height * 0.5,
            collapsedHeight: height * 0.25 - 125,
            elevation: 0,
            pinned: true,
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: InkWell(
              onTap: () {
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
                    child: Notices(),
                  ),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(12),
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
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
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
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 130),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      pagesColor.withOpacity(0),
                      pagesColor.withOpacity(0.5),
                      pagesColor,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 90,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
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
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            key: key,
                            onTap: () {
                              getOffset(key);
                              showMyDialog(context, x, y);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: appColorLight,
                              ),
                              child: ImageIcon(
                                AssetImage('assets/images/icons/plus.png'),
                                color: darkFonts,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
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
                    ),
                    ListTile(
                      dense: true,
                      leading: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            enableDrag: true,
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
                        icon: ImageIcon(
                          AssetImage('assets/images/icons/filter.png'),
                          size: 16,
                          color: yellowFonts,
                        ),
                      ),
                      trailing: Text(
                        'آخر التحديثات',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: yellowFonts,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            flexibleSpace: BackgroundFlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/2.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: customListTile(
                      'استشارت',
                      'تقديم استشارة في تجربة المستخدم',
                      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                      '03/05/2021',
                      true),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
