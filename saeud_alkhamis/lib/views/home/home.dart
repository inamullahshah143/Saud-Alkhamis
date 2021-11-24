import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/blog.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

import 'home_tabs/dahsboard.dart';
import 'home_tabs/media.dart';
import 'home_tabs/store.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int bottomIndex;
  @override
  void initState() {
    bottomIndex = 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: bottomIndex == 4
          ? Dashboard()
          : bottomIndex == 3
              ? Blog()
              : bottomIndex == 2
                  ? Media()
                  : bottomIndex == 1
                      ? Store()
                      : bottomIndex == 0
                          ? Container()
                          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: appColorDark,
          borderRadius: BorderRadius.circular(50),
        ),
        child: BottomNavigationBar(
          backgroundColor: appColorDark,
          elevation: 0.0,
          currentIndex: bottomIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: appColorLight,
          unselectedItemColor: whiteFonts,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              bottomIndex = index;
            });
          },
          items: const [
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
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icons/home.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
