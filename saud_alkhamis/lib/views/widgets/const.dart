// ignore_for_file: no_logic_in_create_state, must_be_immutable

import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/search_screen.dart';

import 'popup_menu_button.dart';

Map<int, Color> appThemeMap = {
  50: const Color.fromRGBO(255, 203, 0, .1),
  100: const Color.fromRGBO(255, 203, 0, .2),
  300: const Color.fromRGBO(255, 203, 0, .4),
  200: const Color.fromRGBO(255, 203, 0, .3),
  400: const Color.fromRGBO(255, 203, 0, .5),
  500: const Color.fromRGBO(255, 203, 0, .6),
  600: const Color.fromRGBO(255, 203, 0, .7),
  700: const Color.fromRGBO(255, 203, 0, .8),
  800: const Color.fromRGBO(255, 203, 0, .9),
  900: const Color.fromRGBO(255, 203, 0, 1),
};
MaterialColor appThemeColor = MaterialColor(0xFFFFCB00, appThemeMap);

const Color appColorDark = Color.fromRGBO(39, 41, 41, 1);
const Color appColorLight = Color.fromRGBO(255, 203, 0, 1);
const Color pagesColor = Color.fromRGBO(23, 23, 23, 1);

const Color yellowFonts = Color.fromRGBO(255, 203, 0, 1);
const Color darkFonts = Color.fromRGBO(39, 41, 41, 1);
const Color whiteFonts = Color.fromRGBO(255, 255, 255, 1);
const Color redFonts = Color.fromRGBO(230, 0, 35, 1);
const String apiURL = 'https://saudalkhamis.net/wp-json/wp/v2';
push(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

pushReplacement(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

class CustomListTile extends StatefulWidget {
  Function onPressed;
  String type;
  String title;
  String subtitle;
  String date;
  bool isShareable;
  CustomListTile({
    Key key,
    @required this.onPressed,
    @required this.type,
    @required this.title,
    @required this.subtitle,
    @required this.date,
    @required this.isShareable,
  }) : super(key: key);

  @override
  _CustomListTileState createState() => _CustomListTileState(
        onPressed: onPressed,
        type: type,
        title: title,
        subtitle: subtitle,
        date: date,
        isShareable: isShareable,
      );
}

class _CustomListTileState extends State<CustomListTile> {
  Function onPressed;
  String type;
  String title;
  String subtitle;
  String date;
  bool isShareable;
  _CustomListTileState({
    @required this.onPressed,
    @required this.type,
    @required this.title,
    @required this.subtitle,
    @required this.date,
    @required this.isShareable,
  });
  bool isViewed;
  bool isLiked;
  @override
  void initState() {
    isViewed = true;
    isLiked = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: appColorDark,
          ),
          height: 135,
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                type,
                                style: TextStyle(
                                  fontSize: 8,
                                  color: whiteFonts,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
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
                          Text(
                            subtitle,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 10,
                              height: 1.5,
                              color: whiteFonts,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 8,
                            color: whiteFonts.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    isShareable
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 38 زيارة',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/link.png'),
                                  color: yellowFonts,
                                ),
                              ),
                              Text(
                                'زيارة',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: whiteFonts,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 38 زيارة',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isViewed = !isViewed;
                                  });
                                },
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/view-2.png'),
                                  color: isViewed ? yellowFonts : pagesColor,
                                ),
                              ),
                              Text(
                                'قراءة',
                                style: TextStyle(
                                  fontSize: 10,
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
                            fontSize: 8,
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
                            fontSize: 10,
                            color: whiteFonts,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showMyDialog(BuildContext context, x, y) async {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black87,
    useSafeArea: false,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopupMenuBth(x: x, y: y);
    },
  );
}

Future<void> showSearchScreen(
  BuildContext context,
  String searchDataFrom,
) async {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.black87,
    useSafeArea: true,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SearchScreen(searchDataFrom: searchDataFrom);
    },
  );
}
