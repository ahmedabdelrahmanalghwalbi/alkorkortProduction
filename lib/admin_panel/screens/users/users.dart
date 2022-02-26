import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korkort/admin_panel/screens/users/user_results.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("(Användare)المستخدمين",style: TextStyle(
            fontFamily: "cairo"
        ),),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future:FirebaseFirestore.instance.collection("users").get(),
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
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>UserResults(uid: document['uid'],userName: document['firstName'],)));
                              },
                              child: Card(
                                child: ListTile(
                                  trailing: Text("${document['password']}",style: TextStyle(
                                      color: Colors.blueAccent
                                  ),),
                                  title: Text("${document['firstName']+document['lastName']}",textAlign: TextAlign.start,),
                                  subtitle: Text("${document['email']}",textAlign: TextAlign.start,style: TextStyle(
                                      color: Colors.blueAccent
                                  ),),
                                  leading: GestureDetector(
                                    child: Icon(Icons.delete),
                                    onTap: ()async{
                                      await FirebaseFirestore.instance.collection("users").doc(document.id).delete().then((value){
                                        print("xxxxxxxxxxxxxxxxxx user deleted successfullt");
                                      });
                                      setState(() {});
                                    },
                                  ),
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
