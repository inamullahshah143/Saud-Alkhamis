// ignore_for_file: no_logic_in_create_state

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';
import 'package:intl/intl.dart' as intl;

class FilterForm extends StatefulWidget {
  const FilterForm({Key key}) : super(key: key);

  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  List<String> tags = [];
  List<String> options = [
    'استشارات',
    'سناب شات',
    'دورات',
    'تيليقران',
  ];
  TextEditingController _dateController;
  bool isNotValid;
  @override
  void initState() {
    _dateController = TextEditingController();
    super.initState();
  }
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
                          readOnly: true,
                          controller:_dateController,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: whiteFonts,
                            fontSize: 12,
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
                            isDense: true,
                            hintText: '00/00/0000',
                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: yellowFonts,
                              ),
                              onPressed: () {
                                selectDate(context);
                              },
                            ),
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
