import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
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
  int bottomIndex;
  PageController pageController;
  @override
  void initState() {
    bottomIndex = 0;
    pageController = PageController(
      initialPage: bottomIndex,
      keepPage: true,
    );
    super.initState();
  }

  List pages = [
    Dashboard(),
    Blog(),
    Media(),
    Store(),
    ProjectsAndPortfolio(),
  ];

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
        floatingActionButton: SnakeNavigationBar.color(
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: appColorDark,
          snakeViewColor: appThemeColor,
          elevation: 2.0,
          padding: EdgeInsets.symmetric(horizontal: 25),
          snakeShape: SnakeShape.circle,
          behaviour: SnakeBarBehaviour.floating,
          currentIndex: bottomIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: whiteFonts,
          unselectedItemColor: whiteFonts,
          onTap: (index) {
            setState(() {
              bottomIndex = index;
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icons/home.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icons/project-deadline.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icons/book.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icons/play.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icons/post.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
