import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/controller/blog_controller.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'dashboard_subs/filter_form.dart';
import 'dashboard_subs/notices.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<List<Widget>> dashboardBlogs;
  double appBarHeight;
  bool isLiked;
  @override
  void initState() {
    dashboardBlogs = getDashboardBlogs(context);
    isLiked = false;
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: pagesColor,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: height * 0.5,
              collapsedHeight: height * 0.25 - 50,
              elevation: 0,
              centerTitle: false,
              pinned: true,
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    onPressed: () {
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
                    height: 40,
                    minWidth: 40,
                    color: yellowFonts,
                    textColor: darkFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      AssetImage('assets/images/icons/person.png'),
                      size: 16,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
              ],
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '04',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      height: 1,
                      color: yellowFonts,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    'المتواجدون الان',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      height: 1,
                      color: whiteFonts,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            height: 150,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: appColorDark,
                              boxShadow: [
                                BoxShadow(
                                  color: pagesColor.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 0.5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/icons/ads.png',
                              ),
                              color: whiteFonts,
                              size: 25,
                            ),
                          ),
                          Expanded(
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
                                  child: SizedBox(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'أطلب',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        MaterialButton(
                                          key: key,
                                          onPressed: () {
                                            getOffset(key);
                                            showMyDialog(context, x, y);
                                          },
                                          height: 40,
                                          minWidth: 40,
                                          color: yellowFonts,
                                          textColor: darkFonts,
                                          padding: EdgeInsets.zero,
                                          child: ImageIcon(
                                            AssetImage(
                                                'assets/images/icons/plus.png'),
                                            size: 16,
                                          ),
                                          shape: CircleBorder(),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'خدمة',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 150,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: pagesColor.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 0.5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: appColorDark,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/icons/ads.png',
                              ),
                              color: whiteFonts,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        dense: true,
                        trailing: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              enableDrag: true,
                              isDismissible: false,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) => Container(
                                height: 300,
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
                        title: Text(
                          'آخر التحديثات',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: yellowFonts,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
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
            FutureBuilder(
              future: dashboardBlogs,
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        )
                      : snapshot.hasData
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (_, index) {
                                  return Column(
                                    children: [
                                      snapshot.data[index],
                                      if ((index + 1) % 3 == 0) ads(),
                                    ],
                                  );
                                },
                                childCount: snapshot.data.length,
                              ),
                            )
                          : SliverFillRemaining(
                              hasScrollBody: false,
                              child: Center(
                                child: Text(
                                  'لا توجد\n نتيجة',
                                  style: TextStyle(
                                    color: whiteFonts.withOpacity(0.25),
                                  ),
                                ),
                              ),
                            ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 75,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ads() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appColorDark,
      ),
      height: 100,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: ImageIcon(
        AssetImage(
          'assets/images/icons/ads.png',
        ),
        color: whiteFonts,
        size: 25,
      ),
    );
  }
}
