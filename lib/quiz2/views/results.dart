import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:korkort/quiz2/views/home2.dart';
import 'package:korkort/view/main_page/home1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Results extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  String quizId;
  Results({this.incorrect, this.total, this.correct, this.notattempted,this.quizId});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool isArabic=true;
  getIsArabic()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    setState(() {
      isArabic=pref.getBool("isArabic");
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIsArabic();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:isArabic?Text("نتائج الأختبار",style: TextStyle(
            color: Colors.black,
            fontFamily: "cairo"
        ),):Text("Testresultat",style: TextStyle(
            color: Colors.black,
            fontFamily: "cairo"
        ),),
        brightness: Brightness.light,
        elevation: 0.4,
        backgroundColor: Colors.deepOrange,
        //brightness: Brightness.li,
      ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Center(
          child: Column(
            children: [
              Card(
                color:widget.correct>widget.incorrect?Colors.green[100]:Colors.red[100],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        widget.correct>widget.incorrect?Text(isArabic?"ناجح":"framgångsrik", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.green),):Text(isArabic?"راسب":"misslyckas", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.red),),
                        isArabic?Text("النتيجة النهائية", style: TextStyle(fontSize: 30,fontFamily: "cairo"),):Text("Det slutliga resultatet", style: TextStyle(fontSize: 20,fontFamily: "cairo"),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    CircleAvatar(radius:60,backgroundColor: Colors.deepOrange,
                        child: Text("${widget.correct}/ ${widget.total}", style: TextStyle(fontSize: 33,color: Colors.white,fontFamily: "cairo",fontWeight: FontWeight.bold),)),
                    SizedBox(height: 15,)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:10.0,right:10,top: 40),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${widget.correct}", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.green),),
                      isArabic?Text("الأجابات الصحيحة", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.black),):Text("korrekta svar", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.black),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left:10.0,right:10),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${widget.incorrect}", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.red),),
                      isArabic?Text("الأجابات الخاطئة", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.black),):Text("fel svar", style: TextStyle(fontSize: 30,fontFamily: "cairo",color: Colors.black),),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  if(widget.correct > widget.incorrect){
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final userId = await auth.currentUser.uid;
                    FirebaseFirestore.instance.collection("Results2").get().then((querySnapShot){
                      querySnapShot.docs.forEach((document) async{
                        if(document['userId']== userId && document['quizId']==widget.quizId){
                          await FirebaseFirestore.instance.collection("Results2").doc(document.id).update({
                            "userId":userId,
                            "quizId":widget.quizId,
                            "status":"passed"
                          }).then((value) {
                            print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx result updated to passed successfully }");
                          });
                        }
                      });
                    }).catchError((ex){
                      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx error with update the result to passed ${ex}");
                    });
                  }else{
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final userId = await auth.currentUser.uid;
                    FirebaseFirestore.instance.collection("Results2").get().then((querySnapShot){
                      querySnapShot.docs.forEach((document) async{
                        if(document['userId']== userId && document['quizId']==widget.quizId){
                          await FirebaseFirestore.instance.collection("Results2").doc(document.id).update({
                            "userId":userId,
                            "quizId":widget.quizId,
                            "status":"failed"
                          }).then((value) {
                            print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx result updated to failed successfully }");
                          });
                        }
                      });
                    }).catchError((ex){
                      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx error with update the result to falied ${ex}");
                    });
                  }
                Navigator.pop(context);
                },
                child: Padding(
                  padding:  EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.deepOrange,width: 2)
                    ),
                    child: Center(child:isArabic?Text("عرض الأسئلة والأجابات", style: TextStyle(color: Colors.deepOrange, fontSize: 20,fontFamily: "cairo"),):Text("Visa frågor och svar", style: TextStyle(color: Colors.deepOrange, fontSize: 20,fontFamily: "cairo"),)),
                  ),
                ),
              )
          ],),
        ),
      ),
    );
  }
}
