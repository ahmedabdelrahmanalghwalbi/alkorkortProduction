import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:korkort/quiz2/services/database.dart';
import 'package:korkort/quiz2/views/create_quiz.dart';
import 'package:korkort/quiz2/views/quiz_hint_2.dart';
import 'package:korkort/quiz2/views/quiz_play.dart';
import 'package:korkort/quiz2/widget/widget.dart';
import 'package:korkort/view/main_page/home1c.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();
  Widget quizList() {
    return Container(
      child: StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container() :ListView(
                children: snapshot.data.docs.map<Widget>((DocumentSnapshot document) {
                  return Padding(
                    padding: EdgeInsets.only(bottom:10),
                    child: QuizTile(
                      noOfQuestions: snapshot.data.docs.length,
                      imageUrl: document['quizImgUrl'],
                      title:document['quizTitle'],
                      description:document['quizDesc'],
                      id:document.id,
                      status: document['status'],
                    ),
                  );
                }).toList(),
              );
            },
          ),
    );
  }
  bool isArabic=true;
  getIsArabic()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      isArabic=pref.getBool("isArabic");
    });
  }
  @override
  void initState() {
    databaseService.getQuizData().then((value) {
      quizStream = value;
      setState(() {});
    });
    super.initState();
    getIsArabic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:isArabic?Text("أمتحانات الأسئلة النظرية للفئة C",style: TextStyle(
            fontFamily: "cairo",
            color: Colors.black
        ),):Text("Teori ifrågasätter tentor för klass C",style: TextStyle(
            fontFamily: "cairo",
            color: Colors.black
        ),),
        actions: [
          GestureDetector(child: Icon(Icons.arrow_forward_ios,color: Colors.grey,),onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home1c()));
          },),
        ],
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        //brightness: Brightness.li,
      ),
      body: quizList(),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add,color: Colors.white,),
//        backgroundColor: Colors.deepOrange,
//        onPressed: () {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
//        },
//      ),
    );
  }
}

class QuizTile extends StatefulWidget {
  final String imageUrl, title, id, description,status;
  final int noOfQuestions;

  QuizTile(
      {@required this.title,
      @required this.imageUrl,
      @required this.description,
      @required this.id,
      @required this.noOfQuestions,@required this.status});

  @override
  _QuizTileState createState() => _QuizTileState();
}

class _QuizTileState extends State<QuizTile> {
  DatabaseService databaseService = DatabaseService();
  String uid ;
  String status ='';
  bool isArabic=true;
  getIsArabic()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      isArabic=pref.getBool("isArabic");
    });
  }

//  dynamic data;
//
//  Future<dynamic> getData() async {
//
//    final DocumentReference document = FirebaseFirestore.instance.collection("listofprods").document('ac1');
//
//    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
//      setState(() {
//        data =snapshot.data;
//      });
//    });
//  }

  Future<dynamic> getData()async{
    var snapshots = FirebaseFirestore.instance.collection("Results2").snapshots();
    snapshots.map((snapshot){
      snapshot.docs.map((document) {
        if(document.data()["userId"] == uid && document.data()["quizId"] == widget.id){
          print("****************************** ${document.get("status")}");
          setState(() {
            status = document.get("status");
          });
        }
      }).toList();
    }).toList();
  }
  //alert dialog of passed exams
  showAlertDialogPassed(BuildContext context ) {
    // set up the button
    Widget okButton(var color ,var label){
      return ElevatedButton(
        onPressed: (){
          Navigator.pop(context);
        }, child: Center(
        child: Text(label,style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "cairo"
        ),textAlign: TextAlign.center,),
      ), style: ElevatedButton.styleFrom(
        primary: color,
      ),
      );}

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: isArabic?Text("تم أجتياز الأختبار بنجاح",style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,):Text("Testet klarades framgångsrikt",style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,),
      actions: [
        Padding(
          padding: EdgeInsets.only(top:10,bottom: 10,left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isArabic?okButton(Colors.green,"حسنا"):okButton(Colors.green,"Okej"),
            ],
          ),
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  //alert dialog of failed exams
  showAlertDialogFailed(BuildContext context ) {
    // set up the button
    Widget okButton(var color ,var label,Function onPressed){
      return ElevatedButton(
        onPressed:onPressed,
        child: Center(
        child: Text(label,style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "cairo"
        ),textAlign: TextAlign.center,),
      ), style: ElevatedButton.styleFrom(
        primary: color,
      ),
      );}

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: isArabic? Text("هل تريد أعادة الأمتحان ؟",style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,):Text("Vill du testa igen?",style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,),
      actions: [
        Padding(
          padding: EdgeInsets.only(top:10,bottom: 10,left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isArabic?okButton(Colors.green,"الرجوع",(){Navigator.pop(context);}):okButton(Colors.green,"Annullering",(){Navigator.pop(context);}),
              isArabic?okButton(Colors.red,"اعادة الأمتحان",(){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => QuizPlay(widget.id)
                ));
              } ):okButton(Colors.red,"Omprövning",(){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => QuizPlay(widget.id)
                ));
              } ),
            ],
          ),
        ),
      ],
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
  void initState() {
    super.initState();
    uid=FirebaseAuth.instance.currentUser.uid;
    getData();
    print("A77777777777777777777777777777a");
    print("ttttttttttttttttthis is uuid ${uid}");
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
//        if(widget.status=="passed"){
//          showAlertDialogPassed(context);
//        }else if(widget.status=="failed"){
//          showAlertDialogFailed(context);
//        }else{
//          Navigator.push(context, MaterialPageRoute(
//              builder: (context) => QuizPlay(widget.id)
//          ));
//        }
        if(status=="passed"){
          showAlertDialogPassed(context);
        }else if(status=="failed"){
          showAlertDialogFailed(context);
        }else{
          Navigator.push(context, MaterialPageRoute(
              //builder: (context) => QuizPlay(widget.id)
            builder: (context)=>QuizHint2(description: widget.description,title: widget.title,id: widget.id,)
          ));
        }
      },
      child: Card(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color:status=="passed"?Colors.green:status=="failed"?Colors.red:Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color:status=="passed"?Colors.white:status=="failed"?Colors.white:Colors.black,
                    fontFamily: 'cairo',
                    fontSize: 15,
                    letterSpacing: 2,
                  ),
                ),
//                Text(
//                  '1',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 25,
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),

//      Container(
//        padding: EdgeInsets.symmetric(horizontal: 10),
//        height: MediaQuery.of(context).size.height*.2,
//        child: ClipRRect(
//          borderRadius: BorderRadius.circular(8),
//          child: Stack(
//            children: [
////              Image.network(
////                imageUrl,
////                fit: BoxFit.cover,
////                width: MediaQuery.of(context).size.width,
////              ),
//              Card(
//                elevation: 10,
//                shadowColor: Colors.deepOrange,
//                child: Container(
//                  color:status=="passed"?Colors.green:status=="failed"?Colors.red:Colors.grey,
//                  child: Center(
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text(
//                          widget.title,
//                          style: TextStyle(
//                              fontSize: 25,
//                              letterSpacing: 2,
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold),
//                        ),
//                        SizedBox(height: 4,),
//                        Text(
//                          widget.description,
//                          style: TextStyle(
//                              fontSize: 15,
//                              color: Colors.white,
//                              letterSpacing: 2,
//                              fontWeight: FontWeight.w500),
//                        ),
//                        SizedBox(
//                          height: 4,
//                        ),
//                        Text(
//                          status,
//                          style: TextStyle(
//                              fontSize: 20,
//                              letterSpacing: 2,
//                              color: status=="passed"?Colors.white:Colors.black,
//                              fontWeight: FontWeight.bold),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
    );
  }
}
