import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Video extends StatefulWidget {
  bool isArabic;
  Video({this.isArabic});
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool darkMood=false;
  getDarkMood()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      darkMood=pref.getBool("darkMood");
    });
  }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDarkMood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset('assets/play-button 2.png',fit: BoxFit.contain,),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        centerTitle: true,
        title:widget.isArabic?Text(
          'مقاطع تعليمية',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ):Text(
          'pedagogiska klipp',
          style: TextStyle(
            fontFamily: 'cairo',
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor:darkMood?Colors.black:Colors.brown[50],
      body:Container(
          width: MediaQuery.of(context).size.width,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("لا يوجد بيانات",style: TextStyle(
                        color: darkMood?Colors.white:Colors.black,
                      ),),
                      Text("Det finns inga data",style: TextStyle(
                        color: darkMood?Colors.white:Colors.black,
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
                              child: Column(
                                children: [
                                  Text("${document['description']}",style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "cairo",
                                    fontSize: 18
                                  ),textAlign: TextAlign.center,),
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    child: YoutubePlayer(
                                      controller: YoutubePlayerController(
                                          initialVideoId: YoutubePlayer.convertUrlToId(document["url"]),
                                          flags: YoutubePlayerFlags(
                                            autoPlay: false,
                                          )),
                                      showVideoProgressIndicator: true,
                                      progressIndicatorColor: Colors.blue,
                                      progressColors: ProgressBarColors(
                                          playedColor: Colors.blue,
                                          handleColor: Colors.blueAccent),
                                    ),
                                  ),
                                ],
                              )),);
                    }).toList()
                );
              }
            },
          )),
    );
  }
}
