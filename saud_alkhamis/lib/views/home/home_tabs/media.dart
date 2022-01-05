import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:saeud_alkhamis/controller/media_controller.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'dashboard_subs/notices.dart';
import 'media_subs/media_filters.dart';

class Media extends StatefulWidget {
  const Media({Key key}) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> with SingleTickerProviderStateMixin {
  Future<List<Widget>> media;
  Future<List<Widget>> diaries;
  GlobalKey key = GlobalKey();
  double x, y;
  String interviewsCount;
  String dariesCount;
  void getOffset(GlobalKey key) {
    RenderBox box = key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    setState(() {
      x = position.dx;
      y = position.dy;
    });
  }

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
    interviewsCount = '';
    dariesCount = '';
    media = getMedia(context);
    diaries = getDiaries(context);
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
                    '01',
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
                      fontWeight: FontWeight.bold,
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
                              tabs: [
                                Text(
                                  'اللقاءات  ${interviewsCount}',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: whiteFonts,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'المرئيات ${dariesCount}',
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
              FutureBuilder(
                future: media,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    SchedulerBinding.instance.addPostFrameCallback(
                      (_) => setState(
                        () {
                          interviewsCount =
                              '( ${snapshot.data.length.toString()} )';
                        },
                      ),
                    );
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.5,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 2.0,
                        mainAxisExtent: 300,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          if ((index + 1) % 6 == 0) return ads();
                          return snapshot.data[index];
                        },
                        childCount: snapshot.data.length,
                      ),
                    );
                  }
                  if (snapshot.data.size == 0) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text('لا توجد نتائج بحث'),
                      ),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(snapshot.error),
                    ),
                  );
                },
              ),
              FutureBuilder(
                future: diaries,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    SchedulerBinding.instance.addPostFrameCallback(
                      (_) => setState(
                        () {
                          dariesCount =
                              '( ${snapshot.data.length.toString()} )';
                        },
                      ),
                    );
                    return SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.5,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 2.0,
                        mainAxisExtent: 300,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          if ((index + 1) % 6 == 0) return ads();
                          return snapshot.data[index];
                        },
                        childCount: snapshot.data.length,
                      ),
                    );
                  }
                  if (snapshot.data.size == 0) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text('لا توجد نتائج بحث'),
                      ),
                    );
                  }
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(snapshot.error),
                    ),
                  );
                },
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

  Widget ads() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appColorDark,
      ),
      height: 100,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
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
