// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class BlogSearchResult extends StatefulWidget {
  String searchKeyword;
  BlogSearchResult({Key key, @required this.searchKeyword}) : super(key: key);

  @override
  _BlogSearchResultState createState() =>
      _BlogSearchResultState(searchKeyword: searchKeyword);
}

class _BlogSearchResultState extends State<BlogSearchResult> {
  String searchKeyword;
  _BlogSearchResultState({@required this.searchKeyword});

  TextEditingController seachText;
  @override
  void initState() {
    seachText = TextEditingController(text: searchKeyword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: pagesColor,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: height * 0.5,
              collapsedHeight: height * 0.25 - 125,
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
                    onPressed: () {
                      showSearchScreen(context, 'Blog');
                    },
                    height: 40,
                    minWidth: 40,
                    color: darkFonts,
                    textColor: yellowFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      AssetImage('assets/images/icons/search-2.png'),
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
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 25,
                        ),
                        child: TextField(
                          controller: seachText,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 12,
                          ),
                          enabled: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 0),
                            filled: true,
                            fillColor: appColorDark,
                            isDense: true,
                            hintText: 'أكتب كلمات البحث ..',
                            hintTextDirection: TextDirection.rtl,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.red,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'نتائج البحث',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: yellowFonts,
                          ),
                        ),
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
                    },
                    child: CustomListTile(
                      type: 'استشارت',
                      title: 'تقديم استشارة في تجربة المستخدم',
                      subtitle:
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                      date: '03/05/2021',
                      isShareable: false,
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
