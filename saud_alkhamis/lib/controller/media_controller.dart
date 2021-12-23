import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/media_subs/playe_video.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
// import 'package:html/parser.dart';
import 'package:saeud_alkhamis/views/widgets/video_gird_tile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<List<Widget>> getMedia(BuildContext context) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<String> videoURLs = [];
  String title = '';
  String date = '';
  String thumnail = '';
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
    thumnail = x[i]['data']['featured_media_src_url'].toString();
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
    views = x[i]['data']['views'].toString();
    videoURLs.add(
      YoutubePlayer.convertUrlToId(x[i]['data']['_interview_video']),
    );
    y.add(
      VideoGridTile(
        onPressed: () {
          showDialog(
            barrierColor: Colors.black87,
            context: context,
            barrierDismissible: false,
            builder: (_) => VideoPlayer(
              url: videoURLs[i],
            ),
          );
        },
        type: x[i]['category'],
        date: date,
        title: title,
        thumnail: thumnail,
        likes: '21',
        shares: '23',
        views: views,
        isShareable: false,
      ),
    );
  }
  return y;
}
