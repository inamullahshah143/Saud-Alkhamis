import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/controller/comments_controller.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key key}) : super(key: key);

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  Future<Widget> comments;
  final _formKey = GlobalKey<FormState>();
  bool isNotValid;
  bool isSubmited;
  Map requestFormData = {};

  @override
  void initState() {
    comments = getComments(context);
    isNotValid = false;
    isSubmited = false;
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
                              FutureBuilder(
                                future: comments,
                                builder: (context, snapshot) =>
                                    snapshot.connectionState ==
                                            ConnectionState.waiting
                                        ? Center(
                                            child: CupertinoActivityIndicator(),
                                          )
                                        : snapshot.hasData
                                            ? snapshot.data
                                            : Center(
                                                child: Text(
                                                  'لا توجد نتائج\n بحث',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: whiteFonts
                                                          .withOpacity(0.5)),
                                                ),
                                              ),
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
                                          onChanged: (value) {
                                            setState(() {
                                              requestFormData['username'] =
                                                  value;
                                            });
                                          },
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
                                          onChanged: (value) {
                                            setState(() {
                                              requestFormData['username'] =
                                                  value;
                                            });
                                          },
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
                                          onChanged: (value) {
                                            setState(() {
                                              requestFormData['username'] =
                                                  value;
                                            });
                                          },
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
                                          isDense: false,
                                          elevation: 1,
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          iconDisabledColor: yellowFonts,
                                          iconEnabledColor: yellowFonts,
                                          items: const [
                                            DropdownMenuItem(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              value: "تواصل",
                                              child: Text(
                                                "تواصل",
                                                style: TextStyle(
                                                  color: whiteFonts,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              value: "تقديم إستشارات",
                                              child: Text(
                                                "تقديم إستشارات",
                                                style: TextStyle(
                                                  color: whiteFonts,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              value: "تقديم دورات",
                                              child: Text(
                                                "تقديم دورات",
                                                style: TextStyle(
                                                  color: whiteFonts,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              value: "تقديم خدمات",
                                              child: Text(
                                                "تقديم خدمات",
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
                                          onChanged: (value) {
                                            setState(() {
                                              requestFormData['username'] =
                                                  value;
                                            });
                                          },
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
                                          onChanged: (value) {
                                            setState(() {
                                              requestFormData['username'] =
                                                  value;
                                            });
                                          },
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
                                  submitRequest(requestFormData)
                                      .whenComplete(() {
                                    setState(() {
                                      isSubmited = true;
                                      isNotValid = false;
                                    });
                                  });
                                }
                              },
                              height: 40,
                              minWidth: 40,
                              color: isNotValid
                                  ? Colors.red
                                  : isSubmited
                                      ? Colors.green
                                      : yellowFonts,
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
