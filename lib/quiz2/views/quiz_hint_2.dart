import 'package:flutter/material.dart';
import 'package:korkort/quiz2/views/quiz_play.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizHint2 extends StatefulWidget {
  var id,title,description;
  QuizHint2({this.id,this.title,this.description});

  @override
  _QuizHint2State createState() => _QuizHint2State();
}

class _QuizHint2State extends State<QuizHint2> {
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
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        leading: null,
        actions: [
          Icon(Icons.arrow_forward_ios,color: Colors.black38,)
        ],
        centerTitle: true,
        title: Text("${widget.title}",style: TextStyle(
            color: Colors.black,
            fontFamily: 'cairo',
            fontWeight: FontWeight.bold
        ),),
      ),
      body:Padding(
        padding: EdgeInsets.only(top:10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //advertisment hint
//            Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height*0.15,
//              color: Colors.deepOrangeAccent,
//              child: Center(
//                child: Text("أعلان",style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 30
//                ),),
//              ),
//            ),
            //center description
            Padding(
              padding:EdgeInsets.only(top: 20,bottom: 40),
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.4,
//              color: Colors.red,
                child: Text('${widget.description}',textAlign: TextAlign.center,style: TextStyle(
                  fontFamily:'cairo',
                  fontSize: 22,
                ),),
              ),
            ),
            //start exam button
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPlay(widget.id)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.height*0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(color: Colors.black38,blurRadius: 2,spreadRadius: 1)
                    ]
                ),
                child: Center(
                  child:isArabic?Text('أبدأ الأختبار الأن',style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),):Text('Jag börjar testet nu',style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'cairo',
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            )
          ],),
      ),
    );
  }
}
