// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/dashboard_subs/notices.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'add_comment.dart';

class BlogView extends StatefulWidget {
  const BlogView({Key key}) : super(key: key);

  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  GlobalKey key = GlobalKey();

  double x, y;

  void getOffset(GlobalKey key) {
    RenderBox box = key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);

    setState(() {
      x = position.dx;
      y = position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var demoText =
        "ذلك الشاب الذي ارهق والده بالطلبات، تفاجئه والدته بحاسب محمول، مختلف عن أخوانه، اتفق مع زوجته بأن المستقبل سيكون افضل، متقوقع في عالمه المليء بالأسلاك والكاميرات والعدسات والقصائد والخواطر وغارق في المساحة البيضاء والسوداء دون الحاجة الى المساحة الرمادية فكانت النتيجة إنسان غير اجتماعي سوداوي وسلبي وبنفس الوقت متناقض ( طبيعة الكائنات البشرية ) يقدم مايستطيع ومالا يستطيع لتقديم المساعدة فكان دائما يتحدث عن عالمه بعيدا عن العالم الخارجي وعندما يواجه العالم الخارجي يفهم الأمور بالفطرة هناك حق وهناك باطل ليس هناك اختلاف، يعمل ويدرس ويتعلم من عالمه بنفس الوقت، يفضل التجربة، مليء بالتغيير، اصبح محرك بحث العائلة والأصدقاء ومن هم افتراضيين في عالم الإنترنت لم يفهم ضميره جيداً حتى اصبح مصدر ضغط له وكانت النتيجة كالآتي";
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: pagesColor,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: height * 0.5,
              collapsedHeight: height * 0.25 - 50,
              elevation: 0,
              pinned: true,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  height: 40,
                  minWidth: 40,
                  color: yellowFonts,
                  textColor: darkFonts,
                  padding: EdgeInsets.zero,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/arrow_back.png'),
                    size: 16,
                  ),
                  shape: CircleBorder(),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    key: key,
                    onPressed: () {
                      getOffset(key);
                      showMyDialog(context, x, y + 5);
                    },
                    height: 40,
                    minWidth: 40,
                    color: yellowFonts,
                    textColor: darkFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      AssetImage('assets/images/icons/plus.png'),
                      size: 16,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    showSearchScreen(context, 'Blog');
                  },
                  height: 40,
                  minWidth: 40,
                  color: yellowFonts,
                  textColor: darkFonts,
                  padding: EdgeInsets.zero,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/search-2.png'),
                    size: 16,
                  ),
                  shape: CircleBorder(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    onPressed: () {
                      showModalBottomSheet(
                        enableDrag: true,
                        isScrollControlled: true,
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) => Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                          ),
                          child: Notices(),
                        ),
                      );
                    },
                    height: 40,
                    minWidth: 40,
                    color: yellowFonts,
                    textColor: darkFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      AssetImage('assets/images/icons/person.png'),
                      size: 16,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 130),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        pagesColor.withOpacity(0),
                        pagesColor.withOpacity(0.5),
                        pagesColor,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: 90,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: appColorDark,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                      'assets/images/icons/chat.png',
                                    ),
                                    size: 14,
                                    color: yellowFonts,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "التعليقات",
                                    style: TextStyle(
                                      color: whiteFonts,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: appColorDark,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                      color: whiteFonts,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'عن العظماء',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: whiteFonts,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Text(
                                'عندما يكون منافسك هو نفسك',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: whiteFonts,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '03/05/2021',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: whiteFonts.withOpacity(0.5),
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 12 تعليق',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/chat.png'),
                                  size: 16,
                                  color: yellowFonts,
                                ),
                              ),
                              Text(
                                'التعليقات',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: whiteFonts,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 32 زيارة',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/view-2.png'),
                                  color: yellowFonts,
                                ),
                              ),
                              Text(
                                'قراءة',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: whiteFonts,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'يوجد 12 إعجاب',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: yellowFonts,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage('assets/images/icons/like.png'),
                                  size: 16,
                                  color: yellowFonts,
                                ),
                              ),
                              Text(
                                'إعجاب',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: whiteFonts,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              flexibleSpace: BackgroundFlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/6.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: const [
                          Colors.transparent,
                          pagesColor,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      demoText + demoText + demoText,
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Card(
                color: appColorDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: ListTile(
                    dense: true,
                    trailing: ImageIcon(
                      AssetImage('assets/images/icons/arrow_forward.png'),
                      color: yellowFonts,
                      size: 16,
                    ),
                    title: Text(
                      "كن غنياً وأتخذ بالأسباب !",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        color: whiteFonts,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    leading: ImageIcon(
                      AssetImage('assets/images/icons/post.png'),
                      color: yellowFonts,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "إضافة",
                    style: TextStyle(
                      fontSize: 14,
                      color: whiteFonts,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        enableDrag: true,
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) =>
                            SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0),
                                ),
                              ),
                              child: AddComment(),
                            ),
                          ),
                        ),
                      );
                    },
                    height: 40,
                    minWidth: 40,
                    color: yellowFonts,
                    textColor: darkFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      AssetImage('assets/images/icons/plus.png'),
                      size: 16,
                    ),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "تعليق",
                    style: TextStyle(
                      fontSize: 14,
                      color: whiteFonts,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            //   Padding(
            //     padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //     child: Card(
            //       color: appColorDark,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       margin: EdgeInsets.symmetric(vertical: 10),
            //       child: Padding(
            //         padding: EdgeInsets.only(left: 8.0, right: 8.0),
            //         child: ListTile(
            //           dense: true,
            //           isThreeLine: true,
            //           trailing: Text(
            //             'المصدر',
            //             style: TextStyle(
            //               fontSize: 8,
            //               color: yellowFonts,
            //               decoration: TextDecoration.underline,
            //             ),
            //           ),
            //           title: Text(
            //             'خالد',
            //             style: TextStyle(
            //               fontSize: 12,
            //               color: whiteFonts,
            //             ),
            //             textDirection: TextDirection.rtl,
            //           ),
            //           subtitle: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 '03/05/2021',
            //                 style: TextStyle(
            //                   fontSize: 6,
            //                   color: whiteFonts.withOpacity(0.5),
            //                 ),
            //                 textDirection: TextDirection.rtl,
            //               ),
            //               Text(
            //                 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
            //                 maxLines: 2,
            //                 style: TextStyle(
            //                   fontSize: 8,
            //                   color: whiteFonts,
            //                 ),
            //                 textDirection: TextDirection.rtl,
            //               ),
            //             ],
            //           ),
            //           leading: Container(
            //             height: 40,
            //             width: 40,
            //             clipBehavior: Clip.hardEdge,
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               color: pagesColor,
            //               borderRadius: BorderRadius.circular(40),
            //             ),
            //             child: Image(
            //               width: 20,
            //               height: 20,
            //               image:
            //                   AssetImage('assets/images/icons/user-remove.png'),
            //               fit: BoxFit.contain,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
