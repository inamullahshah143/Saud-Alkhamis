// ignore_for_file: no_logic_in_create_state

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/controller/timeline_list.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class Notices extends StatefulWidget {
  const Notices({Key key}) : super(key: key);

  @override
  _NoticesState createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  ScrollController scrollController = ScrollController();
  Future<List<Widget>> timeline;
  @override
  void initState() {
    timeline = getTimeline(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: whiteFonts,
                textColor: darkFonts,
                child: ImageIcon(
                  AssetImage('assets/images/icons/close.png'),
                  size: 14,
                ),
                padding: EdgeInsets.all(10),
                shape: CircleBorder(),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    color: appColorDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            image: DecorationImage(
                              image: AssetImage('assets/images/1.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: yellowFonts,
                              width: 2,
                            ),
                          ),
                        ),
                        Text(
                          '???????? ????????????',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: 75,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: redFonts,
                          ),
                          child: Text(
                            '????????????',
                            style: TextStyle(
                              color: whiteFonts,
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              height: 200,
                              child: GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 4,
                                childAspectRatio: 1.2,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '3K',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '????????????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '40K',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '????????????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '2.2K',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '????????????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '218K',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '??????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '25',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '???????????? ??????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '250',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '?????????? ????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '1K',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '?????? ??????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '-',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_circle,
                                          color: redFonts,
                                          size: 16,
                                        ),
                                        Text(
                                          '???????? ??????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '69',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          '???????????????? ????????????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '258',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          '?????????????? ????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '202',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          '?????????? ????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: const [
                                        Text(
                                          '264',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          '?????????? ????????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: whiteFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '???????????? 1986 ?? ???? ?????????????? ?????????????? ???????????????? ???????????? ?????????????? ???????? ?????????????? ???????????? ???????????? ?????????? ?????????? ???????? ?????? ?????????????? ?????????????????????? ???????????????? ???????????? ???????????? ?????????? ?????????? ?????? ?????????? ?????????? MBC?? ???????????? ???????????? ?????????? ?????????????? ?????????????? ?????????????? ???????? ???????? ?????????????? ???????????????? ?????? ?????????? ?????????????????? ???????? ?????????????? ???? ?????????? ?????????????? ?????????? ?????????? (???????? ????????)?? ???????? ?????????????? ???????????????? ?????????????????????? ???????????????? ???????? ?????????????????? ?????????????????? ???????????? ???????????????? ???? ???????????????????? ???????? ???????????? ???? ?????????? ?????????? ?????????? ???????? ???????? ?????????? ?????????? ?????????????? ?????? ???????????????? ???????? ???? ?????? ???????? ???????? ???????????? ???? ???????? ???????????? ???? ???????????? ???????? ?????? ?????? ?????????????? ???????? ?????????????? ???? ???????? ?????? ?????? ???????????? ???? ?????? ???????? ???? ?????? ???????????? ???????????? ???????? ?????? ????????????.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: whiteFonts,
                              height: 1.5,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '???????? ????????????',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: yellowFonts,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        FutureBuilder(
                          future: timeline,
                          builder: (context, snapshot) => snapshot
                                      .connectionState ==
                                  ConnectionState.waiting
                              ? Center(
                                  child: CupertinoActivityIndicator(),
                                )
                              : snapshot.hasData
                                  ? SizedBox(
                                      height: 150,
                                      child: Scrollbar(
                                        isAlwaysShown: true,
                                        radius: Radius.circular(10),
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            itemCount: snapshot.data.length,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return snapshot.data[index];
                                            }),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        '???? ???????? ??????????\n ??????',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: whiteFonts.withOpacity(0.5)),
                                      ),
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListItem extends StatefulWidget {
  String year;
  String title;
  String subtitle;
  ListItem({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.year,
  }) : super(key: key);

  @override
  State<ListItem> createState() =>
      _ListItemState(year: year, title: title, subtitle: subtitle);
}

class _ListItemState extends State<ListItem> {
  String year;
  String title;
  String subtitle;
  _ListItemState({
    @required this.title,
    @required this.subtitle,
    @required this.year,
  });
  final key = GlobalKey();
  double dividerWidth;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        dividerWidth = key.currentContext.size.width;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        key: key,
        children: [
          Text(
            title,
            style: TextStyle(
              color: whiteFonts,
              fontSize: 16,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: whiteFonts,
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: yellowFonts,
                ),
                child: Text(
                  widget.year,
                  style: TextStyle(
                    color: darkFonts,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: dividerWidth,
                child: Divider(
                  thickness: 2,
                  color: pagesColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
