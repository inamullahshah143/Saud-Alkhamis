import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:saeud_alkhamis/views/widgets/store_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<List<Widget>> getProducts(BuildContext context) async {
  List<Widget> x = [];
  String thumbnail = '';
  String subtitle = '';
  await http.get(Uri.parse("$apiURL/product")).then(
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
                type: element['type'],
                date: DateFormat('dd/MM/yyyy')
                    .format(DateTime.tryParse(element['date'])),
                thumnail: thumbnail,
                title: element['title']['rendered'],
                subtitle: subtitle,
                rating: '4.0',
              ),
            );
          }
        }
      }
    },
  );
  return x;
}
