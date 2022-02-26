import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:korkort/admin_panel/responsive.dart';
import 'package:uuid/uuid.dart';

class PublicInformationB extends StatefulWidget {
  @override
  _PublicInformationBState createState() => _PublicInformationBState();
}

class _PublicInformationBState extends State<PublicInformationB> {
  String title;
  String description;
  String uploadedImageUrl;

  Future getImage() async {
    FilePickerResult result;
    result =await FilePicker.platform.pickFiles(
        type: FileType.image
    );
    if(result !=null){
      Uint8List uploadedFile =result.files.single.bytes;
      String fileName=result.files.single.name;
      firebase_storage.Reference reference=firebase_storage.FirebaseStorage.instance.ref().child(Uuid().v1());
      final firebase_storage.UploadTask uploadTask =reference.putData(uploadedFile);
      uploadTask.whenComplete(()async{
        String imageUrl = await uploadTask.snapshot.ref.getDownloadURL();
        setState(() {
          uploadedImageUrl =imageUrl;
        });
      });
    }
  }

  createSign()async{
    await FirebaseFirestore.instance.collection("PublicInformationB").add({
      'title':title,
      'imageUrl':uploadedImageUrl,
      'description':description,
    }).then((value){print("^^^^^^^^^^^^^^^^^^^ public Information B stored successfully");}).catchError((ex){
      print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^ failed to store public Information B");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("(Allmän information B) المعلومات العامة للفئة B"),
          centerTitle: true,
        ),
        body: Responsive.isDesktop(context)?Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            children: [
              //get and deleting traffic signs
              Flexible(child: FutureBuilder(
                future:FirebaseFirestore.instance.collection("PublicInformationB").get(),
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
                                title: Text("${document['title']}",textAlign: TextAlign.end,),
                                subtitle: Text("${document['description']}",textAlign: TextAlign.end,style: TextStyle(
                                    color: Colors.blueAccent
                                ),),
                                leading: GestureDetector(
                                  child: Icon(Icons.delete),
                                  onTap: ()async{
                                    await FirebaseFirestore.instance.collection("PublicInformationB").doc(document.id).delete().then((value){
                                      print("xxxxxxxxxxxxxxxxxxxxxxxxxx public information B deleted successfull");
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
              //Adding new traffic signs to fireStorage
              Flexible(child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //title text form field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('(Adressen till informationen) عنوان المعلومة',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo'
                        ),),
                        SizedBox(height: 5,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "(Ange adressen) أدخل العنوان",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent
                                  )
                              )
                          ),
                          onChanged: (val){
                            setState(() {
                              title=val;
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
                        Text('(Beskrivning av informationen) وصف المعلومة',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo'
                        ),),
                        SizedBox(height: 5,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "(Ange beskrivningen) أدخل الوصف",
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
                    //select image row
                    Padding(
                      padding: EdgeInsets.only(top:30.0,bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image:uploadedImageUrl == null
                                      ? AssetImage("assets/danger.png") : AssetImage("assets/check.png"),
                                )
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blueAccent),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.camera_alt,color: Colors.white,),
                                      SizedBox(width: 10,),
                                      Text('أختار صورة',style: TextStyle(
                                          fontFamily: "cairo",
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ],
                                  ),
                                  Text('Jag väljer bilden',style: TextStyle(
                                      fontFamily: "cairo",
                                      fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                            ),
                            onTap: ()async{
                              try{
                                getImage();
                              }catch(ex){
                                print("///////////////////////${ex}");
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    //submit button
                    GestureDetector(
                      onTap: (){
                        title!=null&&description!=null&& uploadedImageUrl!=null?createSign():print("please provide all values");
                        setState(() {});
                        },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:title!=null&&description!=null&& uploadedImageUrl!=null?Colors.blueAccent.withOpacity(.3):Colors.grey.withOpacity(.7),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: Center(
                            child:Text("(Bevara informationen) حفظ المعلومة",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ):SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //Adding new traffic signs to fireStorage
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //title text form field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('(Adressen till informationen) عنوان المعلومة',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'cairo'
                          ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "(Ange adressen) أدخل العنوان",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent
                                    )
                                )
                            ),
                            onChanged: (val){
                              setState(() {
                                title=val;
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
                          Text('(Beskrivning av informationen) وصف المعلومة',style: TextStyle(
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
                      //select image row
                      Padding(
                        padding: EdgeInsets.only(top:30.0,bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:uploadedImageUrl == null
                                        ? AssetImage("assets/danger.png") : AssetImage("assets/check.png"),
                                  )
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueAccent),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.camera_alt,color: Colors.white,),
                                        SizedBox(width: 10,),
                                        Text('أختار صورة',style: TextStyle(
                                            fontFamily: "cairo",
                                            fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                    Text('Jag väljer bilden',style: TextStyle(
                                        fontFamily: "cairo",
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),
                              onTap: ()async{
                                try{
                                  getImage();
                                }catch(ex){
                                  print("///////////////////////${ex}");
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      //submit button
                      GestureDetector(
                        onTap: (){
                          title!=null&&description!=null&& uploadedImageUrl!=null?createSign():print("please provide all values");
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:title!=null&&description!=null&& uploadedImageUrl!=null?Colors.blueAccent.withOpacity(.3):Colors.grey.withOpacity(.7),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueAccent),
                          ),
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Center(
                              child:Text("(Bevara informationen) حفظ المعلومة",style: TextStyle(
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
                    future:FirebaseFirestore.instance.collection("PublicInformationB").get(),
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
                                    title: Text("${document['title']}",textAlign: TextAlign.end,),
                                    subtitle: Text("${document['description']}",textAlign: TextAlign.end,style: TextStyle(
                                        color: Colors.blueAccent
                                    ),),
                                    leading: GestureDetector(
                                      child: Icon(Icons.delete),
                                      onTap: ()async{
                                        await FirebaseFirestore.instance.collection("PublicInformationB").doc(document.id).delete().then((value){
                                          print("xxxxxxxxxxxxxxxxxx public information B deleted successfullt");
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
        )
    );
  }
}
