// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/blog_subs/blog_search_result.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/media_subs/media_search_result.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/projects_subs/projects_search_result.dart';
import 'package:saeud_alkhamis/views/home/home_tabs/store_subs/store_search_result.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class SearchScreen extends StatefulWidget {
  String searchDataFrom;
  SearchScreen({Key key, @required this.searchDataFrom}) : super(key: key);

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState(searchDataFrom: searchDataFrom);
}

class _SearchScreenState extends State<SearchScreen> {
  String searchDataFrom;
  _SearchScreenState({@required this.searchDataFrom});
  bool isChecked;
  TextEditingController seachText;
  @override
  void initState() {
    seachText = TextEditingController();
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    onPressed: () {
                      if (isChecked == true) {
                        if (searchDataFrom == 'Blog') {
                          Navigator.of(context).pop();
                          push(
                            context,
                            BlogSearchResult(
                              searchKeyword: seachText.text,
                            ),
                          );
                        } else if (searchDataFrom == 'Media') {
                          Navigator.of(context).pop();
                          push(
                            context,
                            MediaSearchResult(
                              searchKeyword: seachText.text,
                            ),
                          );
                        } else if (searchDataFrom == 'Store') {
                          Navigator.of(context).pop();
                          push(
                            context,
                            StoreSearchResult(
                              searchKeyword: seachText.text,
                            ),
                          );
                        } else if (searchDataFrom == 'Projects') {
                          Navigator.of(context).pop();
                          push(
                            context,
                            ProjectsSearchResult(
                              searchKeyword: seachText.text,
                            ),
                          );
                        }
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    height: 40,
                    minWidth: 40,
                    color: isChecked ? yellowFonts : whiteFonts,
                    textColor: darkFonts,
                    padding: EdgeInsets.zero,
                    child: ImageIcon(
                      isChecked
                          ? AssetImage('assets/images/icons/done.png')
                          : AssetImage('assets/images/icons/close.png'),
                      size: 16,
                    ),
                    shape: CircleBorder(),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: TextField(
                      controller: seachText,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            isChecked = true;
                          });
                        } else {
                          setState(() {
                            isChecked = false;
                          });
                        }
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 0),
                        filled: true,
                        fillColor: pagesColor,
                        hintText: 'أكتب كلمات البحث ..',
                        hintTextDirection: TextDirection.rtl,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
