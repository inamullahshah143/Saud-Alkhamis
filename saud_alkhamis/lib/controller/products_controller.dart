import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:saeud_alkhamis/views/widgets/store_list_tile.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';
import 'dart:ui' as ui;

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<List<Widget>> getBooks(BuildContext context) async {
  List<Widget> x = [];
  String thumbnail = '';
  String subtitle = '';
  await http.get(Uri.parse("$apiURL/books")).then(
    (value) async {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          for (final element in data) {
            await http
                .get(Uri.parse("$apiURL/media/${element['featured_media']}"))
                .then(
              (value) async {
                if (value.statusCode == 200) {
                  var data = jsonDecode(value.body);
                  if (data.isNotEmpty) {
                    thumbnail = data['source_url'];
                  }
                }
              },
            );
            final subtitleData =
                parse(element['content']['rendered'].toString());
            final String subtitleString =
                parse(subtitleData.body.text).documentElement.text;
            subtitle = subtitleString;
            await x.add(
              StoreListTile(
                onPressed: () {
                  launchURL(element['link']);
                },
                onShare: () async {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  await Share.share(element['link'],
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                onBuy: () {
                  launchURL(element['_product_url']);
                },
                type: element['type'],
                date: DateFormat('dd/MM/yyyy')
                    .format(DateTime.tryParse(element['date'])),
                thumnail: thumbnail,
                title: element['title']['rendered'],
                subtitle: subtitle,
                rating: '4.0',
                views: '0',
              ),
            );
          }
        }
      }
    },
  );
  return x;
}

Future<List<Widget>> getTools(BuildContext context) async {
  List<Widget> x = [];
  String thumbnail = '';
  String subtitle = '';
  await http.get(Uri.parse("$apiURL/tools")).then(
    (value) async {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          for (final element in data) {
            await http
                .get(Uri.parse("$apiURL/media/${element['featured_media']}"))
                .then(
              (value) async {
                if (value.statusCode == 200) {
                  var data = jsonDecode(value.body);
                  if (data.isNotEmpty) {
                    thumbnail = data['source_url'];
                  }
                }
              },
            );
            final subtitleData =
                parse(element['content']['rendered'].toString());
            final String subtitleString =
                parse(subtitleData.body.text).documentElement.text;
            subtitle = subtitleString;
            await x.add(
              StoreListTile(
                onPressed: () {
                  launchURL(element['link']);
                },
                onShare: () async {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  await Share.share(element['link'],
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                onBuy: () {
                  launchURL(element['acf']['link']);
                },
                type: element['type'],
                date: DateFormat('dd/MM/yyyy')
                    .format(DateTime.tryParse(element['date'])),
                thumnail: thumbnail,
                title: element['title']['rendered'],
                subtitle: subtitle,
                rating: '${element['acf']['rating']}',
                views: '0',
              ),
            );
          }
        }
      }
    },
  );
  return x;
}

Future<List<Widget>> searchBooks(BuildContext context, searchKeyword) async {
  List<Widget> x = [];
  String thumbnail = '';
  String subtitle = '';
  await http.get(Uri.parse("$apiURL/books?search=${searchKeyword}")).then(
    (value) async {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          for (final element in data) {
            await http
                .get(Uri.parse("$apiURL/media/${element['featured_media']}"))
                .then(
              (value) async {
                if (value.statusCode == 200) {
                  var data = jsonDecode(value.body);
                  if (data.isNotEmpty) {
                    thumbnail = data['source_url'];
                  }
                }
              },
            );
            final subtitleData =
                parse(element['content']['rendered'].toString());
            final String subtitleString =
                parse(subtitleData.body.text).documentElement.text;
            subtitle = subtitleString;
            await x.add(
              StoreListTile(
                onPressed: () {
                  launchURL(element['link']);
                },
                onShare: () async {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  await Share.share(element['link'],
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                onBuy: () {
                  launchURL(element['_product_url']);
                },
                type: element['type'],
                date: DateFormat('dd/MM/yyyy')
                    .format(DateTime.tryParse(element['date'])),
                thumnail: thumbnail,
                title: element['title']['rendered'],
                subtitle: subtitle,
                rating: '${element['acf']['rating']}',
                views: '0',
              ),
            );
          }
        }
      }
    },
  );
  return x;
}

Future getLatestProduct(context) async {
  String url;
  await http
      .get(Uri.parse(
          "$apiURL/books?after=${DateTime.now().subtract(Duration(days: 1))}"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        await http
            .get(Uri.parse("$apiURL/media/${data.first['featured_media']}"))
            .then(
          (value) async {
            if (value.statusCode == 200) {
              var data = jsonDecode(value.body);
              if (data.isNotEmpty) {
                url = data['source_url'];
              } else {
                return null;
              }
            }
          },
        );
      }
    }
  }).catchError((e) {
    print(e);
    return null;
  });
  return showProductPopup(context, url);
}

Future getLatestDetails(context) async {
  String post = '0';
  String media = '0';
  String project = '0';
  await http
      .get(Uri.parse(
          "$apiURL/posts?after=${DateTime.now().subtract(Duration(days: 1))}"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        post = data.length.toString();
      } else {
        return null;
      }
    }
  }).catchError((e) {
    print(e);
  });
  await http
      .get(Uri.parse(
          "$apiURL/interview?after=${DateTime.now().subtract(Duration(days: 1))}"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        media = data.length.toString();
      } else {
        return null;
      }
    }
  }).catchError((e) {
    print(e);
  });
  await http
      .get(Uri.parse(
          "$apiURL/job?after=${DateTime.now().subtract(Duration(days: 1))}"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        project = data.length.toString();
      } else {
        return null;
      }
    }
  }).catchError((e) {
    print(e);
  });
  return showPopupMenu(context, post, media, project);
}

showProductPopup(BuildContext context, String url) async {
  showMenu(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    position: RelativeRect.fromLTRB(
      MediaQuery.of(context).size.width * 0.2,
      MediaQuery.of(context).size.height * 0.7,
      MediaQuery.of(context).size.width * 0.2,
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
                url,
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

showPopupMenu(context, String post, String media, String project) async {
  showMenu(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      position: RelativeRect.fromLTRB(
        25,
        MediaQuery.of(context).size.height * 0.7,
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
              textDirection: ui.TextDirection.rtl,
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
                    text: post,
                    style: TextStyle(
                      color: whiteFonts,
                      fontFamily: 'HelveticaNeueLTA',
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
                      fontFamily: 'HelveticaNeueLTA',
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
              textDirection: ui.TextDirection.rtl,
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
                    text: media,
                    style: TextStyle(
                      color: whiteFonts,
                      fontFamily: 'HelveticaNeueLTA',
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
                      fontFamily: 'HelveticaNeueLTA',
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
              textDirection: ui.TextDirection.rtl,
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
                    text: project,
                    style: TextStyle(
                      color: whiteFonts,
                      fontFamily: 'HelveticaNeueLTA',
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
                      fontFamily: 'HelveticaNeueLTA',
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
