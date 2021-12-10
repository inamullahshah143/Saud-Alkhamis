import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
// import 'package:html/parser.dart';
import 'package:saeud_alkhamis/views/widgets/video_gird_tile.dart';

String getYoutubeThumbnail(String videoUrl) {
  final Uri uri = Uri.tryParse("https://www.youtube.com/watch?v=6cwnBBAVIwE");
  if (uri == null) {
    return null;
  }
  return 'https://img.youtube.com/vi/NjHtNHF3NcE/0.jpg';
}

Future<List<Widget>> getMedia(BuildContext context) async {
  List<Map> x = [];
  List<Widget> y = [];
  String title = '';
  String date = '';
  String thumnail = 'WMMiJDpD87g';
  await http.get(Uri.parse("$apiURL/interview_cate")).then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final element in data) {
          await http
              .get(Uri.parse(
                  "$apiURL/interview?interview_cate=${element['id'].toInt()}"))
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
    // final thumnailData =
    //     parse(element['data']['content']['rendered'].toString());
    // final String thumnailString =
    //     parse(thumnailData.body.text).documentElement.text;
    title = element['data']['title']['rendered'].toString();
    // thumnail = thumnailString;
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(element['data']['date']));

    y.add(
      VideoGridTile(
        onPressed: () {},
        type: element['category'],
        date: date,
        title: title,
        thumnail: getYoutubeThumbnail(thumnail),
        likes: '21',
        shares: '23',
        views: '32',
        isShareable: false,
      ),
    );
  }
  return y;
}
