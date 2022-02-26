import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home2 extends StatefulWidget {
//  bool isArabic=true;
//  Home2({this.isArabic});
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
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
    super.initState();
    getIsArabic();
    getDarkMood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:darkMood?Colors.black:Colors.brown[50],
      body: Padding(
        padding:EdgeInsets.only(top:10,left: 10,right: 10,bottom: 20),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.9,
              child: SingleChildScrollView(
                child: Column(
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
                        child:isArabic? Text(
                          'شواخص المرور',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'cairo',
                              fontSize: 18,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(blurRadius: 3, color: Colors.black45)
                              ]),
                        ):Text(
                          'Vägskyltar',
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
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
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
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isArabic? Text(
                              'شواخص المرور الضوئية',
                              style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ):Text(
                              'Trafikljus',
                              style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.4,
                              width: MediaQuery.of(context).size.width,
                               child:FutureBuilder(
                                  future:FirebaseFirestore.instance.collection("TrafficSigns").get(),
                                  builder: (context,snapshot){
                                    if (snapshot.connectionState == ConnectionState.waiting){
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }else if(snapshot.data.docs.length == 0){
                                      return Center(
                                        child:isArabic?Text("لا يوجد شواخص",style: TextStyle(
                                          color: Colors.black,
                                        ),):Text("Det finns inga tecken",style: TextStyle(
                                          color: Colors.black,
                                        ),),
                                      );
                                    }else{
                                      return ListView(
                                          scrollDirection: Axis.vertical,
                                          children:snapshot.data.docs.map<Widget>((document){
                                            if(document["signType"]=="Traffic light"){
                                              return Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(5),
                                                        width: MediaQuery.of(context).size.width*0.7,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              '${document["title"]}',
                                                              style: TextStyle(
                                                                fontFamily: 'cairo',
                                                                fontSize: 12,
                                                                letterSpacing: 2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(top:1),
                                                              child: Text(
                                                                '${document["description"]}',
                                                                style: TextStyle(
                                                                  fontFamily: 'cairo',
                                                                  fontSize: 10,
                                                                  letterSpacing: 2,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Image(
                                                        width: 70,
                                                        height: 70,
                                                        image: NetworkImage(document['imageUrl']),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: double.infinity,
                                                    color: Colors.grey.withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              );
                                            }else{
                                              return Container();
                                            }
                                          }).toList()
                                      );
                                    }
                                  },
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    /////////////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////////////////////////
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
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
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isArabic? Text(
                              'شواخص اعطاء افضلية المرور',
                              style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ):Text(
                              'Tecken som viker',
                              style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height*0.4,
                                width: MediaQuery.of(context).size.width,
                                child:FutureBuilder(
                                  future:FirebaseFirestore.instance.collection("TrafficSigns").get(),
                                  builder: (context,snapshot){
                                    if (snapshot.connectionState == ConnectionState.waiting){
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }else if(snapshot.data.docs.length == 0){
                                      return Center(
                                        child:isArabic? Text("لا يوجد شواخص",style: TextStyle(
                                          color: Colors.black,
                                        ),): Text("Det finns inga tecken",style: TextStyle(
                                          color: Colors.black,
                                        ),),
                                      );
                                    }else{
                                      return ListView(
                                          scrollDirection: Axis.vertical,
                                          children:snapshot.data.docs.map<Widget>((document){
                                            if(document["signType"]=="Signs to give priority to traffic"){
                                              return Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(5),
                                                        width: MediaQuery.of(context).size.width*0.7,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              '${document["title"]}',
                                                              style: TextStyle(
                                                                fontFamily: 'cairo',
                                                                fontSize: 12,
                                                                letterSpacing: 2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(top:1),
                                                              child: Text(
                                                                '${document["description"]}',
                                                                style: TextStyle(
                                                                  fontFamily: 'cairo',
                                                                  fontSize: 10,
                                                                  letterSpacing: 2,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Image(
                                                        width: 70,
                                                        height: 70,
                                                        image: NetworkImage(document['imageUrl']),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 1,
                                                    width: double.infinity,
                                                    color: Colors.grey.withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              );
                                            }else{
                                              return Container();
                                            }
                                          }).toList()
                                      );
                                    }
                                  },
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: Container(
//                width: double.infinity,
//                height: MediaQuery.of(context).size.height*.064,
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
        ),
      ),
    );
  }
}
