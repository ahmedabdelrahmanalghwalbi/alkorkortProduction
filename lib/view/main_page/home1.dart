import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korkort/quiz/views/home.dart';
import 'package:korkort/view/home_screen/home_screen.dart';
import 'package:korkort/view/page_transitions/scale_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_4_pages/home7.dart';

class Home1 extends StatefulWidget {
//  bool isArabic;
//  Home1({this.isArabic});
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  bool isArabic=true;
  var numOfExams;
  var nuOfResults;
  getNumOfExam()async{
    var num=await FirebaseFirestore.instance.collection("Quiz").snapshots().length;
    setState(() {
      numOfExams=num;
    });
  }
  bool darkMood=false;
  getDarkMood()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      darkMood=pref.getBool("darkMood");
    });
  }
  getIsArabic()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      isArabic=pref.getBool("isArabic");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIsArabic();
    getNumOfExam();
    getDarkMood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:darkMood?Colors.black:Colors.brown[50],
      body: SingleChildScrollView(
        child: Container(
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 3,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.red,
                      ),
                      child: Center(
                        child:isArabic?Text(
                          'الامتحانات الحالية',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                              fontSize: 18,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(blurRadius: 3, color: Colors.black45)
                              ]),
                        ):Text(
                          'nuvarande tentor',
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3,
                              spreadRadius: 3,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment:isArabic?CrossAxisAlignment.start:CrossAxisAlignment.end,
                          children: [
                            isArabic?Text(
                              'امتحانات الاسئلة النظرية الفئة -B',
                              style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ):Text(
                              'Teori ifrågasätter tester för klass B',
                              style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    isArabic?Text(
                                      ' الاقسام التي تم انهائها ',
                                      style: TextStyle(
                                        fontFamily: 'cairo',
                                        fontSize: 14,
                                        letterSpacing: 2,
                                      ),
                                    ):Text(
                                      'Avsnitt slutförda',
                                      style: TextStyle(
                                        fontFamily: 'cairo',
                                        fontSize: 14,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70, left: 40),
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.3),
                                              blurRadius: 2,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight: Radius.circular(10.0)),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: MaterialButton(
                                            onPressed: () {
//                                              Navigator.push(
//                                                context,
//                                                MaterialPageRoute(
//                                                    builder: (context) => Home7()),
//                                              );
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                                            },
                                            child:isArabic? Text(
                                              'اكمال الدراسة',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'cairo',
                                                fontSize: 18,
                                                letterSpacing: 2,
                                                shadows: [
                                                  Shadow(
                                                      blurRadius: 3,
                                                      color: Colors.black45)
                                                ],
                                              ),
                                            ):Text(
                                              'slutföra studien',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'cairo',
                                                fontSize: 18,
                                                letterSpacing: 2,
                                                shadows: [
                                                  Shadow(
                                                      blurRadius: 3,
                                                      color: Colors.black45)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, right: 30),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 4,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '100%',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // width: 210,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: MaterialButton(
                            onPressed: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => Quiz()),
//                              );
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => Choose()),
//                              );
                              Navigator.of(context)
                                  .push(ScaleTransitionRoute(page:HomeScreen(isArabic: isArabic,)));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                isArabic? Text(
                                  'اضافة امتحان جديد',
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontSize: 18,
                                    letterSpacing: 2,
                                  ),
                                ): Text(
                                  'Lägg till en ny tentamen',
                                  style: TextStyle(
                                    fontFamily: 'cairo',
                                    fontSize: 18,
                                    letterSpacing: 2,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Image(
                                  width: 30,
                                  image: AssetImage('assets/completed-.png'),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
                      child:isArabic?Text(
                        'معلومات عامة',
                        style: TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 14,
                          letterSpacing: 2,
                          color: darkMood?Colors.white:Colors.black,
                        ),
                      ):Text(
                        'allmän information',
                        style: TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 14,
                          color: darkMood?Colors.white:Colors.black,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.6,
                      child: FutureBuilder(
                        future:FirebaseFirestore.instance.collection("PublicInformationB").get(),
                        builder: (context,snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }else if(snapshot.data.docs.length == 0){
                            return Center(
                              child: Text("No Available data",style: TextStyle(
                                color: Colors.white,
                              ),),
                            );
                          }else{
                            return ListView(
                                scrollDirection: Axis.vertical,
                                children:snapshot.data.docs.map<Widget>((document){
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 10,right: 8,left: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Image(
                                              image: NetworkImage(document['imageUrl']),
                                              height: MediaQuery.of(context).size.height*0.2,
                                              width: MediaQuery.of(context).size.width*0.7,
                                            ),
                                            Text(
                                              '${document['title']}',
                                              style: TextStyle(
                                                fontFamily: 'cairo',
                                                fontSize: 14,
                                                letterSpacing: 2,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${document["description"]}',
                                              style: TextStyle(
                                                fontFamily: 'cairo',
                                                fontSize: 12,
                                                letterSpacing: 2,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList()
                            );
                          }
                        },
                      ),
                    ),
                    //this is the public information

//                    Align(
//                      alignment: Alignment.bottomCenter,
//                      child: Container(
//                        width: double.infinity,
//                        height: 50,
//                        decoration: BoxDecoration(
//                          color: Colors.orange,
//                        ),
//                        child: Center(
//                          child: Text(
//                            'اعلان',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontFamily: 'cairo',
//                                fontSize: 18,
//                                letterSpacing: 2,
//                                shadows: [
//                                  Shadow(blurRadius: 3, color: Colors.black45)
//                                ]),
//                          ),
//                        ),
//                      ),
//                    )
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
