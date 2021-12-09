import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:saeud_alkhamis/views/widgets/video_gird_tile.dart';
import 'dashboard_subs/notices.dart';
import 'projects_subs/projects_filter.dart';

class ProjectsAndPortfolio extends StatefulWidget {
  const ProjectsAndPortfolio({Key key}) : super(key: key);

  @override
  _ProjectsAndPortfolioState createState() => _ProjectsAndPortfolioState();
}

class _ProjectsAndPortfolioState extends State<ProjectsAndPortfolio> {
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
                    showSearchScreen(context, 'Projects');
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
                      height: 1,
                      fontSize: 23,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: DropdownButtonFormField(
                          hint: Text('مشاريعي'),
                          isDense: false,
                          elevation: 1,
                          alignment: AlignmentDirectional.centerStart,
                          iconDisabledColor: yellowFonts,
                          iconEnabledColor: yellowFonts,
                          items: const [
                            DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: "1",
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: whiteFonts,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: "2",
                              child: Text(
                                "2",
                                style: TextStyle(
                                  color: whiteFonts,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                          icon: Icon(Icons.arrow_downward),
                          onChanged: (value) {},
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: appColorDark,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
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
                                child: ProjectFilters(),
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
                          'آخر المشاريع',
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
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: whiteFonts,
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            width: 2.0,
                            color: appColorDark,
                          ),
                        ),
                        child: Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/icons/type-logo.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'آخر الأعمال',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: yellowFonts,
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
                 videoGridTile(
                    context,
                    'مجموعة مصوري الرياض',
                    '03/05/2021',
                    'تجربة توظيف المهامتجربة توظيف المهارات',
                    images[1],
                    '23',
                    '43',
                  ),],
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
