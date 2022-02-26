import 'package:flutter/material.dart';
import 'package:korkort/view/information/informationB.dart';
import 'package:korkort/view/information/informationC.dart';
import 'package:korkort/view/page_transitions/scale_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home3 extends StatefulWidget {
//  bool isArabic;
//  Home3({this.isArabic});

  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  bool isArabic=true;
  getIsArabic()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      isArabic=pref.getBool("isArabic");
    });
  }
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
    getIsArabic();
    getDarkMood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:darkMood?Colors.black:Colors.brown[50],
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.84,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.4,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Image(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.21,
                                image: AssetImage('assets/car (1).png'),
                              ),
                            ),
                            isArabic?Text(
                              'خطوات التقديم للفئة -B',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ):Text(
                              'Steg för att ansöka om klass B',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              'B-Korkort',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                width: 150,
                                child: MaterialButton(
                                  onPressed: () {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) => InformationB()),
//                                    );
                                    Navigator.of(context)
                                        .push(ScaleTransitionRoute(page:InformationB()));
                                  },
                                  child:isArabic? Text(
                                    'عرض المعلومات',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: "cairo",
                                        fontWeight: FontWeight.bold),
                                  ):Text(
                                    'Informationsdisplay',
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
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.4,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Image(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height*0.21,
                                image: AssetImage('assets/truck.png'),
                              ),
                            ),
                            isArabic? Text(
                              'خطوات التقديم للفئة -C',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ):Text(
                              'Steg för att ansöka om klass C',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              'C-Korkort',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                width: 150,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(ScaleTransitionRoute(page:InformationC()));
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) => InformationC()),
//                                    );
                                  },
                                  child:isArabic?Text(
                                    'عرض المعلومات',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: "cairo",
                                        fontWeight: FontWeight.bold),
                                  ):Text(
                                  'Informationsdisplay',
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
                      )
                    ],
                  ),
                ),
              ),
            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Align(
//                alignment: Alignment.bottomCenter,
//                child: Container(
//                  width: double.infinity,
//                  height: MediaQuery.of(context).size.height*.064,
//                  decoration: BoxDecoration(
//                    color: Colors.orange,
//                  ),
//                  child: Center(
//                    child: Text(
//                      'اعلان',
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontFamily: 'cairo',
//                          fontSize: 18,
//                          letterSpacing: 2,
//                          shadows: [
//                            Shadow(blurRadius: 3, color: Colors.black45)
//                          ]),
//                    ),
//                  ),
//                ),
//              ),
//            )
          ],
        ));
  }
}
