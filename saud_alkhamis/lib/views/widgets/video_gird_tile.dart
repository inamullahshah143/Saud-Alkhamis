import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

Widget videoGridTile(
  BuildContext context,
  String type,
  String date,
  String title,
  String thumnail,
  String likes,
  String views,
  bool isShareable,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: appColorDark,
    ),
    child: Column(
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
            maxLines: 2,
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
            isShareable
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'يوجد 38 زيارة',
                        style: TextStyle(
                          fontSize: 8,
                          color: yellowFonts,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage('assets/images/icons/link.png'),
                          color: yellowFonts,
                        ),
                      ),
                      Text(
                        'زيارة',
                        style: TextStyle(
                          fontSize: 10,
                          color: whiteFonts,
                        ),
                      ),
                    ],
                  )
                : Column(
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
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/like.png'),
                    color: yellowFonts,
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
  );
}
