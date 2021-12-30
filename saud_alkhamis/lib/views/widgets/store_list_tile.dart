import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class StoreListTile extends StatefulWidget {
  final Function onPressed;
  final Function onShare;
  final Function onBuy;
  final String type;
  final String date;
  final String thumnail;
  final String title;
  final String subtitle;
  final String rating;
  // ignore: use_key_in_widget_constructors
  const StoreListTile({
    @required this.onPressed,
    @required this.onShare,
    @required this.onBuy,
    @required this.type,
    @required this.date,
    @required this.thumnail,
    @required this.title,
    @required this.subtitle,
    @required this.rating,
  });

  @override
  // ignore: no_logic_in_create_state
  _StoreListTileState createState() => _StoreListTileState(
        onPressed: onPressed,
        onShare: onShare,
        onBuy: onBuy,
        type: type,
        date: date,
        thumnail: thumnail,
        title: title,
        subtitle: subtitle,
        rating: rating,
      );
}

class _StoreListTileState extends State<StoreListTile> {
  final Function onPressed;
  final Function onShare;
  final Function onBuy;
  final String type;
  final String date;
  final String thumnail;
  final String title;
  final String subtitle;
  final String rating;
  _StoreListTileState({
    @required this.onPressed,
    @required this.onShare,
    @required this.onBuy,
    @required this.type,
    @required this.date,
    @required this.thumnail,
    @required this.title,
    @required this.subtitle,
    @required this.rating,
  });
  bool isLiked;
  @override
  void initState() {
    isLiked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appColorDark,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: onPressed,
                child: Container(
                  width: 75,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: pagesColor,
                    image: DecorationImage(
                      image: NetworkImage(
                        thumnail,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              type,
                              style: TextStyle(
                                fontSize: 8,
                                color: whiteFonts,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Text(
                          date,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 8,
                            color: whiteFonts.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: whiteFonts,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            RatingBarIndicator(
                              rating: double.parse(rating.toString()),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: yellowFonts,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              unratedColor: pagesColor,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {},
                          height: 40,
                          minWidth: 40,
                          color: yellowFonts,
                          textColor: darkFonts,
                          padding: EdgeInsets.zero,
                          child: Icon(
                            FontAwesome5.play,
                            size: 16,
                          ),
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 10,
                        color: whiteFonts,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'يوجد 38 إعجاب',
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
              InkWell(
                onTap: onBuy,
                child: Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: pagesColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageIcon(
                        AssetImage(
                          'assets/images/icons/buy.png',
                        ),
                        size: 16,
                        color: yellowFonts,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "شراء",
                        style: TextStyle(
                          fontSize: 12,
                          color: whiteFonts,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: onShare,
                child: Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: pagesColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageIcon(
                        AssetImage(
                          'assets/images/icons/share.png',
                        ),
                        color: yellowFonts,
                        size: 16,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "مشاركة",
                        style: TextStyle(
                          fontSize: 12,
                          color: whiteFonts,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
