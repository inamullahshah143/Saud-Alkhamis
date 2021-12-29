import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/dashboard_subs/notices.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

import 'package:html/parser.dart';

Future<Widget> getComment(BuildContext context) async {
  List<Widget> x = [];
  String title = '';
  String subtitle = '';
  String date = '';
  await http.get(Uri.parse("$apiURL/timeline")).then(
    (value) async {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          for (final element in data) {
            date =
                DateFormat('yyyy').format(DateTime.tryParse(element['date']));
            final subtitleData =
                parse(element['content']['rendered'].toString());
            final String subtitleString =
                parse(subtitleData.body.text).documentElement.text;
            title = element['title']['rendered'].toString();
            subtitle = subtitleString;
            x.add(
              ListItem(
                title: title,
                subtitle: subtitle,
                year: date,
              ),
            );
          }
        }
      }
    },
  );
  return ListView(
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    children: x,
  );
}
