import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/blog_subs/blog_view.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:html/parser.dart';
import 'package:share/share.dart';

Future<List<Widget>> getDashboardBlogs(BuildContext context) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<Widget> blogView = [];
  String subtitle = '';
  String title = '';
  String date = '';
  String thumbnail = '';
  String views = '0';
  String likes = '0';
  int commentCount = 0;
  await http.get(Uri.parse("$apiURL/posts?per_page=10")).then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final e in data) {
          await http
              .get(Uri.parse("$apiURL/categories/${e['categories'][0]}"))
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
    final subtitleData = parse(x[i]['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = x[i]['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    commentCount = x[i]['data']['comment_count'];
    if (x[i]['data']['post-meta-fields'].isNotEmpty &&
        x[i]['data']['post-meta-fields']['views'] != null) {
      views = x[i]['data']['post-meta-fields']['views'][0].toString();
    } else {
      views = '0';
    }
    if (x[i]['data']['post-meta-fields'].isNotEmpty &&
        x[i]['data']['post-meta-fields']['_wpac_post_likes'] != null) {
      likes =
          x[i]['data']['post-meta-fields']['_wpac_post_likes'][0].toString();
    } else {
      likes = '0';
    }
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
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
    await blogView.add(
      BlogView(
        type: x[i]['category'],
        title: title,
        date: date,
        blogText: subtitle,
        commentCount: commentCount,
        viewsCount: int.parse(views),
        likesCount: int.parse(likes),
        thumbnail: thumbnail,
        onComment: () {},
        onShare: () async {
          final RenderBox box = context.findRenderObject() as RenderBox;
          await Share.share(x[i]['data']['link'],
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
    );
    await y.add(
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
        viewCount: views.toString(),
        likeCount: likes.toString(),
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
  String views = '0';
  String likes = '0';
  int commentCount = 0;
  await http.get(Uri.parse("$apiURL/posts?per_page=100")).then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final e in data) {
          await http
              .get(Uri.parse("$apiURL/categories/${e['categories'][0]}"))
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
    final subtitleData = parse(x[i]['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = x[i]['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    commentCount = x[i]['data']['comment_count'];
    if (x[i]['data']['post-meta-fields'].isNotEmpty &&
        x[i]['data']['post-meta-fields']['views'] != null) {
      views = x[i]['data']['post-meta-fields']['views'][0].toString();
    } else {
      views = '0';
    }
    if (x[i]['data']['post-meta-fields'].isNotEmpty &&
        x[i]['data']['post-meta-fields']['_wpac_post_likes'] != null) {
      likes =
          x[i]['data']['post-meta-fields']['_wpac_post_likes'][0].toString();
    } else {
      likes = '0';
    }
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
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
    await blogView.add(
      BlogView(
        type: x[i]['category'],
        title: title,
        date: date,
        blogText: subtitle,
        commentCount: commentCount,
        viewsCount: int.parse(views),
        likesCount: int.parse(likes),
        thumbnail: thumbnail,
        onComment: () {},
        onShare: () async {
          final RenderBox box = context.findRenderObject() as RenderBox;
          await Share.share(x[i]['data']['link'],
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
    );
    await y.add(
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
        viewCount: views.toString(),
        likeCount: likes.toString(),
      ),
    );
  }
  return y;
}

Future<List<Widget>> searchBlogs(BuildContext context, searchKeyword) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<Widget> blogView = [];
  String subtitle = '';
  String title = '';
  String date = '';
  String views = '0';
  String likes = '0';
  String thumbnail = '';
  int commentCount = 0;
  await http
      .get(Uri.parse("$apiURL/posts?search=${searchKeyword}"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final e in data) {
          await http
              .get(Uri.parse("$apiURL/categories/${e['categories'][0]}"))
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
    final subtitleData = parse(x[i]['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = x[i]['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    if (x[i]['data']['post-meta-fields']['views'] != null) {
      views = x[i]['data']['post-meta-fields']['views'][0].toString();
    } else {
      views = '0';
    }
    if (x[i]['data']['post-meta-fields']['_wpac_post_likes'] != null) {
      likes =
          x[i]['data']['post-meta-fields']['_wpac_post_likes'][0].toString();
    } else {
      likes = '0';
    }
    commentCount = x[i]['data']['comment_count'];
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
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
    await blogView.add(
      BlogView(
        type: x[i]['category'],
        title: title,
        date: date,
        blogText: subtitle,
        viewsCount: int.parse(views),
        likesCount: int.parse(likes),
        commentCount: commentCount,
        thumbnail: thumbnail,
        onComment: () {},
        onShare: () async {
          final RenderBox box = context.findRenderObject() as RenderBox;
          await Share.share(x[i]['data']['link'],
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
    );
    await y.add(
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
        viewCount: views.toString(),
        likeCount: likes.toString(),
      ),
    );
  }
  return y;
}

Future<List<Widget>> filterBlogs(BuildContext context, filterKeyword) async {
  List<Map> x = [];
  List<Widget> y = [];
  List<Widget> blogView = [];
  String subtitle = '';
  String title = '';
  String date = '';
  String views = '0';
  String likes = '0';
  String thumbnail = '';
  int commentCount = 0;
  await http
      .get(
          Uri.parse("$apiURL/posts?per_page=100&categories[]=${filterKeyword}"))
      .then((value) async {
    if (value.statusCode == 200) {
      List data = jsonDecode(value.body);
      if (data.isNotEmpty) {
        for (final e in data) {
          await http
              .get(Uri.parse("$apiURL/categories/${e['categories'][0]}"))
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
    final subtitleData = parse(x[i]['data']['content']['rendered'].toString());
    final String subtitleString =
        parse(subtitleData.body.text).documentElement.text;
    title = x[i]['data']['title']['rendered'].toString();
    subtitle = subtitleString;
    if (x[i]['data']['post-meta-fields']['views'] != null) {
      views = x[i]['data']['post-meta-fields']['views'][0].toString();
    } else {
      views = '0';
    }
    if (x[i]['data']['post-meta-fields']['_wpac_post_likes'] != null) {
      likes =
          x[i]['data']['post-meta-fields']['_wpac_post_likes'][0].toString();
    } else {
      likes = '0';
    }
    commentCount = x[i]['data']['comment_count'];
    date = DateFormat('dd/MM/yyyy')
        .format(DateTime.tryParse(x[i]['data']['date']));
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
    await blogView.add(
      BlogView(
        type: x[i]['category'],
        title: title,
        date: date,
        blogText: subtitle,
        viewsCount: int.parse(views),
        likesCount: int.parse(likes),
        commentCount: commentCount,
        thumbnail: thumbnail,
        onComment: () {},
        onShare: () async {
          final RenderBox box = context.findRenderObject() as RenderBox;
          await Share.share(x[i]['data']['link'],
              sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
    );
    await y.add(
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
        viewCount: views.toString(),
        likeCount: likes.toString(),
      ),
    );
  }
  return y;
}
