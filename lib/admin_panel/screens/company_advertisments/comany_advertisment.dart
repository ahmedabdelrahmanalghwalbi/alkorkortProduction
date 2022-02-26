import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompanyAdvertisments extends StatefulWidget {
  @override
  _CompanyAdvertismentsState createState() => _CompanyAdvertismentsState();
}

class _CompanyAdvertismentsState extends State<CompanyAdvertisments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("(Annonsera med oss)أعلن لدينا",style: TextStyle(
          fontFamily: "cairo"
        ),),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
        future:FirebaseFirestore.instance.collection("CompanyAdvertisments").get(),
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
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          child: ListTile(
                           trailing: Text("${document['companyNumber']}",style: TextStyle(
                             color: Colors.blueAccent
                           ),),
                            title: Text("${document['companyName']}",textAlign: TextAlign.start,),
                            subtitle: Text("${document['companyEmail']}",textAlign: TextAlign.start,style: TextStyle(
                                color: Colors.blueAccent
                            ),),
                            leading: GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: ()async{
                                await FirebaseFirestore.instance.collection("CompanyAdvertisments").doc(document.id).delete().then((value){
                                  print("xxxxxxxxxxxxxxxxxx Traffic sign deleted successfullt");
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
