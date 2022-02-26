import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:korkort/quiz/models/question_model.dart';
import 'package:korkort/quiz/services/database.dart';
import 'package:korkort/quiz/views/home.dart';
import 'package:korkort/quiz/views/results.dart';
import 'package:korkort/quiz/widget/widget.dart';
import 'package:korkort/quiz/widgets/quiz_play_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPlay extends StatefulWidget {
  final String quizId;
  QuizPlay(this.quizId);

  @override
  _QuizPlayState createState() => _QuizPlayState();
}

int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;
int total = 0;

/// Stream
Stream infoStream;

class _QuizPlayState extends State<QuizPlay> {
  QuerySnapshot questionSnapshot;
  DatabaseService databaseService = new DatabaseService();

  bool isLoading = true;

  bool isArabic=true;
  getIsArabic()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      isArabic=pref.getBool("isArabic");
    });
  }
  @override
  void initState() {
    getIsArabic();
    print("this is the quiz id ${widget.quizId}");
    databaseService.getQuestionData(widget.quizId).then((value) {
      print("xxxxxxxxxxxxxxxx the questions values is ${value}");
      questionSnapshot = value;
      _notAttempted = questionSnapshot.docs.length;
      print("this is _not attempted ${_notAttempted}");
      _correct = 0;
      _incorrect = 0;
      isLoading = false;
      total = questionSnapshot.docs.length;
      setState(() {});
      print("init don $total ${widget.quizId} ");
    });

    if(infoStream == null){
      infoStream = Stream<List<int>>.periodic(
        Duration(milliseconds: 100), (x){
          print("this is x $x");
          return [_correct, _incorrect] ;
      });
    }

    super.initState();
  }


  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();

    questionModel.question = questionSnapshot.get("question");

    print("zzzzzzzzzzzzzzzzzzthis is the questions ${questionSnapshot.data()}");

    /// shuffling the options
    List<String> options = [
      questionSnapshot.get("option1"),
      questionSnapshot.get("option2"),
      questionSnapshot.get("option3"),
      questionSnapshot.get("option4"),
    ];
    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionSnapshot.get("option1");
    questionModel.answered = false;

    print(questionModel.correctOption.toLowerCase());

    return questionModel;
  }


  @override
  void dispose() {
    infoStream = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Center(child: Icon(Icons.check,color: Colors.white,),),
        backgroundColor: Colors.deepOrange,
        onPressed: ()async{
          final FirebaseAuth auth = FirebaseAuth.instance;
          final userId = await auth.currentUser.uid;
          print("ooooooooooooooooo => this is the current user id is ${userId}");
          await FirebaseFirestore.instance
              .collection("Results")
              .add({
            "userId":userId,
            "quizId":widget.quizId,
            "status":"waiting"
          }).then((value){
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Results(correct: _correct,incorrect: _incorrect,total: total,notattempted: _notAttempted,quizId:widget.quizId)));
          }).catchError((e) {
            print("xxxxxxxxxxxxxxxxxxxxxx failed to add the result waiting ${e}");
          });
        },
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
            onTap: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()));
              setState(() {});
            },
          ),
        ],
        centerTitle: true,
        title:isArabic?Text("الأختبار",style: TextStyle(
            color: Colors.black,
            fontFamily: "cairo"
        ),):Text("testet",style: TextStyle(
            color: Colors.black,
            fontFamily: "cairo"
        ),),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: isLoading
          ? Container(
        child: Center(child: CircularProgressIndicator()),
      )
          : SingleChildScrollView(
            child: Container(
                child: Column(
                  children: [
                    InfoHeader(
                      length: questionSnapshot.docs.length,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    questionSnapshot.docs == null
                        ? Container(
                      child: Center(child: Text("No Data"),),
                    )
                        : ListView.builder(
                            itemCount: questionSnapshot.docs.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return QuizPlayTile(
                                questionModel: getQuestionModelFromDatasnapshot(
                                    questionSnapshot.docs[index]),
                                index: index,
                              );
                            })
                  ],
                ),
              ),
          ),
    );
  }
}

class InfoHeader extends StatefulWidget {
  final int length;

  InfoHeader({@required this.length});

  @override
  _InfoHeaderState createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: infoStream,
      builder: (context, snapshot){
        return snapshot.hasData ? Container(
          height: 40,
          margin: EdgeInsets.only(left: 14),
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              NoOfQuestionTile(
                text: "Total",
                number: widget.length,
              ),
              NoOfQuestionTile(
                text: "Correct",
                number: _correct,
              ),
              NoOfQuestionTile(
                text: "Incorrect",
                number: _incorrect,
              ),
              NoOfQuestionTile(
                text: "NotAttempted",
                number: _notAttempted,
              ),
            ],
          ),
        ) : Container();
      }
    );
  }
}


class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile({@required this.questionModel, @required this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Text(
              "${widget.index + 1}- ${widget.questionModel.question}",
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: Card(
              child: OptionTile(
                option: "A",
                description: "${widget.questionModel.option1}",
                correctAnswer: widget.questionModel.correctOption,
                optionSelected: optionSelected,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: Card(
              child: OptionTile(
                option: "B",
                description: "${widget.questionModel.option2}",
                correctAnswer: widget.questionModel.correctOption,
                optionSelected: optionSelected,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: Card(
              child: OptionTile(
                option: "C",
                description: "${widget.questionModel.option3}",
                correctAnswer: widget.questionModel.correctOption,
                optionSelected: optionSelected,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: Card(
              child: OptionTile(
                option: "D",
                description: "${widget.questionModel.option4}",
                correctAnswer: widget.questionModel.correctOption,
                optionSelected: optionSelected,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
