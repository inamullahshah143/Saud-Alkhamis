import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/controller/products_controller.dart';
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
  bool homeNotification = false;
  bool blogNotification = false;
  bool mediaNotification = false;
  bool storeNotification = false;
  bool projectNotification = false;
  List pages;

  int bottomIndex;
  PageController pageController;

  @override
  void initState() {
    getLatestDetails(context).then((value) {
      setState(() {
        homeNotification = true;
      });
    });
    getLatestProduct(context).then((value) {
      setState(() {
        storeNotification = true;
      });
    });
    homeNotification = true;
    blogNotification = false;
    mediaNotification = false;
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
                  getLatestDetails(context).then((value) {
                    setState(() {
                      homeNotification = true;
                    });
                  });
                }
                if (bottomIndex == 3 && storeNotification) {
                  getLatestProduct(context).then((value) {
                    setState(() {
                      storeNotification = true;
                    });
                  });
                }
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              items: [
                BottomNavigationBarItem(
                  icon: homeNotification
                      ? Badge(
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
}
