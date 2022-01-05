// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class VideoGridTile extends StatefulWidget {
  final Function onPressed;
  final String type;
  final String date;
  final String title;
  final String thumnail;
  final String likes;
  final String views;
  const VideoGridTile({
    @required this.onPressed,
    @required this.type,
    @required this.date,
    @required this.thumnail,
    @required this.title,
    @required this.likes,
    @required this.views,
  });

  @override
  // ignore: no_logic_in_create_state
  _VideoGridTileState createState() => _VideoGridTileState(
        onPressed: onPressed,
        type: type,
        date: date,
        thumnail: thumnail,
        title: title,
        likes: likes,
        views: views,
      );
}

class _VideoGridTileState extends State<VideoGridTile> {
  final Function onPressed;
  final String type;
  final String date;
  final String title;
  final String thumnail;
  final String likes;
  final String views;
  _VideoGridTileState({
    @required this.onPressed,
    @required this.type,
    @required this.date,
    @required this.thumnail,
    @required this.title,
    @required this.likes,
    @required this.views,
  });
  bool isLiked;
  @override
  void initState() {
    isLiked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: appColorDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(thumnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              dense: true,
              trailing: Text(
                date,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: whiteFonts.withOpacity(0.5),
                  fontSize: 8,
                ),
              ),
              title: Container(
                alignment: Alignment.center,
                child: Text(
                  type,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 8,
                    color: whiteFonts,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  color: whiteFonts,
                  height: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'يوجد ${views.toString()} مشاهدة',
                      style: TextStyle(
                        fontSize: 8,
                        color: yellowFonts,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/view-2.png'),
                        color: yellowFonts,
                      ),
                    ),
                    Text(
                      'مشاهدة',
                      style: TextStyle(
                        fontSize: 10,
                        color: whiteFonts,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'يوجد ${likes.toString()} إعجاب',
                      style: TextStyle(
                        fontSize: 8,
                        color: yellowFonts,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/like.png'),
                        color: isLiked ? yellowFonts : pagesColor,
                      ),
                    ),
                    Text(
                      'إعجاب',
                      style: TextStyle(
                        fontSize: 10,
                        color: whiteFonts,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
