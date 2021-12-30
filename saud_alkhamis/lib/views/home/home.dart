import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/blog.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'home_tabs/dahsboard.dart';
import 'home_tabs/media.dart';
import 'home_tabs/projects_and_portfolio.dart';
import 'home_tabs/store.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double appBarHeight;
  bool homeNotification;
  bool blogNotification;
  bool mediaNotification;
  bool storeNotification;
  bool projectNotification;

  GlobalKey homeBtnKey = GlobalKey();
  GlobalKey productBtnKey = GlobalKey();
  double x, y;
  Offset position;
  List pages;
  void getOffset(GlobalKey key) {
    RenderBox box = key.currentContext.findRenderObject();
    position = box.localToGlobal(Offset.zero);
    setState(() {
      x = position.dx;
      y = position.dy;
    });
  }

  int bottomIndex;
  PageController pageController;

  @override
  void initState() {
    homeNotification = true;
    blogNotification = false;
    mediaNotification = false;
    storeNotification = true;
    projectNotification = false;
    pages = [
      Dashboard(),
      Blog(),
      Media(),
      Store(),
      ProjectsAndPortfolio(),
    ];
    bottomIndex = 0;
    pageController = PageController(
      initialPage: bottomIndex,
      keepPage: true,
    );
    appBarHeight = 500.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: PageView.builder(
            allowImplicitScrolling: true,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                bottomIndex = value;
              });
            },
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) {
              return pages[index];
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Card(
            color: appColorDark,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              currentIndex: bottomIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0.0,
              unselectedFontSize: 0.0,
              selectedItemColor: yellowFonts,
              unselectedItemColor: whiteFonts,
              onTap: (index) {
                bottomIndex = index;
                if (bottomIndex == 0 && homeNotification) {
                  getOffset(homeBtnKey);
                  showPopupMenu(position);
                }
                if (bottomIndex == 3 && storeNotification) {
                  getOffset(productBtnKey);
                  showProductPopup(position);
                }
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              items: [
                BottomNavigationBarItem(
                  icon: homeNotification
                      ? Badge(
                          key: homeBtnKey,
                          shape: BadgeShape.circle,
                          position: BadgePosition.topStart(),
                          borderRadius: BorderRadius.circular(100),
                          child: ImageIcon(
                            AssetImage('assets/images/icons/home.png'),
                          ),
                        )
                      : ImageIcon(
                          AssetImage('assets/images/icons/home.png'),
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: blogNotification
                      ? Badge(
                          shape: BadgeShape.circle,
                          position: BadgePosition.topStart(),
                          borderRadius: BorderRadius.circular(100),
                          child: ImageIcon(
                            AssetImage('assets/images/icons/post.png'),
                          ),
                        )
                      : ImageIcon(
                          AssetImage('assets/images/icons/post.png'),
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: mediaNotification
                      ? Badge(
                          shape: BadgeShape.circle,
                          position: BadgePosition.topStart(),
                          borderRadius: BorderRadius.circular(100),
                          child: ImageIcon(
                            AssetImage('assets/images/icons/play.png'),
                          ),
                        )
                      : ImageIcon(
                          AssetImage('assets/images/icons/play.png'),
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: storeNotification
                      ? Badge(
                          key: productBtnKey,
                          shape: BadgeShape.circle,
                          position: BadgePosition.topStart(),
                          borderRadius: BorderRadius.circular(100),
                          child: ImageIcon(
                            AssetImage('assets/images/icons/book.png'),
                          ),
                        )
                      : ImageIcon(
                          AssetImage('assets/images/icons/book.png'),
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: projectNotification
                      ? Badge(
                          shape: BadgeShape.circle,
                          position: BadgePosition.topStart(),
                          borderRadius: BorderRadius.circular(100),
                          child: ImageIcon(
                            AssetImage(
                                'assets/images/icons/project-deadline.png'),
                          ),
                        )
                      : ImageIcon(
                          AssetImage(
                              'assets/images/icons/project-deadline.png'),
                        ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    showMenu(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        position: RelativeRect.fromLTRB(
          left,
          top - 190,
          0,
          0,
        ),
        color: appColorDark,
        useRootNavigator: true,
        items: [
          PopupMenuItem<int>(
            value: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: ImageIcon(
                        AssetImage('assets/images/icons/post.png'),
                      ),
                    ),
                    TextSpan(
                      text: '   ',
                    ),
                    TextSpan(
                      text: '12',
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: '   ',
                    ),
                    TextSpan(
                      text: 'مقال جديد',
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
          PopupMenuItem<int>(
            value: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: ImageIcon(
                        AssetImage('assets/images/icons/play.png'),
                      ),
                    ),
                    TextSpan(
                      text: '   ',
                    ),
                    TextSpan(
                      text: '32',
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: '   ',
                    ),
                    TextSpan(
                      text: 'ميديا جديدة',
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
          PopupMenuItem<int>(
            value: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: RichText(
                textDirection: TextDirection.rtl,
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: ImageIcon(
                        AssetImage('assets/images/icons/project-deadline.png'),
                      ),
                    ),
                    TextSpan(
                      text: '   ',
                    ),
                    TextSpan(
                      text: '48',
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: '   ',
                    ),
                    TextSpan(
                      text: 'مشاريع جديدة',
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
        ]);
  }

  showProductPopup(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    showMenu(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      position: RelativeRect.fromLTRB(
        left - 35,
        top - 190,
        left,
        0,
      ),
      color: Colors.transparent,
      useRootNavigator: true,
      items: [
        PopupMenuItem<int>(
          value: 0,
          padding: EdgeInsets.zero,
          child: Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              color: pagesColor,
              image: DecorationImage(
                image: NetworkImage(
                  'https://m.media-amazon.com/images/I/71a5OIylnWL._AC_SY606_.jpg',
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: pagesColor.withOpacity(0.75),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        )
      ],
    );
  }
}
