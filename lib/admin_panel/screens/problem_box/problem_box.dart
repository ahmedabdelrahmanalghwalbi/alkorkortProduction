import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProblemsBox extends StatefulWidget {
  @override
  _ProblemsBoxState createState() => _ProblemsBoxState();
}

class _ProblemsBoxState extends State<ProblemsBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("(Rapportera ett problem) الأبلاغ عن مشكلة",style: TextStyle(
            fontFamily: "cairo"
        ),),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future:FirebaseFirestore.instance.collection("ReportOnProblem").get(),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else if(snapshot.data.docs.length == 0){
                return Center(
                  child:Column(
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
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                trailing: Image.asset('assets/danger.png'),
                                title: Text("${document.data()['problemEmail']}",textAlign: TextAlign.start,),
                                subtitle: Text("${document['problemMessage']}",textAlign: TextAlign.start,style: TextStyle(
                                    color: Colors.blueAccent
                                ),),
                                leading: GestureDetector(
                                  child: Icon(Icons.delete),
                                  onTap: ()async{
                                    await FirebaseFirestore.instance.collection("ReportOnProblem").doc(document.id).delete().then((value){
                                      print("xxxxxxxxxxxxxxxxxx this report is deleted successfully deleted successfullt");
                                    });
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList()
                );
              }
            },
          )),
    );
  }
}
