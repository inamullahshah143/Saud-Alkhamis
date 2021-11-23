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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: whiteFonts,
                      ),
                      child: ImageIcon(
                        AssetImage('assets/images/icons/close.png'),
                        color: darkFonts,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
