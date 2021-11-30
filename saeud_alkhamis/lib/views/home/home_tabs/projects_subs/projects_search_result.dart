// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class ProjectsSearchResult extends StatefulWidget {
  String searchKeyword;
  ProjectsSearchResult({Key key, @required this.searchKeyword})
      : super(key: key);

  @override
  _ProjectsSearchResultState createState() =>
      _ProjectsSearchResultState(searchKeyword: searchKeyword);
}

class _ProjectsSearchResultState extends State<ProjectsSearchResult> {
  String searchKeyword;
  _ProjectsSearchResultState({@required this.searchKeyword});

  List<String> images = [
    "https://mir-s3-cdn-cf.behance.net/project_modules/disp/9ee12212906787.5626e998e99ad.jpg",
    "https://saudalkhamis.net/wp-content/uploads/2019/12/CleanShot-2019-12-15-at-20.39.51-450x350.png",
  ];
  TextEditingController seachText;
  @override
  void initState() {
    seachText = TextEditingController(text: searchKeyword);
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
              pinned: true,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  height: 40,
                  minWidth: 40,
                  color: yellowFonts,
                  textColor: darkFonts,
                  padding: EdgeInsets.zero,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/arrow_back.png'),
                    size: 16,
                  ),
                  shape: CircleBorder(),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    onPressed: () {
                      showSearchScreen(context, 'Projects');
                    },
                    height: 40,
                    minWidth: 40,
                    color: darkFonts,
                    textColor: yellowFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      AssetImage('assets/images/icons/search-2.png'),
                      size: 16,
                    ),
                    shape: CircleBorder(),
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
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 25,
                        ),
                        child: TextField(
                          controller: seachText,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 12,
                          ),
                          enabled: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 0),
                            filled: true,
                            fillColor: appColorDark,
                            isDense: true,
                            hintText: 'أكتب كلمات البحث ..',
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.red,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'نتائج البحث',
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
                        'assets/images/3.png',
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
            SliverGrid.count(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: appColorDark,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(images[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        trailing: Text(
                          '03/05/2021',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: yellowFonts,
                            fontSize: 9,
                          ),
                        ),
                        title: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'مجموعة مصوري الرياض',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 9,
                              color: whiteFonts,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'تجربة توظيف المهامتجربة توظيف المهارات',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: whiteFonts,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 38 زيارة',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/view-2.png'),
                                  color: yellowFonts,
                                ),
                              ),
                              Text(
                                'قراءة',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: whiteFonts,
                                ),
                              ),
                            ],
                          ),
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
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/like.png'),
                                  color: yellowFonts,
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
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: appColorDark,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(images[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        trailing: Text(
                          '03/05/2021',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: yellowFonts,
                            fontSize: 9,
                          ),
                        ),
                        title: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'مجموعة مصوري الرياض',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 9,
                              color: whiteFonts,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'تجربة توظيف المهامتجربة توظيف المهارات',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: whiteFonts,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 38 زيارة',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/view-2.png'),
                                  color: yellowFonts,
                                ),
                              ),
                              Text(
                                'قراءة',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: whiteFonts,
                                ),
                              ),
                            ],
                          ),
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
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/like.png'),
                                  color: yellowFonts,
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
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: appColorDark,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(images[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        trailing: Text(
                          '03/05/2021',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: yellowFonts,
                            fontSize: 9,
                          ),
                        ),
                        title: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'مجموعة مصوري الرياض',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 9,
                              color: whiteFonts,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'تجربة توظيف المهامتجربة توظيف المهارات',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: whiteFonts,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 38 زيارة',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/view-2.png'),
                                  color: yellowFonts,
                                ),
                              ),
                              Text(
                                'قراءة',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: whiteFonts,
                                ),
                              ),
                            ],
                          ),
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
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/like.png'),
                                  color: yellowFonts,
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
