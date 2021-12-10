import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:intl/intl.dart' as intl;

class BlogFilters extends StatefulWidget {
  const BlogFilters({Key key}) : super(key: key);

  @override
  _BlogFiltersState createState() => _BlogFiltersState();
}

class _BlogFiltersState extends State<BlogFilters> {
  TextEditingController _dateController;
  bool isNotValid;
  bool isRecent;
  bool isOldest;
  @override
  void initState() {
    _dateController = TextEditingController();
    isRecent = false;
    isOldest = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isOldest = false;
          isRecent = false;
        });
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'فلتر حسب الأولوية',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isOldest = true;
                                    isRecent = false;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    color: isOldest ? yellowFonts : pagesColor,
                                  ),
                                  child: Text(
                                    'الأحدث',
                                    style: TextStyle(
                                      color: whiteFonts,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isOldest = false;
                                    isRecent = true;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    color: isRecent ? yellowFonts : pagesColor,
                                  ),
                                  child: Text(
                                    'الأقدم',
                                    style: TextStyle(
                                      color: whiteFonts,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'فلتر حسب التاريخ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: TextField(
                          readOnly: true,
                          controller: _dateController,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 14,
                          ),
                          onTap: () {
                            selectDate(context);
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 0),
                            helperText: '',
                            helperStyle: TextStyle(fontSize: 0),
                            filled: true,
                            fillColor: pagesColor,
                            hintText: 'تحديد التاريخ',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.arrow_downward,
                                color: yellowFonts,
                              ),
                              onPressed: () {
                                selectDate(context);
                              },
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حدث',
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: MaterialButton(
                        onPressed: () {},
                        height: 40,
                        minWidth: 40,
                        color: isNotValid != true ? yellowFonts : Colors.red,
                        textColor: darkFonts,
                        padding: EdgeInsets.zero,
                        child: ImageIcon(
                          isNotValid != true
                              ? AssetImage('assets/images/icons/refresh-4.png')
                              : AssetImage('assets/images/icons/close.png'),
                          size: 16,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                    Text(
                      'الصفحة',
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1990),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        _dateController.text = intl.DateFormat.yMd().format(picked);
      });
    }
  }
}
