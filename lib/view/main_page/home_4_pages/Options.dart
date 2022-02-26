import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:korkort/view/auth_screens/login.dart';
import 'package:korkort/view/main_page/home_4_pages/report_problem.dart';
import 'package:korkort/view/main_page/home_4_pages/userSettings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'option_screens/addProplams.dart';
import 'option_screens/language.dart';
import 'option_screens/mood.dart';
import 'option_screens/rools.dart';

class Options extends StatefulWidget {
  bool isArabic;
  Options({this.isArabic});

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool darkMood=false;
  getDarkMood()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      darkMood=pref.getBool("darkMood");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDarkMood();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color:darkMood?Colors.white:Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title:widget.isArabic?Text(
              'الاعدادات',
              style: TextStyle(
                fontFamily: 'cairo',
                fontSize: 22,
                color:darkMood?Colors.white:Colors.black,
                letterSpacing: 2,
              ),
            ):Text(
              'inställningar',
              style: TextStyle(
                fontFamily: 'cairo',
                fontSize: 22,
                color:darkMood?Colors.white:Colors.black,
                letterSpacing: 2,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: darkMood?Colors.black:Colors.brown[50],
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserStetteings(isArabic:widget.isArabic)),
                            );
                          },
                          child: Row(
                            children: [
                              Image(
                                width: 30,
                                height: 30,
                                image: AssetImage(
                                    'assets/computer-icons-google-account-icon-design-login-png-favpng-jFjxPac6saRuDE3LiyqsYTEZM.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              widget.isArabic?Text(
                                'ادارة الحساب',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ):Text(
                                'Kontohantering',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Languge(isArabic:widget.isArabic)),
                            );
                          },
                          child: Row(
                            children: [
                              Image(
                                width: 30,
                                height: 30,
                                image: AssetImage('assets/language.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              widget.isArabic? Text(
                                'لغة التطبيق',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ):Text(
                                'Applikationsspråk',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Mood(isArabic: widget.isArabic,)),
                            );
                          },
                          child: Row(
                            children: [
                              Image(
                                width: 30,
                                height: 30,
                                image: AssetImage('assets/night-mode.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              widget.isArabic?Text(
                                'الوضع الليلي',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ):Text(
                                'nattläge',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image(
                              width: 30,
                              height: 30,
                              image: AssetImage('assets/help.png')),
                          SizedBox(
                            width: 20,
                          ),
                          widget.isArabic?Text(
                            'الدعم',
                            style: TextStyle(
                              color:darkMood?Colors.white:Colors.black,
                              fontFamily: 'cairo',
                              fontSize: 18,
                              letterSpacing: 2,
                            ),
                          ):Text(
                            'stödet',
                            style: TextStyle(
                              color:darkMood?Colors.white:Colors.black,
                              fontFamily: 'cairo',
                              fontSize: 18,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReportOnProblem(isArabic:widget.isArabic)),
                            );
                          },
                          child: Row(
                            children: [
                              Image(
                                width: 30,
                                height: 30,
                                image: AssetImage('assets/danger.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              widget.isArabic?Text(
                                'الابلاغ عن مشكلة',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ):Text(
                                'Rapportera ett problem',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Rools(isArabic:widget.isArabic)),
                            );
                          },
                          child: Row(
                            children: [
                              Image(
                                width: 30,
                                height: 30,
                                image: AssetImage('assets/policy.png'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              widget.isArabic?Text(
                                'الشروط والسياسات',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ):Text(
                                'Villkor och policyer',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'cairo',
                                  fontSize: 18,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login(isArabic: widget.isArabic,)),
                          );
                        },
                        child: Row(
                          children: [
                            Image(
                                width: 30,
                                color: darkMood?Colors.blueGrey[200]:null,
                                height: 30,
                                image: AssetImage('assets/log-out.png')),
                            SizedBox(
                              width: 20,
                            ),
                            widget.isArabic?Text(
                              'تسجيل الخروج',
                              style: TextStyle(
                                color:darkMood?Colors.white:Colors.black,
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ):Text(
                              'logga ut',
                              style: TextStyle(
                                color:darkMood?Colors.white:Colors.black,
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
