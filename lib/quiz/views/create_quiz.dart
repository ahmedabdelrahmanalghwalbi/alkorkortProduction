import 'package:flutter/material.dart';
import 'package:korkort/quiz/services/database.dart';
import 'package:korkort/quiz/views/add_question.dart';
import 'package:korkort/quiz/widget/widget.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {


  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  DatabaseService databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();

  String quizImgUrl, quizTitle, quizDesc;

  bool isLoading = false;
  String quizId;

  createQuiz(){

    quizId = randomAlphaNumeric(16);
    if(_formKey.currentState.validate()){

      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
        "quizImgUrl" : quizImgUrl,
        "quizTitle" : quizTitle,
        "quizDesc" : quizDesc,
        "status":"waiting"
      };

      databaseService.addQuizData(quizData, quizId).then((value){
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) =>  AddQuestion(quizId)
        ));
      });
    }
  }


  @override
  void initState() {
    super.initState();
    quizImgUrl=" ";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text("(Gör ett test B) عمل أخبتار لفئة B",style: TextStyle(
          color: Colors.white,
          fontFamily: "cairo"
        ),),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.9,
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Column(
                children: [
//                TextFormField(
//                  validator: (val) => val.isEmpty ? "Enter Quiz Image Url" : null,
//                  decoration: InputDecoration(
//                    hintText: "Quiz Image Url (Optional)",
//                    border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(10.0),
//                      borderSide: BorderSide(
//                        color: Colors.deepOrange,
//                      ),
//                  ),
//                  ),
//                  onChanged: (val){
//                    quizImgUrl = val;
//                  },
//                ),
                Padding(
                  padding: EdgeInsets.only(top:10,bottom: 10),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
                    decoration: InputDecoration(
                      hintText: "عنوان الأختبار (Testets titel)",
                      hintStyle: TextStyle(
                        fontFamily: "cairo"
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    onChanged: (val){
                      quizTitle = val;
                    },
                  ),
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,
                  decoration: InputDecoration(
                      hintText: "وصف الأختبار (Beskrivning av testet)",
                    hintStyle: TextStyle(
                        fontFamily: "cairo"
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  onChanged: (val){
                   quizDesc = val;
                  },
                ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      createQuiz();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "أنشاء الأختبار (Skapa ett test)",
                        style: TextStyle(
                            fontSize: 16, color: Colors.white,fontFamily: 'cairo'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
              ],)
              ,),
          ),
        ),
      ),
    );
  }
}
