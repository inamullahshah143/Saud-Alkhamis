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
  await http
      .get(Uri.parse("$apiURL/interview?per_page=100"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final e in data) {
          await http
              .get(
                  Uri.parse("$apiURL/interview_cate/${e['interview_cate'][0]}"))
              .then((value) async {
            if (value.statusCode == 200) {
              var data = jsonDecode(value.body);
              if (data.isNotEmpty) {
                x.add({"category": "${data['name']}", "data": e});
              }
            }
          });
        }
      }
    }
  }).catchError((e) {
    print(e.toString());
  });
  x.sort((a, b) {
    DateTime adate = DateTime.tryParse(a['data']['date']);
    DateTime bdate = DateTime.tryParse(b['data']['date']);
    return bdate.compareTo(adate);
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
      x[i]['data']['link'],
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
        likes: '0',
        views: views,
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
  await http.get(Uri.parse("$apiURL/diaries?per_page=100")).then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final e in data) {
          await http
              .get(Uri.parse("$apiURL/diaries_cate/${e['diaries_cate'][0]}"))
              .then((value) async {
            if (value.statusCode == 200) {
              var data = jsonDecode(value.body);
              if (data.isNotEmpty) {
                x.add({"category": "${data['name']}", "data": e});
              }
            }
          });
        }
      }
    }
  }).catchError((e) {
    print(e.toString());
  });

  x.sort((a, b) {
    DateTime adate = DateTime.tryParse(a['data']['date']);
    DateTime bdate = DateTime.tryParse(b['data']['date']);
    return bdate.compareTo(adate);
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
      x[i]['data']['link'],
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
        likes: '0',
        views: views,
      ),
    );
  }

  return y;
}

Future<List<Widget>> searchMedia(BuildContext context, searchKeyword) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<String> videoURLs = [];
  String title = '';
  String date = '';
  String thumbnail = '';
  String views = '';

  await http
      .get(Uri.parse("$apiURL/interview?search=${searchKeyword}"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final e in data) {
          await http
              .get(
                  Uri.parse("$apiURL/interview_cate/${e['interview_cate'][0]}"))
              .then((value) async {
            if (value.statusCode == 200) {
              var data = jsonDecode(value.body);
              if (data.isNotEmpty) {
                x.add({"category": "${data['name']}", "data": e});
              }
            }
          });
        }
      }
    }
  }).catchError((e) {
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
      x[i]['data']['link'],
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
        likes: '0',
        views: views,
      ),
    );
  }
  return y;
}
