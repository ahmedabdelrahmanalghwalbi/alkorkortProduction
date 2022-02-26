import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korkort/view/main_page/home_4_pages/Options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportOnProblem extends StatefulWidget {
  bool isArabic;
  ReportOnProblem({this.isArabic});
  @override
  _ReportOnProblemState createState() => _ReportOnProblemState();
}

class _ReportOnProblemState extends State<ReportOnProblem> {
  String problemEmail;
  String problemMessage;
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
            child: Image.asset("assets/danger.png"),
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
          title:widget.isArabic?Text(
            'الأبلاغ عن المشكلة',
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 22,
              color: Colors.black,
              letterSpacing: 2,
            ),
          ):Text(
            'Rapportera ett problem',
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
                                  'الأبلاغ عن المشكلة وسيتم التواصل معك مباشرة بعد حل هذة المشكلة',
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontSize: 15,
                                    color: darkMood?Colors.white:Colors.black,
                                    letterSpacing: 2,
                                  ),
                                  textAlign: TextAlign.center,
                                ):Text(
                                  'Rapportera problemet så kontaktar vi dig omedelbart efter att problemet har lösts',
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontSize: 15,
                                    color: darkMood?Colors.white:Colors.black,
                                    letterSpacing: 2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:widget.isArabic?Text('البريد الألكتروني',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkMood?Colors.white:Colors.black,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end):Text('E-post',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkMood?Colors.white:Colors.black,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end),
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
                                        problemEmail=val;
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:widget.isArabic?Text(
                                    'رسالة',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "cairo",
                                        color: darkMood?Colors.white:Colors.black,
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
                                        problemMessage=val;
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
                                await FirebaseFirestore.instance.collection("ReportOnProblem").add({
                                  'proplemEmail':problemEmail,
                                  'problemMessage':problemMessage
                                }).then((value){
                                  print("^^^^^^^^^^^^^^^^^^^ Report on problem added successfully stored successfully");
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Options(isArabic: widget.isArabic,)));
                                }).catchError((ex){
                                  print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^ failed to store Report on problem");
                                });
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
