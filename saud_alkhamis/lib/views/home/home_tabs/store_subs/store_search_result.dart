// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/controller/products_controller.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class StoreSearchResult extends StatefulWidget {
  String searchKeyword;
  StoreSearchResult({Key key, @required this.searchKeyword}) : super(key: key);

  @override
  _StoreSearchResultState createState() =>
      _StoreSearchResultState(searchKeyword: searchKeyword);
}

class _StoreSearchResultState extends State<StoreSearchResult> {
  String searchKeyword;
  _StoreSearchResultState({@required this.searchKeyword});

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
                    onPressed: () {
                      showSearchScreen(context, 'Store');
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
                            hintText: '???????? ?????????? ?????????? ..',
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
                          '???? ???????? ?????????? ??????',
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
            FutureBuilder(
              future: searchBooks(context, searchKeyword),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) {
                        return snapshot.data[index];
                      },
                      childCount: snapshot.data.length,
                    ),
                  );
                }
                if (snapshot.data.size == 0) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text('???? ???????? ?????????? ??????'),
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(snapshot.error),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
