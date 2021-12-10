import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key key}) : super(key: key);

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  bool isNotValid;
  int currentIndex = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List cardList = [
    Card(
      color: pagesColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          dense: true,
          isThreeLine: true,
          trailing: Text(
            'المصدر',
            style: TextStyle(
              fontSize: 10,
              color: yellowFonts,
              decoration: TextDecoration.underline,
            ),
          ),
          title: Text(
            'خالد',
            style: TextStyle(
              fontSize: 14,
              color: whiteFonts,
            ),
            textDirection: TextDirection.rtl,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '03/05/2021',
                style: TextStyle(
                  fontSize: 8,
                  color: whiteFonts.withOpacity(0.5),
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
                maxLines: 3,
                style: TextStyle(
                  fontSize: 10,
                  height: 1.5,
                  color: whiteFonts,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          leading: Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: appColorDark,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Image(
              width: 20,
              height: 20,
              image: AssetImage('assets/images/icons/user-remove.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    ),
  ];
  @override
  void initState() {
    isNotValid = false;
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
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'رأي المستفيدين من الخدمات',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: whiteFonts,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  aspectRatio: 2.5,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                ),
                                items: cardList.map((card) {
                                  return Builder(
                                      builder: (BuildContext context) {
                                    return card;
                                  });
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: map<Widget>(cardList, (index, url) {
                                  return Container(
                                    width: 10.0,
                                    height: 10.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == index
                                          ? whiteFonts
                                          : Colors.grey,
                                    ),
                                  );
                                }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          '04',
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'طلب جديد',
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          '02',
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'قيد التنفيذ',
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          '250',
                                          style: TextStyle(
                                            color: yellowFonts,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'طلب منتهي',
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
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextFormField(
                                          textDirection: TextDirection.rtl,
                                          validator: (value) {
                                            if (value.trim().isNotEmpty) {
                                              setState(() {
                                                isNotValid = false;
                                              });
                                              return null;
                                            }

                                            setState(() {
                                              isNotValid = true;
                                            });
                                            return '';
                                          },
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                          onChanged: (value) {},
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(fontSize: 0),
                                            helperText: '',
                                            helperStyle: TextStyle(fontSize: 0),
                                            filled: true,
                                            fillColor: pagesColor,
                                            hintText: 'الاسم',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.red,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextFormField(
                                          textDirection: TextDirection.rtl,
                                          validator: (value) {
                                            if (value.trim().isNotEmpty) {
                                              setState(() {
                                                isNotValid = false;
                                              });
                                              return null;
                                            }

                                            setState(() {
                                              isNotValid = true;
                                            });
                                            return '';
                                          },
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                          onChanged: (value) {},
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(fontSize: 0),
                                            helperText: '',
                                            helperStyle: TextStyle(fontSize: 0),
                                            filled: true,
                                            fillColor: pagesColor,
                                            hintText: 'رقم الجوال',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.red,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextFormField(
                                          textDirection: TextDirection.rtl,
                                          validator: (value) {
                                            if (value.trim().isNotEmpty) {
                                              setState(() {
                                                isNotValid = false;
                                              });
                                              return null;
                                            }
                                            setState(() {
                                              isNotValid = true;
                                            });
                                            return '';
                                          },
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                          onChanged: (value) {},
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(fontSize: 0),
                                            helperText: '',
                                            helperStyle: TextStyle(fontSize: 0),
                                            filled: true,
                                            fillColor: pagesColor,
                                            hintText: 'البريد الالكتروني',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.red,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: DropdownButtonFormField(
                                          hint: Text('نوع الطلب'),
                                          isExpanded: true,
                                          isDense: false,
                                          elevation: 1,
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          iconDisabledColor: yellowFonts,
                                          iconEnabledColor: yellowFonts,
                                          items: const [
                                            DropdownMenuItem(
                                              alignment: AlignmentDirectional
                                                  .centerStart,
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
                                              alignment: AlignmentDirectional
                                                  .centerStart,
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
                                          validator: (value) {
                                            if (value != null) {
                                              setState(() {
                                                isNotValid = false;
                                              });
                                              return null;
                                            }
                                            setState(() {
                                              isNotValid = true;
                                            });
                                            return '';
                                          },
                                          icon: Icon(Icons.arrow_downward),
                                          onChanged: (value) {},
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(fontSize: 0),
                                            helperText: '',
                                            helperStyle: TextStyle(fontSize: 0),
                                            filled: true,
                                            fillColor: pagesColor,
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.red,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child: TextFormField(
                                          textDirection: TextDirection.rtl,
                                          validator: (value) {
                                            if (value.trim().isNotEmpty) {
                                              setState(() {
                                                isNotValid = false;
                                              });
                                              return null;
                                            }
                                            setState(() {
                                              isNotValid = true;
                                            });
                                            return '';
                                          },
                                          style: TextStyle(
                                            color: whiteFonts,
                                            fontSize: 14,
                                          ),
                                          onChanged: (value) {},
                                          keyboardType: TextInputType.text,
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(fontSize: 0),
                                            helperText: '',
                                            helperStyle: TextStyle(fontSize: 0),
                                            filled: true,
                                            fillColor: pagesColor,
                                            hintText: 'الوصف...',
                                            hintTextDirection:
                                                TextDirection.rtl,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.red,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isNotValid ? 'حقول' : 'إرسال',
                            style: TextStyle(
                              color: whiteFonts,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  // Navigator.of(context).pop();
                                }
                              },
                              height: 40,
                              minWidth: 40,
                              color:
                                  isNotValid != true ? yellowFonts : Colors.red,
                              textColor: darkFonts,
                              padding: EdgeInsets.zero,
                              child: ImageIcon(
                                isNotValid != true
                                    ? AssetImage('assets/images/icons/done.png')
                                    : AssetImage(
                                        'assets/images/icons/close.png'),
                                size: 16,
                              ),
                              shape: CircleBorder(),
                            ),
                          ),
                          Text(
                            isNotValid ? 'مطلوبة' : 'الطلب',
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
            ],
          ),
        ),
      ),
    );
  }
}
