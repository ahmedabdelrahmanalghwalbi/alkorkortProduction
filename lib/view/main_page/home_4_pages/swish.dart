import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Swish extends StatefulWidget {
  bool isArabic;
  Swish({this.isArabic});

  @override
  _SwishState createState() => _SwishState();
}

class _SwishState extends State<Swish> {
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
        title:widget.isArabic? Text(
          'التبرع لنا',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ):Text(
          'Donera till oss',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:widget.isArabic?Text(
                      'بدعمكم نستمر',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "cairo",
                          color: darkMood?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ):Text(
                      'Med ditt stöd fortsätter vi',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "cairo",
                          color: darkMood?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/swish.png'),
                        fit: BoxFit.cover,
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
