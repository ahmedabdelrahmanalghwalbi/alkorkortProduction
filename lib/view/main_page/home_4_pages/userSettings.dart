import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStetteings extends StatefulWidget {
  bool isArabic;
  UserStetteings({this.isArabic});
  @override
  _UserStetteingsState createState() => _UserStetteingsState();
}

class _UserStetteingsState extends State<UserStetteings> {
  String newEmail,newFirstName,newLastName;
  String oldPassword,newPassword;
  var auth = FirebaseAuth.instance;
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
          leading: Icon(
            FontAwesomeIcons.user,
            color:darkMood?Colors.white:Colors.black,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color:darkMood?Colors.white:Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          centerTitle: true,
          title:widget.isArabic?Text(
            'ادارة الحساب',
            style: TextStyle(
              fontFamily: 'cairo',
              fontSize: 22,
              color:darkMood?Colors.white:Colors.black,
              letterSpacing: 2,
            ),
          ):Text(
            'Kontohantering',
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
        backgroundColor:darkMood?Colors.black:Colors.brown[50],
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.8,
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
                                    'معلومات الحساب',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      color: darkMood?Colors.white:Colors.black,
                                      letterSpacing: 2,
                                    ),
                                  ):Text(
                                    'Kontoinformation',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      color: darkMood?Colors.white:Colors.black,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //last name
                                  Column(
                                    crossAxisAlignment:widget.isArabic?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:widget.isArabic?Text(
                                          'اسم العائلة',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "cairo",
                                              color: darkMood?Colors.white:Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ):Text(
                                          'efternamn',
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
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        width: 140,
                                        height: 40,
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          onChanged: (val){
                                            setState(() {
                                              newLastName = val;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  //first name
                                  Column(
                                    crossAxisAlignment:widget.isArabic?CrossAxisAlignment.end:CrossAxisAlignment.start, children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:widget.isArabic?Text(
                                          'الاسم الاول',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: darkMood?Colors.white:Colors.black,
                                              fontFamily: "cairo",
                                              fontWeight: FontWeight.bold),
                                        ):Text(
                                          'Förnamn',
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
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                        ),
                                        width: 140,
                                        height: 40,
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          onChanged: (val){
                                            setState(() {
                                              newFirstName=val;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  )
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
                                    child:widget.isArabic?Text('البريد الالكتروني',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "cairo",
                                            color: darkMood?Colors.white:Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.end):Text('E-post',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: darkMood?Colors.white:Colors.black,
                                            fontFamily: "cairo",
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
                                          newEmail=val;
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
                                onTap: ()async {
                                 if(newEmail!=null && newFirstName !=null && newLastName !=null){
                                   var userId = await auth.currentUser.uid;
//                                   await FirebaseFirestore.instance.collection("users").doc("${userId}").update({
////                                     "email": newEmail,
//                                     "firstName": newFirstName,
//                                     "lastName":newLastName,
//                                   }).then((value){
//                                     Navigator.pop(context);
//                                   }).catchError((ex){
//                                     print("xxxxxxxxxxxxxxxxxxxxxxxx failed with update the data of the current user");
//                                   });
                                 await FirebaseFirestore.instance.collection("users").get().then((querySnapShot){
                                   querySnapShot.docs.forEach((element)async {
                                     if(element.get("userId")==userId){
                                       await FirebaseFirestore.instance.collection("users").doc("${element.id}").update({
                                     "firstName": newFirstName,
                                     "lastName":newLastName,
                                   });
                                     }
                                   });
                                 }).catchError((ex){{
                                   print("${ex}");
                                 }});
                                 }else{
                                   Fluttertoast.showToast(
                                       msg: "Please Provide all updated Data",
                                       toastLength: Toast.LENGTH_SHORT,
                                       gravity: ToastGravity.TOP,
                                       timeInSecForIosWeb: 1,
                                       backgroundColor: Colors.red,
                                       textColor: Colors.white,
                                       fontSize: 16.0
                                   );
                                 }
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
                                      'حفظ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      'spara',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.grey),
                              SizedBox(
                                height: 10,
                              ),
                              widget.isArabic?Text(
                                'كلمة المرور ',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: darkMood?Colors.white:Colors.black,
                                    fontFamily: "cairo",
                                    fontWeight: FontWeight.bold),
                              ):Text(
                                'Lösenord',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: darkMood?Colors.white:Colors.black,
                                    fontFamily: "cairo",
                                    fontWeight: FontWeight.bold),
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
                                      'كلمة المرور الجديدة',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkMood?Colors.white:Colors.black,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      'nytt lösenord',
                                      style: TextStyle(
                                          color: darkMood?Colors.white:Colors.black,
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
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (val){
                                        setState(() {
                                          oldPassword=val;
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
                                      ' اعادة كلمة المرور الجديدة',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: darkMood?Colors.white:Colors.black,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      'Återställ nytt lösenord',
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
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (val){
                                        setState(() {
                                          newPassword=val;
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
                                onTap: ()async {
                                 if(oldPassword == newPassword){
                                   var userId = auth.currentUser.uid;
//                                   await FirebaseFirestore.instance.collection(
//                                       "users").doc(userId).update({
//                                     "password": newPassword,
//                                   }).then((value){
//                                     Navigator.pop(context);
//                                   }).catchError((ex){
//                                     print("xxxxxxxxxxxxxxxxxxxxxxxx failed with update the password of the current user");
//                                   });
                                   await FirebaseFirestore.instance.collection("users").get().then((querySnapShot){
                                     querySnapShot.docs.forEach((element)async {
                                       if(element.get("userId")==userId){
                                         await FirebaseFirestore.instance.collection("users").doc("${element.id}").update({
                                           "password": newPassword,
                                         });
                                       }
                                     });
                                   }).catchError((ex){{
                                     print("${ex}");
                                   }});
                                 await auth.currentUser.updatePassword(newPassword);
                                 }else{
                                   Fluttertoast.showToast(
                                       msg: "the two passwords dos'nt match",
                                       toastLength: Toast.LENGTH_SHORT,
                                       gravity: ToastGravity.TOP,
                                       timeInSecForIosWeb: 1,
                                       backgroundColor: Colors.red,
                                       textColor: Colors.white,
                                       fontSize: 16.0
                                   );
                                 }
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
                                      'حفظ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      'spara',
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
