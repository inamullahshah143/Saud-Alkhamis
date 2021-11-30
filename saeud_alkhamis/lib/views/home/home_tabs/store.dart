// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'dashboard_subs/notices.dart';
import 'store_subs/store_filters.dart';

class Store extends StatefulWidget {
  const Store({Key key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> with SingleTickerProviderStateMixin {
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
              collapsedHeight: height * 0.25 - 125,
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
                    showSearchScreen(context, 'Store');
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
                                  'أدواتي ( 12 )',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: whiteFonts,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'كتبي ( 23 )',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: whiteFonts,
                                    fontSize: 12,
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
                                child: StoreFilters(),
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
                          'آخر القراءات',
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
              hasScrollBody: false,
              child: [
                Column(
                  children: [
                    StoreListTile(
                      type: 'فنون',
                      date: '03/05/2021',
                      thumnail:
                          'https://m.media-amazon.com/images/I/71a5OIylnWL._AC_SY606_.jpg',
                      title: 'ملهمون',
                      subtitle:
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                      rating: '3.0',
                    ),
                    StoreListTile(
                      type: 'فنون',
                      date: '03/05/2021',
                      thumnail:
                          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1515707600l/37914024._SY475_.jpg',
                      title: 'ملهمون',
                      subtitle:
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                      rating: '3.0',
                    ),
                    StoreListTile(
                      type: 'فنون',
                      date: '03/05/2021',
                      thumnail:
                          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1515707600l/37914024._SY475_.jpg',
                      title: 'ملهمون',
                      subtitle:
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                      rating: '3.0',
                    ),
                    SizedBox(
                      height: 75,
                    ),
                  ],
                ),
                Column(
                  children: [
                    StoreListTile(
                      type: 'فنون',
                      date: '03/05/2021',
                      thumnail:
                          'https://m.media-amazon.com/images/I/71a5OIylnWL._AC_SY606_.jpg',
                      title: 'ملهمون',
                      subtitle:
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                      rating: '3.0',
                    ),
                    StoreListTile(
                      type: 'فنون',
                      date: '03/05/2021',
                      thumnail:
                          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1515707600l/37914024._SY475_.jpg',
                      title: 'بعد الأربعين تبدأ الحياة',
                      subtitle:
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                      rating: '3.0',
                    ),
                    SizedBox(
                      height: 75,
                    ),
                  ],
                ),
              ][_tabController.index],
            ),
          ],
        ),
      ),
    );
  }
}

class StoreListTile extends StatefulWidget {
  String type;
  String date;
  String thumnail;
  String title;
  String subtitle;
  String rating;
  StoreListTile({
    Key key,
    @required this.type,
    @required this.date,
    @required this.thumnail,
    @required this.title,
    @required this.subtitle,
    @required this.rating,
  }) : super(key: key);

  @override
  _StoreListTileState createState() => _StoreListTileState(
        type: type,
        date: date,
        thumnail: thumnail,
        title: title,
        subtitle: subtitle,
        rating: rating,
      );
}

class _StoreListTileState extends State<StoreListTile> {
  String type;
  String date;
  String thumnail;
  String title;
  String subtitle;
  String rating;
  _StoreListTileState({
    @required this.type,
    @required this.date,
    @required this.thumnail,
    @required this.title,
    @required this.subtitle,
    @required this.rating,
  });
  bool isLiked;
  @override
  void initState() {
    isLiked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appColorDark,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 65,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: pagesColor,
                  image: DecorationImage(
                    image: NetworkImage(
                      thumnail,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              type,
                              style: TextStyle(
                                fontSize: 9,
                                color: whiteFonts,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Text(
                          date,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 9,
                            color: whiteFonts.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: whiteFonts,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            RatingBarIndicator(
                              rating: double.parse(rating.toString()),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: yellowFonts,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              unratedColor: pagesColor,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {},
                          height: 40,
                          minWidth: 40,
                          color: yellowFonts,
                          textColor: darkFonts,
                          padding: EdgeInsets.zero,
                          child: Icon(
                            FontAwesome5.play,
                            size: 16,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 9,
                        color: whiteFonts,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'يوجد 38 إعجاب',
                    style: TextStyle(
                      fontSize: 9,
                      color: yellowFonts,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/like.png'),
                      color: isLiked ? yellowFonts : pagesColor,
                    ),
                  ),
                  Text(
                    'إعجاب',
                    style: TextStyle(
                      fontSize: 9,
                      color: whiteFonts,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: pagesColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ImageIcon(
                      AssetImage(
                        'assets/images/icons/buy.png',
                      ),
                      size: 16,
                      color: yellowFonts,
                    ),
                    SizedBox(width: 10),
                    Text("شراء"),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: pagesColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ImageIcon(
                      AssetImage(
                        'assets/images/icons/share.png',
                      ),
                      color: yellowFonts,
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text("مشاركة"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
