import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Options.dart';
//صفحة اعلن لدينا
class AddUs extends StatefulWidget {
  bool isArabic;
  AddUs({this.isArabic});
  @override
  _AddUsState createState() => _AddUsState();
}

class _AddUsState extends State<AddUs> {
  String companyName,companyEmail,companyNumber,companyMessage;
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
    return Scaffold(
        appBar: AppBar(
          leading:Padding(
            padding:  EdgeInsets.all(5.0),
            child: Image.asset("assets/ads.png"),
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
          title:widget.isArabic? Text(
            'اعلن لدينا',
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 22,
              color: Colors.black,
              letterSpacing: 2,
            ),
          ): Text(
            'Annonsera med ossا',
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
        backgroundColor:darkMood?Colors.black:Colors.brown[50],
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height*.8,
              child: ListView(
                children: [
                   Column(
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
                                  child:widget.isArabic?Text(
                                    'للاستفسار يرجي مراسلتنا عبر النموزج التالي',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 15,
                                      color: darkMood?Colors.white:Colors.black,
                                      letterSpacing: 2,
                                    ),
                                  ):Text(
                                    'För frågor, kontakta oss via följande formulär',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 12,
                                      color: darkMood?Colors.white:Colors.black,
                                      letterSpacing: 2,
                                    ),textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment:widget.isArabic?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:widget.isArabic? Text('اسم الشركة',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "cairo",
                                            color: darkMood?Colors.white:Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.end):Text('Företagets namn',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "cairo",
                                            color: darkMood?Colors.white:Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.start),
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
                                    child: TextFormField(
                                      onChanged: (val){
                                        setState(() {
                                          companyName=val;
                                        });
                                      },
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                crossAxisAlignment:widget.isArabic?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:widget.isArabic? Text(
                                      'البريد الالكتروني',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "cairo",
                                          color: darkMood?Colors.white:Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ):Text(
                                      'E-post',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "cairo",
                                          color: darkMood?Colors.white:Colors.black,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
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
                                    child: TextFormField(
                                      onChanged: (val){
                                        setState(() {
                                          companyEmail=val;
                                        });
                                      },
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment:widget.isArabic?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:widget.isArabic?Text(
                                      'رقم الشركة',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkMood?Colors.white:Colors.black,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      'företagets telefonnummer',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "cairo",
                                          color: darkMood?Colors.white:Colors.black,
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
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (val){
                                        setState(() {
                                          companyNumber=val;
                                        });
                                      },
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment:widget.isArabic?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:widget.isArabic?Text(
                                      'رسالة',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkMood?Colors.white:Colors.black,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      'Meddelande',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkMood?Colors.white:Colors.black,
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
                                    child: TextFormField(
                                      maxLines: null,
                                      onChanged: (val){
                                        setState(() {
                                          companyMessage=val;
                                        });
                                      },
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: ()async{
                                  await FirebaseFirestore.instance.collection("CompanyAdvertisments").add({
                                    'companyName':companyName,
                                    'companyEmail':companyEmail,
                                    'companyNumber':companyNumber,
                                    'companyMessage':companyMessage
                                  }).then((value){print("^^^^^^^^^^^^^^^^^^^ company advertisment stored successfully");}).catchError((ex){
                                    print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^ failed to store company advertisment");
                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Options(isArabic: widget.isArabic,)));
                                },
                                child: Container(
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
                                    child:widget.isArabic?Text(
                                      'ارسال',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      'skicka',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ),
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
                ],
              ),
            ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: Container(
//                width: double.infinity,
//                height: MediaQuery.of(context).size.height*.06,
//                decoration: BoxDecoration(
//                  color: Colors.orange,
//                ),
//                child: Center(
//                  child: Text(
//                    'اعلان',
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: 'cairo',
//                        fontSize: 18,
//                        letterSpacing: 2,
//                        shadows: [
//                          Shadow(blurRadius: 3, color: Colors.black45)
//                        ]),
//                  ),
//                ),
//              ),
//            )
          ],
        ));
  }
}
