import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class StoreFilters extends StatefulWidget {
  const StoreFilters({Key key}) : super(key: key);

  @override
  _StoreFiltersState createState() => _StoreFiltersState();
}

class _StoreFiltersState extends State<StoreFilters> {
  List<String> tags = [];
  List<String> options = [
    'فنون',
    'نفسية',
    'تقنية',
    'تاريخية',
  ];
  bool isNotValid;
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
                          'فلتر حسب النوع',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: DropdownButtonFormField(
                          hint: Text('كتبي'),
                          isDense: false,
                          elevation: 1,
                          alignment: AlignmentDirectional.centerStart,
                          iconDisabledColor: yellowFonts,
                          iconEnabledColor: yellowFonts,
                          items: const [
                            DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: "1",
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: whiteFonts,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: "2",
                              child: Text(
                                "2",
                                style: TextStyle(
                                  color: whiteFonts,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                          icon: Icon(Icons.arrow_downward),
                          onChanged: (value) {},
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: pagesColor,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'فلتر حسب التصنيف',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                          ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderColor: pagesColor,
                            );
                          },
                          activeStyle: (i, v) {
                            return C2ChoiceStyle(
                              showCheckmark: false,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              borderColor: yellowFonts,
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'فلتر حسب التاريخ',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
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
                            helperText: '',
                            helperStyle: TextStyle(fontSize: 0),
                            filled: true,
                            fillColor: pagesColor,
                            isDense: true,
                            hintText: '00/00/0000',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon:
                                Icon(Icons.calendar_today, color: yellowFonts),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حدث',
                      style: TextStyle(
                        color: whiteFonts,
                        fontSize: 12,
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
                        fontSize: 12,
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
}
