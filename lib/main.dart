import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korkort/admin_panel/main.dart';
import 'package:korkort/quiz/views/home.dart';
import 'package:korkort/size_config.dart';
import 'package:korkort/view/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:kIsWeb?MyAppAdmin() :MyApp(),
    title: "AlKorKort",
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  initPref()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool("darkMood", false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPref();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Scaffold(
            appBar: AppBar(
              title: Text("error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return SplashScreen(
            photoSize: MediaQuery.of(context).size.height/4,
            seconds: 3,
            navigateAfterSeconds:AfterSplash(),
            imageBackground: AssetImage(
              'assets/1.png',
            ),
            loaderColor: Colors.indigo[500],
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(body: Center(
          child: CircularProgressIndicator(),
        ),);
      },
    );
  }
}
/*
* SplashScreen(
      photoSize: MediaQuery.of(context).size.height/4,
      seconds: 3,
      navigateAfterSeconds:AfterSplash(),
      imageBackground: AssetImage(
        'assets/1.png',
      ),
      loaderColor: Colors.indigo[500],
    );*/

class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
  return WelcomeScreen();
//      if(Platform.isIOS){
//        return WelcomeScreen();
//      }else if(Platform.isAndroid){
//        return WelcomeScreen();
//      }else if(kIsWeb){
//        return WelcomeScreen();
//      }
}
}
