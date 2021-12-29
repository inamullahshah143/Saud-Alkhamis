import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:saeud_alkhamis/views/widgets/video_gird_tile.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Widget> getCustomer(BuildContext context) async {
  List<Widget> x = [];
  String thumbnail = '';
  await http.get(Uri.parse("$apiURL/customer")).then(
    (value) async {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          for (final element in data) {
            await http
                .get(Uri.parse("$apiURL/media/${element['_thumbnail_id']}"))
                .then((value) async {
              if (value.statusCode == 200) {
                var data = jsonDecode(value.body);
                if (data.isNotEmpty) {
                  thumbnail = data['source_url'];
                  x.add(
                    InkWell(
                      onTap: () {
                        launchURL(data['link']);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: whiteFonts,
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(
                              width: 2.0,
                              color: appColorDark,
                            ),
                          ),
                          child: Container(
                            width: 60,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  thumbnail,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
            });
          }
        }
      }
    },
  );
  return SizedBox(
    height: 90,
    child: ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: x,
    ),
  );
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<List<Widget>> getJobs(BuildContext context) async {
  List<Widget> x = [];
  String thumbnail = '';
  String type = '';
  await http.get(Uri.parse("$apiURL/job")).then(
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
            await http
                .get(Uri.parse("$apiURL/job_cate/${element['job_cate'][0]}"))
                .then((value) async {
              if (value.statusCode == 200) {
                var data = jsonDecode(value.body);
                if (data.isNotEmpty) {
                  type = data['name'];
                }
              }
            });
            await x.add(
              VideoGridTile(
                onPressed: () {
                  launchURL(element['link']);
                },
                type: type,
                date: DateFormat('dd/MM/yyyy')
                    .format(DateTime.tryParse(element['date'])),
                title: element['title']['rendered'],
                thumnail: thumbnail,
                likes: '21',
                shares: '23',
                views: element['views'],
                isShareable: false,
              ),
            );
          }
        }
      }
    },
  );
  return x;
}
