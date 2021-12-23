import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/blog_subs/blog_view.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:html/parser.dart';

Future<List<Widget>> getDashboardBlogs(BuildContext context) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<Widget> blogView = [];
  String subtitle = '';
  String title = '';
  String date = '';
  String thumbnail = '';
  int commentCount = 0;
  await http.get(Uri.parse("$apiURL/categories")).then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final element in data) {
          await http
              .get(Uri.parse(
                  "$apiURL/posts?categories=${element['id'].toInt()}"))
              .then((value) {
            if (value.statusCode == 200) {
              List data = jsonDecode(value.body);
              if (data.isNotEmpty) {
                for (final e in data) {
                  x.add({"category": "${element['name']}", "data": e});
                }
              }
            }
          });
        }
      }
    }
  }).catchError((e) {
    // ignore: avoid_print
    print(e.toString());
  });
  x.sort((a, b) {
    DateTime adate = DateTime.tryParse(a['data']['date']);
    DateTime bdate = DateTime.tryParse(b['data']['date']);
    return adate.compareTo(bdate);
  });
  for (var i = 0; i < 10; i++) {
    final subtitleData = parse(x[i]['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = x[i]['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
    thumbnail = x[i]['data']['jetpack_featured_media_url'].toString();
    await http
        .get(Uri.parse("$apiURL/comments?post=${x[i]['data']['id'].toInt()}"))
        .then((value) {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          commentCount = data.length;
        }
      }
    }).catchError((e) {
      // ignore: avoid_print
      print(e.toString());
    });
    blogView.add(
      BlogView(
        type: x[i]['category'],
        title: title,
        date: date,
        blogText: subtitle,
        commentCount: commentCount,
        thumbnail: thumbnail,
      ),
    );
    y.add(
      CustomListTile(
        onPressed: () {
          push(
            context,
            blogView[i],
          );
        },
        type: x[i]['category'],
        title: title,
        subtitle: subtitle,
        date: date,
        isShareable: true,
      ),
    );
  }
  return y;
}

Future<List<Widget>> getBlogs(BuildContext context) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<Widget> blogView = [];
  String subtitle = '';
  String title = '';
  String date = '';
  String thumbnail = '';
  int commentCount = 0;
  await http.get(Uri.parse("$apiURL/categories")).then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final element in data) {
          await http
              .get(Uri.parse(
                  "$apiURL/posts?categories=${element['id'].toInt()}"))
              .then((value) {
            if (value.statusCode == 200) {
              List data = jsonDecode(value.body);
              if (data.isNotEmpty) {
                for (final e in data) {
                  x.add({"category": "${element['name']}", "data": e});
                }
              }
            }
          });
        }
      }
    }
  }).catchError((e) {
    // ignore: avoid_print
    print(e.toString());
  });
  x.sort((a, b) {
    DateTime adate = DateTime.tryParse(a['data']['date']);
    DateTime bdate = DateTime.tryParse(b['data']['date']);
    return adate.compareTo(bdate);
  });
  for (var i = 0; i < x.length; i++) {
    final subtitleData = parse(x[i]['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = x[i]['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));

    thumbnail = x[i]['data']['jetpack_featured_media_url'].toString();
    await http
        .get(Uri.parse("$apiURL/comments?post=${x[i]['data']['id'].toInt()}"))
        .then((value) {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          commentCount = data.length;
        }
      }
    }).catchError((e) {
      // ignore: avoid_print
      print(e.toString());
    });
    blogView.add(
      BlogView(
        type: x[i]['category'],
        title: title,
        date: date,
        blogText: subtitle,
        commentCount: commentCount,
        thumbnail: thumbnail,
      ),
    );
    y.add(
      CustomListTile(
        onPressed: () {
          push(
            context,
            blogView[i],
          );
        },
        type: x[i]['category'],
        title: title,
        subtitle: subtitle,
        date: date,
        isShareable: false,
      ),
    );
  }
  return y;
}
