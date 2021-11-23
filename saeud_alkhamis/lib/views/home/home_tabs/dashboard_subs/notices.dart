// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class Notices extends StatefulWidget {
  const Notices({Key key}) : super(key: key);

  @override
  _NoticesState createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
                        'سعود الخميس',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: whiteFonts,
                          fontSize: 12,
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
                          'تابعني',
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          height: 150,
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            childAspectRatio: 1.5,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Column(
                                  children: const [
                                    Text(
                                      '3K',
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'تيلقيرام',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'انستقرام',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'اليوتيوب',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'تويتر',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'مقالات شخصية',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'تقديم خدمة',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'تيك توك',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: redFonts,
                                      size: 12,
                                    ),
                                    Text(
                                      'سناب شات',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'اللقاءات والدورات',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'معلومات عامة',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'محتوى شخصي',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      style: TextStyle(
                                        color: yellowFonts,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'محتوى تقني',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'مواليد 1986 م في المملكة العربية السعودية بمدينة الرياض، مدير الإعلام الجديد بجامعة الملك سعود، مؤسس قسم الخدمات الإلكترونية بالمدينة الطبية بجامعة الملك سعود، معد ومنتج بقناة MBC، المصور الرسمي للبنك السعودي الفرنسي سابقاً، مهتم بنشر المعرفة والتحفيز على البحث والتطبيق، كانت البداية من ملهمي الدكتور مصطفى محمود (رحمه الله)، عاشق للتقنية والتصوير الفوتوغرافي والمرئي، متيم بالمجالات الإلهامية خصوصاً المتعلقة في الجرافيكس، اقرأ كثيراً عن تطوير الذات واسأل نفسي بشكل متكرر للبحث والحصول على الإجابات التي من بعد الله صنعت الكثير من نقاط التحول في حياتي، مؤمن بأن عقل الإنسان خارق ويستطيع أن يجمع بين عدة مجالات في زمن واحد مع طلب المزيد والسبب يعود الى الطموح.',
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'الخط المهني',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: yellowFonts,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: Align(
                          alignment: Alignment.center,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            controller: scrollController,
                            radius: Radius.circular(10),
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: ListItem(
                                      title: 'عمل حر',
                                      subtitle: 'تصميم مواقع ومنتديات',
                                      year: '2006'),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: ListItem(
                                      title: 'عمل حر',
                                      subtitle:
                                          'تصميم وتحليل مواقع، تصوير فوتوغرافي ومرئي، إستشارات تقنية، معد برامج MBC ',
                                      year: '2008'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      key: key,
      children: [
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: whiteFonts,
            fontSize: 12,
          ),
        ),
        Text(
          subtitle,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: whiteFonts,
            fontSize: 10,
          ),
        ),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: 25,
              height: 25,
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: yellowFonts,
              ),
              child: Text(
                widget.year,
                style: TextStyle(
                  color: darkFonts,
                  fontSize: 8,
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
    );
  }
}
