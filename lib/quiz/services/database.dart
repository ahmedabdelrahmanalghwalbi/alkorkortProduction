import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  Future<void> addData(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }
//
//  getData() async {
//    return await FirebaseFirestore.instance.collection("users").snapshots();
//  }

  Future<void> addQuizData(Map quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    var data= await FirebaseFirestore.instance.collection("Quiz").snapshots();
    print("the first data is ${data}");
    return data;
  }

  getQuestionData(String quizId) async{
    print("hhhhhhhhhhhhhhhhhherr get question data");
    var data = await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA").get();
    print("tttttttttttttttttttttttttttthis is data ${data}");
    return data;
  }

  //get the current user id
   getCurrentQuizResultStatus(quizId)async{
    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      final userId = await auth.currentUser.uid;
      FirebaseFirestore.instance.collection("Results").get().then((snapshot){
        snapshot.docs.map((document){
          if(document.get("quizId") == quizId.toString() && document.get("userId") == userId.toString()){
            print("wwwwwwwwwwwwwwwwwwwwwwwwwwwww the final user id is ${uid}");
            print("wwwwwwwwwwwwwwwwwwwwwwwwwwwww the final quiz id is ${quizId}");
            return document.get("status").toString();
          }else{
            print("ttttttttttttttttttttttttttttttttttttttttttttttttttttt");
          }
        });
      }).catchError((error)=>print("failed to get the results data ${error}"));
    }catch(ex){
      print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzz exception in this function ${ex}");
    }
  }
}
