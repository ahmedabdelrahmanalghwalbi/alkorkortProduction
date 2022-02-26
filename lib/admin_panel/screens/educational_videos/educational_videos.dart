import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:korkort/admin_panel/responsive.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EducationalVideos extends StatefulWidget {
  @override
  _EducationalVideosState createState() => _EducationalVideosState();
}

class _EducationalVideosState extends State<EducationalVideos> {
  String description;
  String url;
  createEducationalVideo()async{
    await FirebaseFirestore.instance.collection("EducationalVideos").add({
      'description':description,
      'url':url
    }).then((value){print("^^^^^^^^^^^^^^^^^^^ Educational videos stored successfully");}).catchError((ex){
      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^ failed to store Educational video");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("فيديوهات تعليمية (pedagogiska videor)"),
        centerTitle: true,
      ),
      body: Responsive.isDesktop(context)?Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            //get and deleting Educational videos
            Flexible(child: FutureBuilder(
              future:FirebaseFirestore.instance.collection("EducationalVideos").get(),
              builder: (context,snapshot){
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(snapshot.data.docs.length == 0){
                  return Center(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: Card(
                            child: ListTile(
                              title: Text("${document['url']}",textAlign: TextAlign.end,),
                              subtitle: Text("${document['description']}",textAlign: TextAlign.end,style: TextStyle(
                                  color: Colors.blueAccent
                              ),),
                              leading: GestureDetector(
                                child: Icon(Icons.delete),
                                onTap: ()async{
                                  await FirebaseFirestore.instance.collection("EducationalVideos").doc(document.id).delete().then((value){
                                    print("xxxxxxxxxxxxxxxxxx Educational Video deleted successfullt");
                                  });
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        );
                      }).toList()
                  );
                }
              },
            )),
            //Adding new Educational video to fireStorage
            Flexible(child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //title text form field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('وصف الفيديو التعليمي (Beskrivning av instruktionsvideon)',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'
                      ),),
                      SizedBox(height: 5,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "أدخل الوصف (Ange beskrivningen)",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            description=val;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  //description text Form field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('أدخل رابط اليوتيوب للفيديو (Ange YouTube-länken för videon)',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'cairo'
                      ),),
                      SizedBox(height: 5,),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "أدخل الرابط (Ange länken)",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            url=val;
                          });
                        },
                      ),
                    ],
                  ),
                  //submit button
                  Padding(
                    padding: EdgeInsets.only(top:50.0),
                    child: GestureDetector(
                      onTap: (){
                        url!=null&&description!=null?createEducationalVideo():print("please provide all values");
                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:url!=null&&description!=null?Colors.blueAccent.withOpacity(.3):Colors.grey.withOpacity(.7),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Center(
                            child:Text("(Skapa en pedagogisk video) أنشاء الفيديو التعليمي",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
        ////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////
        ////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////
      ):SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Adding new traffic signs to fireStorage
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //title text form field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('وصف الفيديو التعليمي (Beskrivning av instruktionsvideon)',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo'
                        ),),
                        SizedBox(height: 5,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "أدخل الوصف (Ange beskrivningen)",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent
                                  )
                              )
                          ),
                          onChanged: (val){
                            setState(() {
                              description=val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    //description text Form field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('أدخل رابط اليوتيوب للفيديو (Ange YouTube-länken för videon)',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo'
                        ),),
                        SizedBox(height: 5,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "أدخل الرابط (Ange länken)",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent
                                  )
                              )
                          ),
                          onChanged: (val){
                            setState(() {
                              url=val;
                            });
                          },
                        ),
                      ],
                    ),
                    //submit button
                    GestureDetector(
                      onTap: (){
                        url!=null&&description!=null?createEducationalVideo():print("please provide all values");
                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:url!=null&&description!=null?Colors.blueAccent.withOpacity(.3):Colors.grey.withOpacity(.7),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Center(
                            child:Text("(Skapa en pedagogisk video) أنشاء الفيديو التعليمي",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //get and deleting traffic signs
              Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future:FirebaseFirestore.instance.collection("EducationalVideos").get(),
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
                              child: Card(
                                child: ListTile(
                                  title: Text("${document['url']}",textAlign: TextAlign.end,),
                                  subtitle: Text("${document['description']}",textAlign: TextAlign.end,style: TextStyle(
                                      color: Colors.blueAccent
                                  ),),
                                  leading: GestureDetector(
                                    child: Icon(Icons.delete),
                                    onTap: ()async{
                                      await FirebaseFirestore.instance.collection("EducationalVideos").doc(document.id).delete().then((value){
                                        print("xxxxxxxxxxxxxxxxxx Educational Video deleted successfullt");
                                      });
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
