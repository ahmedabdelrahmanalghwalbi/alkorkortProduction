import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:korkort/view/main_page/home_4_pages/Options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mood extends StatefulWidget {
  bool isArabic;
  Mood({this.isArabic});

  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
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
          'الوضع الليلي',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ):Text(
          'nattläge',
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
                    onTap: ()async{
                      SharedPreferences pref=await SharedPreferences.getInstance();
                      setState(() {
                        pref.setBool("darkMood", false);
                      });
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Options(isArabic: widget.isArabic,)));
                      setState(() {});
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
                        child:widget.isArabic?Text(
                          'ايقاف',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ):Text(
                          'stänga av',
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
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ]),
                    child: GestureDetector(
                      onTap: ()async{
                        SharedPreferences pref=await SharedPreferences.getInstance();
                       setState(() {
                         pref.setBool("darkMood", true);
                       });
                       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Options(isArabic: widget.isArabic,)));
                       setState(() {});
                       },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:widget.isArabic?Text(
                          'تفغيل',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ):Text(
                          'aktivering',
                          style: TextStyle(
                              fontSize: 15,
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
