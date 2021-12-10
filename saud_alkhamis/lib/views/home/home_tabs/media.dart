import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:saeud_alkhamis/views/widgets/video_gird_tile.dart';
import 'dashboard_subs/notices.dart';
import 'media_subs/media_filters.dart';

class Media extends StatefulWidget {
  const Media({Key key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> with SingleTickerProviderStateMixin {
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

  List<String> images = [
    "https://mir-s3-cdn-cf.behance.net/project_modules/disp/9ee12212906787.5626e998e99ad.jpg",
    "https://saudalkhamis.net/wp-content/uploads/2019/12/CleanShot-2019-12-15-at-20.39.51-450x350.png",
  ];
  TabController _tabController;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
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
                    showSearchScreen(context, 'Media');
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
                        padding: const EdgeInsets.all(10.0),
                        child: DefaultTabController(
                          length: 2,
                          child: Container(
                            height: 50.0,
                            decoration: const BoxDecoration(
                              color: appColorDark,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: TabBar(
                              labelPadding: EdgeInsets.zero,
                              indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(50), // Creates border
                                color: yellowFonts,
                              ),
                              controller: _tabController,
                              tabs: const [
                                Text(
                                  'المرئيات ( 202 )',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: whiteFonts,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'اللقاءات ( 46 )',
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
                                height: 375,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: MediaFilters(),
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
                          'آخر اللقاءات',
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
                        'assets/images/5.png',
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
            [
              SliverGrid.count(
                childAspectRatio: 0.6,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  videoGridTile(
                    context,
                    'مجموعة مصوري الرياض',
                    '03/05/2021',
                    'تجربة توظيف المهامتجربة توظيف المهارات',
                    images[0],
                    '3',
                    '67',
                    true,
                  ),
                ],
              ),
              SliverGrid.count(
                childAspectRatio: 0.6,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  videoGridTile(
                    context,
                    'مجموعة مصوري الرياض',
                    '03/05/2021',
                    'تجربة توظيف المهامتجربة توظيف المهارات',
                    images[1],
                    '23',
                    '43',
                    true,
                  ),
                ],
              ),
            ][_tabController.index],
            SliverToBoxAdapter(
              child: SizedBox(
                height: 85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
