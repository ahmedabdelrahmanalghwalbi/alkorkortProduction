import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:korkort/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../welcome_screen.dart';

class Languge extends StatefulWidget {
  bool isArabic;
  Languge({this.isArabic});

  @override
  _LangugeState createState() => _LangugeState();
}

class _LangugeState extends State<Languge> {
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
        title:widget.isArabic?Text(
          'لغة التطبيق',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ):Text(
          'Applikationsspråk',
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
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>MyApp()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          spreadRadius: 3,
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'العربي',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>MyApp()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          spreadRadius: 3,
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'svenska',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
//          Align(
//            alignment: Alignment.bottomCenter,
//            child: Container(
//              width: double.infinity,
//              height: 50,
//              decoration: BoxDecoration(
//                color: Colors.orange,
//              ),
//              child: Center(
//                child: Text(
//                  'اعلان',
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontFamily: 'cairo',
//                      fontSize: 18,
//                      letterSpacing: 2,
//                      shadows: [Shadow(blurRadius: 3, color: Colors.black45)]),
//                ),
//              ),
//            ),
//          )
        ],
      ),
    );
  }
}
