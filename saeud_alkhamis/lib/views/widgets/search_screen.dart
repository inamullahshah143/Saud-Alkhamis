import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

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
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  height: 40,
                  minWidth: 40,
                  color: whiteFonts,
                  textColor: darkFonts,
                  padding: EdgeInsets.zero,
                  child: ImageIcon(
                    AssetImage('assets/images/icons/close.png'),
                    size: 16,
                  ),
                  shape: CircleBorder(),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right:10.0),
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
                      ),
                      onChanged: (value) {},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 0),
                        filled: true,
                        fillColor: pagesColor,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
