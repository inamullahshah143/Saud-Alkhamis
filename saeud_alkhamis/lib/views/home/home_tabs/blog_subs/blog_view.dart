// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/dashboard_subs/filter_form.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class BlogView extends StatefulWidget {
  const BlogView({Key key}) : super(key: key);

  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: pagesColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * 0.5,
            collapsedHeight: height * 0.25 - 125,
            elevation: 0,
            pinned: true,
            leadingWidth: 0,
            title: Row(
              children: [
                Padding(
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
                Padding(
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
                      AssetImage('assets/images/icons/search-2.png'),
                      color: darkFonts,
                    ),
                  ),
                ),
                Padding(
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
                      AssetImage('assets/images/icons/plus.png'),
                      color: darkFonts,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
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
                    AssetImage('assets/images/icons/arrow_back.png'),
                    color: darkFonts,
                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: pagesColor,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: pagesColor,
                            ),
                            child: Row(
                              children: [
                                Text("مشاركة"),
                                ImageIcon(
                                  AssetImage(
                                      'assets/images/icons/search-2.png'),
                                  color: darkFonts,
                                ),
                              ],
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
        ],
      ),
    );
  }
}
