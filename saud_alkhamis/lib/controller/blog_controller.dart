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
  String subtitle = '';
  String title = '';
  String date = '';
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
  for (final element in x) {
    final subtitleData =
        parse(element['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = element['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(element['data']['date']));
    y.add(
      CustomListTile(
        onPressed: () {
          push(context, BlogView());
        },
        type: element['category'],
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
  String subtitle = '';
  String title = '';
  String date = '';
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
  for (final element in x) {
    final subtitleData =
        parse(element['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = element['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(element['data']['date']));
    y.add(
      CustomListTile(
        onPressed: () {
          push(context, BlogView());
        },
        type: element['category'],
        title: title,
        subtitle: subtitle,
        date: date,
        isShareable: false,
      ),
    );
  }
  return y;
}
