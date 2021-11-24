import 'package:flutter/material.dart';
import 'package:saeud_alkhamis/views/widgets/const.dart';

class AddComment extends StatefulWidget {
  const AddComment({Key key}) : super(key: key);

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  bool isNotValid;
  @override
  void initState() {
    isNotValid = false;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
          child: Form(
            key: _formKey,
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
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
                      hintText: 'الاسم',
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    maxLines: 7,
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
                      hintText: 'التعليق ',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isNotValid ? 'حقول' : 'تعليق',
                      style: TextStyle(
                        fontSize: 12,
                        color: whiteFonts,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // Navigator.of(context).pop();
                          }
                        },
                        height: 40,
                        minWidth: 40,
                        color: isNotValid != true ? yellowFonts : Colors.red,
                        textColor: darkFonts,
                        padding: EdgeInsets.zero,
                        child: ImageIcon(
                          isNotValid != true
                              ? AssetImage('assets/images/icons/done.png')
                              : AssetImage('assets/images/icons/close.png'),
                          size: 16,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                    Text(
                      isNotValid ? 'مطلوبة' : 'إضافة',
                      style: TextStyle(
                        fontSize: 12,
                        color: whiteFonts,
                      ),
                      textDirection: TextDirection.rtl,
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
