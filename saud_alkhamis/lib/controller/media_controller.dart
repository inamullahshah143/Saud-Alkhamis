import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
// import 'package:html/parser.dart';
import 'package:saeud_alkhamis/views/widgets/video_gird_tile.dart';
import 'package:url_launcher/url_launcher.dart';

Future<List<Widget>> getMedia(BuildContext context) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<String> videoURLs = [];
  String title = '';
  String date = '';
  String thumbnail = '';
  String views = '';
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
  for (var i = 0; i < x.length; i++) {
    title = x[i]['data']['title']['rendered'].toString();
    await http
        .get(Uri.parse("$apiURL/media/${x[i]['data']['featured_media']}"))
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
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
    views = x[i]['data']['views'].toString();
    videoURLs.add(
      x[i]['data']['_interview_video'],
    );
    await y.add(
      VideoGridTile(
        onPressed: () {
          launchYoutubeVideo(videoURLs[i]);
        },
        type: x[i]['category'],
        date: date,
        title: title,
        thumnail: thumbnail,
        likes: '21',
        shares: '23',
        views: views,
        isShareable: false,
      ),
    );
  }
  return y;
}

Future<void> launchYoutubeVideo(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<List<Widget>> getDiaries(BuildContext context) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<String> videoURLs = [];
  String title = '';
  String date = '';
  String thumbnail = '';
  String views = '';
  await http.get(Uri.parse("$apiURL/diaries_cate")).then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final element in data) {
          await http
              .get(Uri.parse(
                  "$apiURL/diaries?diaries_cate=${element['id'].toInt()}"))
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
    title = x[i]['data']['title']['rendered'].toString();
    await http
        .get(Uri.parse("$apiURL/media/${x[i]['data']['featured_media']}"))
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
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
    views = x[i]['data']['views'].toString();
    videoURLs.add(
      x[i]['data']['_diaries_video'],
    );
    await y.add(
      VideoGridTile(
        onPressed: () {
          launchYoutubeVideo(videoURLs[i]);
        },
        type: x[i]['category'],
        date: date,
        title: title,
        thumnail: thumbnail,
        likes: '21',
        shares: '23',
        views: views,
        isShareable: false,
      ),
    );
  }
  return y;
}
