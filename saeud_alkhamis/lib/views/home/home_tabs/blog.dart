import 'package:background_app_bar/background_app_bar.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/blog_subs/blog_view.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class Blog extends StatefulWidget {
  const Blog({Key key}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  List<String> tags = [];
  List<String> options = [
    'الكل',
    'عن العظماء',
    'من الواقع',
    'من حياتي',
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: pagesColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * 0.5,
            collapsedHeight: height * 0.25 - 125,
            elevation: 0,
            automaticallyImplyLeading: false,
            pinned: true,
            leadingWidth: 0,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: appColorLight,
                    ),
                    child: ImageIcon(
                      AssetImage('assets/images/icons/person.png'),
                      color: darkFonts,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: appColorLight,
                    ),
                    child: ImageIcon(
                      AssetImage('assets/images/icons/search-2.png'),
                      color: darkFonts,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: appColorLight,
                    ),
                    child: ImageIcon(
                      AssetImage('assets/images/icons/plus.png'),
                      color: darkFonts,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '04',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: yellowFonts,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'المتواجدون الان',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 125),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 100,
                    ),
                  ),
                  ChipsChoice<String>.multiple(
                    value: tags,
                    choiceActiveStyle: C2ChoiceStyle(
                      showCheckmark: false,
                      brightness: Brightness.dark,
                      color: yellowFonts,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderColor: pagesColor,
                    ),
                    choiceStyle: C2ChoiceStyle(
                      showCheckmark: false,
                      brightness: Brightness.dark,
                      color: pagesColor,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      borderColor: pagesColor,
                    ),
                    onChanged: (val) => setState(() => tags = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options,
                      value: (i, v) => v,
                      label: (i, v) => v,
                      tooltip: (i, v) => v,
                      style: (i, v) {
                        return C2ChoiceStyle(
                          showCheckmark: false,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderColor: pagesColor,
                        );
                      },
                      activeStyle: (i, v) {
                        return C2ChoiceStyle(
                          showCheckmark: false,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          borderColor: yellowFonts,
                        );
                      },
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: ImageIcon(
                      AssetImage('assets/images/icons/filter.png'),
                      size: 16,
                      color: yellowFonts,
                    ),
                    trailing: Text(
                      'آخر التحديثات',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: yellowFonts,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flexibleSpace: BackgroundFlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/1.png',
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
                InkWell(
                  onTap: () {
                    push(context, BlogView());
                  },
                  child: customListTile(
                    'استشارت',
                    'تقديم استشارة في تجربة المستخدم',
                    'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                    '03/05/2021',
                    false,
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
