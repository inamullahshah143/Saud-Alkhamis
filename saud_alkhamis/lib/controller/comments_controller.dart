import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

Future<Widget> getComments(BuildContext context) async {
  int _current = 0;
  List<Widget> x = [];
  String title = '';
  String subtitle = '';
  String date = '';
  await http.get(Uri.parse("$apiURL/ktsprotype")).then(
    (value) async {
      if (value.statusCode == 200) {
        List data = jsonDecode(value.body);
        if (data.isNotEmpty) {
          for (final element in data) {
            date = DateFormat('dd/MM/yyyy')
                .format(DateTime.tryParse(element['date']));
            final subtitleData = parse(element['testimonial_text'].toString());
            final String subtitleString =
                parse(subtitleData.body.text).documentElement.text;
            title = element['name'].toString();
            subtitle = subtitleString;
            x.add(
              Card(
                color: pagesColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: ListTile(
                    dense: true,
                    isThreeLine: true,
                    trailing: InkWell(
                      onTap: () {
                        launchURL(element['link'].toString());
                      },
                      child: Text(
                        'المصدر',
                        style: TextStyle(
                          fontSize: 10,
                          color: yellowFonts,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: whiteFonts,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 8,
                            color: whiteFonts.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          subtitle,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 10,
                            height: 1.5,
                            color: whiteFonts,
                          ),
                        ),
                      ],
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: appColorDark,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image(
                        width: 20,
                        height: 20,
                        image:
                            AssetImage('assets/images/icons/user-remove.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }
      }
    },
  );
  return Column(
    children: [
      CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 2.5,
          onPageChanged: (index, reason) {
            _current = index;
          },
        ),
        items: x.map((card) {
          return Builder(builder: (BuildContext context) {
            return card;
          });
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          x,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? whiteFonts
                    : whiteFonts.withOpacity(0.5),
              ),
            );
          },
        ),
      )
    ],
  );
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> submitRequest(Map formData) async {
  await http
      .post(Uri.parse("https://test.ijdcreatives.com/api/public/api/contactus"),
          body: formData)
      .then((value) async {});
}
