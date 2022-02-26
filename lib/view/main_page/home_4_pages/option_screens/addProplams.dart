import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//صفحة الابلاغ عن مشكلة
class Addproplams extends StatefulWidget {
  @override
  _AddproplamsState createState() => _AddproplamsState();
}

class _AddproplamsState extends State<Addproplams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            FontAwesomeIcons.user,
            color: Colors.transparent,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          centerTitle: true,
          title: Text(
            'الابلاغ عن مشكلة',
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 22,
              color: Colors.black,
              letterSpacing: 2,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.brown[50],
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 25, left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  child: Text(
                                    'الابلاغ عن مشكلة وستم التواصل معك مباشرة بعد حل عن المشكلة',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 15,
                                      color: Colors.black,
                                      letterSpacing: 2,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'البريد الالكتروني',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.white,
                                    ),
                                    width: double.infinity,
                                    height: 40,
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'رسالة',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.white,
                                    ),
                                    width: double.infinity,
                                    height: 150,
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.deepOrange[900],
                                ),
                                height: 35,
                                width: 80,
                                child: Center(
                                  child: Text(
                                    'ارسال',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: "cairo",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    'اعلان',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'cairo',
                        fontSize: 18,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(blurRadius: 3, color: Colors.black45)
                        ]),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
