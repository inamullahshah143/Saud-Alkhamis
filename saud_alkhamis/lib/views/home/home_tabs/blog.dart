import 'package:background_app_bar/background_app_bar.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/controller/blog_controller.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

import 'blog_subs/blog_filter.dart';
import 'dashboard_subs/notices.dart';

class Blog extends StatefulWidget {
  const Blog({Key key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
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

  String tags = '';
  List<String> options = [
    'الكل',
    'عن العظماء',
    'من الواقع',
    'من حياتي',
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: pagesColor,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: height * 0.5,
              collapsedHeight: height * 0.25 - 50,
              elevation: 0,
              automaticallyImplyLeading: false,
              pinned: true,
              leadingWidth: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    key: key,
                    onPressed: () {
                      getOffset(key);
                      showMyDialog(context, x, y + 5);
                    },
                    height: 40,
                    minWidth: 40,
                    color: yellowFonts,
                    textColor: darkFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      AssetImage('assets/images/icons/plus.png'),
                      size: 16,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showSearchScreen(context, 'Blog');
                  },
                  height: 40,
                  minWidth: 40,
                  color: yellowFonts,
                  textColor: darkFonts,
                  padding: EdgeInsets.zero,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/search-2.png'),
                    size: 16,
                  ),
                  shape: CircleBorder(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                      color: yellowFonts,
                      fontSize: 23,
                      height: 1,
                    ),
                  ),
                  Text(
                    'المتواجدون الان',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: whiteFonts,
                      height: 1,
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
                          child: ChipsChoice<String>.single(
                            value: tags,
                            choiceActiveStyle: C2ChoiceStyle(
                              showCheckmark: false,
                              brightness: Brightness.dark,
                              color: yellowFonts,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderColor: appColorDark,
                            ),
                            choiceStyle: C2ChoiceStyle(
                              showCheckmark: false,
                              brightness: Brightness.dark,
                              color: appColorDark,
                              labelStyle: TextStyle(
                                fontSize: 14,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderColor: appColorDark,
                            ),
                            onChanged: (val) => setState(() => tags = val),
                            choiceItems: C2Choice.listFrom<String, String>(
                              source: options,
                              value: (i, v) => v,
                              label: (i, v) => v,
                              tooltip: (i, v) => v,
                              style: (i, v) {
                                return C2ChoiceStyle(
                                  showCheckmark: false,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderColor: appColorDark,
                                );
                              },
                              activeStyle: (i, v) {
                                return C2ChoiceStyle(
                                  showCheckmark: false,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  borderColor: yellowFonts,
                                );
                              },
                            ),
                          ),
                        ),
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
                              builder: (BuildContext context) => Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  child: BlogFilters(),
                                ),
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
                          'آخر المقالات',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: yellowFonts,
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
            FutureBuilder(
              future: getBlogs(),
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? SliverToBoxAdapter(child: LinearProgressIndicator())
                      : snapshot.hasData
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (_, index) {
                                  return snapshot.data[index];
                                },
                                childCount: snapshot.data.length,
                              ),
                            )
                          : SliverToBoxAdapter(
                              child: Text('Record not found'),
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
}
