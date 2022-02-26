import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korkort/admin_panel/responsive.dart';

class UserResults extends StatefulWidget {
  String uid;
  String userName;
  UserResults({this.uid,this.userName});
  @override
  _UserResultsState createState() => _UserResultsState();
}

class _UserResultsState extends State<UserResults> {
  String quizTitle;
  String quizDesc;

  getQuizData(String quizId)async{
    await FirebaseFirestore.instance.collection("Quiz").doc(quizId).get().then((doc) {
      setState(() {
        quizTitle = doc.get("quizTitle");
        quizDesc = doc.get('quizDesc');
      });
    });
  }
  showAlertDialogPassed(BuildContext context,String quizId )async{
    await FirebaseFirestore.instance.collection("Quiz").doc(quizId).get().then((doc) {
      setState(() {
        quizTitle = doc.get("quizTitle");
        quizDesc = doc.get('quizDesc');
      });
    });
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("quiz title :${quizTitle}",style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,),
      content: Container(
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.height/4,
        child: Center(
          child: Text("${quizDesc}",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo"
          ),textAlign: TextAlign.center,),
        ),
      ),
//      actions: [
//        Center(
//          child: GestureDetector(
//            onTap: (){
//              Navigator.push(context,MaterialPageRoute(builder: (context)=>UserResults()));
//            },
//            child: Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10),
//                color: Colors.blueAccent,
//              ),
//              child: Text("OK",style: TextStyle(
//                color: Colors.white,
//                fontFamily: "cairo",
//                fontWeight: FontWeight.bold
//              ),),
//              alignment: Alignment.center,
//              margin: EdgeInsets.all(30),
//              height: MediaQuery.of(context).size.height*0.06,
//              width: MediaQuery.of(context).size.width/8,
//            ),
//          ),
//        )
//      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialogPassedC(BuildContext context,String quizId )async{
    await FirebaseFirestore.instance.collection("Quiz2").doc(quizId).get().then((doc) {
      setState(() {
        quizTitle = doc.get("quizTitle");
        quizDesc = doc.get('quizDesc');
      });
    });
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("quiz title :${quizTitle}",style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,),
      content: Container(
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.height/4,
        child: Center(
          child: Text("${quizDesc}",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo"
          ),textAlign: TextAlign.center,),
        ),
      ),
//      actions: [
//        Center(
//          child: GestureDetector(
//            onTap: (){
//              Navigator.push(context,MaterialPageRoute(builder: (context)=>UserResults()));
//            },
//            child: Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10),
//                color: Colors.blueAccent,
//              ),
//              child: Text("OK",style: TextStyle(
//                color: Colors.white,
//                fontFamily: "cairo",
//                fontWeight: FontWeight.bold
//              ),),
//              alignment: Alignment.center,
//              margin: EdgeInsets.all(30),
//              height: MediaQuery.of(context).size.height*0.06,
//              width: MediaQuery.of(context).size.width/8,
//            ),
//          ),
//        )
//      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" نتائج المستخدم (Användarresultat) ${widget.userName}"),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Responsive.isDesktop(context)?Row(
            children: [
              // results of B quiz
              Expanded(child:Container(
                padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("نتائج أختبارات الفئة B",style: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: "cairo",
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("Testresultat (B)",style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "cairo",
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future:FirebaseFirestore.instance.collection("Results").get(),
                          builder: (context,snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }else if(snapshot.data.docs.length == 0){
                              return Center(
                                child: Column(
                                  children: [
                                    Text("لا يوجد بيانات",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                    Text("Det finns inga data",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                  ],
                                ),
                              );
                            }else{
                              return ListView(
                                  scrollDirection: Axis.vertical,
                                  children:snapshot.data.docs.map<Widget>((document){
                                    if(document['userId']==widget.uid){
//                                getQuizData(document["quizId"]);
                                      return Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              child: Card(
                                                child: ListTile(
                                                  trailing: Text("${document['status']}",style: TextStyle(
                                                    color: document['status']=="passed"?Colors.green:document['status']=="failed"?Colors.red:Colors.blueAccent,
                                                  ),),
                                                  title: Text("quiz id :- ${document["quizId"]}",textAlign: TextAlign.start,),
                                                  subtitle: Text("click to see quiz information",textAlign: TextAlign.start,style: TextStyle(
                                                      color: Colors.blueAccent
                                                  ),),
                                                  leading: GestureDetector(
                                                    child: Icon(Icons.delete),
                                                    onTap: ()async{
                                                      await FirebaseFirestore.instance.collection("Results").doc(document.id).delete().then((value){
                                                        print("xxxxxxxxxxxxxxxxxx Result deleted successfullt");
                                                      });
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                              onTap: (){
                                                showAlertDialogPassed(context, document["quizId"]);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }else{
                                      return Container();
                                    }
                                  }).toList()
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )),),
              //result of C quiz
              Expanded(child:Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("نتائج أختبارات الفئة C",style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "cairo",
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("Testresultat (C)",style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "cairo",
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future:FirebaseFirestore.instance.collection("Results2").get(),
                          builder: (context,snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }else if(snapshot.data.docs.length == 0){
                              return Center(
                                child: Column(
                                  children: [
                                    Text("لا يوجد بيانات",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                    Text("Det finns inga data",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                  ],
                                ),
                              );
                            }else{
                              return ListView(
                                  scrollDirection: Axis.vertical,
                                  children:snapshot.data.docs.map<Widget>((document){
                                    if(document['userId']==widget.uid){
//                                getQuizData(document["quizId"]);
                                      return Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              child: Card(
                                                child: ListTile(
                                                  trailing: Text("${document['status']}",style: TextStyle(
                                                      color: document['status']=="passed"?Colors.green:document['status']=="failed"?Colors.red:Colors.blueAccent,
                                                  ),),
                                                  title: Text("quiz id :- ${document["quizId"]}",textAlign: TextAlign.start,),
                                                  subtitle: Text("click to see quiz information",textAlign: TextAlign.start,style: TextStyle(
                                                      color: Colors.blueAccent
                                                  ),),
                                                  leading: GestureDetector(
                                                    child: Icon(Icons.delete),
                                                    onTap: ()async{
                                                      await FirebaseFirestore.instance.collection("Results2").doc(document.id).delete().then((value){
                                                        print("xxxxxxxxxxxxxxxxxx Result deleted successfullt");
                                                      });
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                              onTap: (){
                                                showAlertDialogPassedC(context, document["quizId"]);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }else{
                                      return Container();
                                    }
                                  }).toList()
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )),),
            ],
          ):Column(
            children: [
              // results of B quiz
              Expanded(child:Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("نتائج أختبارات الفئة B",style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "cairo",
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("Testresultat (B)",style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "cairo",
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future:FirebaseFirestore.instance.collection("Results").get(),
                          builder: (context,snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }else if(snapshot.data.docs.length == 0){
                              return Center(
                                child:  Column(
                                  children: [
                                    Text("لا يوجد بيانات",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                    Text("Det finns inga data",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                  ],
                                ),
                              );
                            }else{
                              return ListView(
                                  scrollDirection: Axis.vertical,
                                  children:snapshot.data.docs.map<Widget>((document){
                                    if(document['userId']==widget.uid){
//                                getQuizData(document["quizId"]);
                                      return Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              child: Card(
                                                child: ListTile(
                                                  trailing: Text("${document['status']}",style: TextStyle(
                                                    color: document['status']=="passed"?Colors.green:document['status']=="failed"?Colors.red:Colors.blueAccent,
                                                  ),),
                                                  title: Text("quiz id :- ${document["quizId"]}",textAlign: TextAlign.start,),
                                                  subtitle: Text("click to see quiz information",textAlign: TextAlign.start,style: TextStyle(
                                                      color: Colors.blueAccent
                                                  ),),
                                                  leading: GestureDetector(
                                                    child: Icon(Icons.delete),
                                                    onTap: ()async{
                                                      await FirebaseFirestore.instance.collection("Results").doc(document.id).delete().then((value){
                                                        print("xxxxxxxxxxxxxxxxxx Result deleted successfullt");
                                                      });
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                              onTap: (){
                                                showAlertDialogPassed(context, document["quizId"]);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }else{
                                      return Container();
                                    }
                                  }).toList()
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )),),
              //result of C quiz
              Expanded(child:Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("نتائج أختبارات الفئة C",style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "cairo",
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top:10.0,bottom: 10),
                        child: Text("Testresultat (C)",style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "cairo",
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future:FirebaseFirestore.instance.collection("Results2").get(),
                          builder: (context,snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }else if(snapshot.data.docs.length == 0){
                              return Center(
                                child:  Column(
                                  children: [
                                    Text("لا يوجد بيانات",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                    Text("Det finns inga data",style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                  ],
                                ),
                              );
                            }else{
                              return ListView(
                                  scrollDirection: Axis.vertical,
                                  children:snapshot.data.docs.map<Widget>((document){
                                    if(document['userId']==widget.uid){
//                                getQuizData(document["quizId"]);
                                      return Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              child: Card(
                                                child: ListTile(
                                                  trailing: Text("${document['status']}",style: TextStyle(
                                                    color: document['status']=="passed"?Colors.green:document['status']=="failed"?Colors.red:Colors.blueAccent,
                                                  ),),
                                                  title: Text("quiz id :- ${document["quizId"]}",textAlign: TextAlign.start,),
                                                  subtitle: Text("click to see quiz information",textAlign: TextAlign.start,style: TextStyle(
                                                      color: Colors.blueAccent
                                                  ),),
                                                  leading: GestureDetector(
                                                    child: Icon(Icons.delete),
                                                    onTap: ()async{
                                                      await FirebaseFirestore.instance.collection("Results2").doc(document.id).delete().then((value){
                                                        print("xxxxxxxxxxxxxxxxxx Result deleted successfullt");
                                                      });
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                              onTap: (){
                                                showAlertDialogPassedC(context, document["quizId"]);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }else{
                                      return Container();
                                    }
                                  }).toList()
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  )),),
            ],
          )
        ),
      )
    );
  }
}
