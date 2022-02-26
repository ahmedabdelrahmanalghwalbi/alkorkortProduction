import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:korkort/models/user.dart';
import 'package:korkort/view/auth_screens/phone_auth_screen.dart';
import 'package:korkort/view/auth_screens/signup.dart';
import 'package:korkort/view/home_screen/home_screen.dart';
import 'package:korkort/view/page_transitions/slide_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  bool isArabic;
  Login({this.isArabic});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email,password;
  bool darkMood=false;
  getDarkMood()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      darkMood=pref.getBool("darkMood");
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDarkMood();
  }
  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:darkMood?Colors.black:Colors.brown[50],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: width,
          height: height,
            child: Column(
              children: [
                Expanded(flex:3,child:Container(child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height*0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/driving-school (1).png'),
                        ),
                      ),
                    ),
                    widget.isArabic?Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Al',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'korkort',
                          style: TextStyle(
                              color: darkMood?Colors.white:Colors.black,
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'اهلا وسهلا في',
                          style: TextStyle(
                              fontSize: 20,
                              color: darkMood?Colors.white:Colors.black,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ):Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Välkommen till',
                          style: TextStyle(
                              fontSize: 20,
                              color: darkMood?Colors.white:Colors.black,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Al',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'körkort',
                          style: TextStyle(
                              color: darkMood?Colors.white:Colors.black,
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),

                      ],
                    )
                  ],
                ),)),
                Expanded(flex:5,child: Container(
                  padding: EdgeInsets.only(right:10,left: 10),
                  child:Column(
                    crossAxisAlignment:widget.isArabic?CrossAxisAlignment.end:CrossAxisAlignment.start,
                  children: [
                    widget.isArabic?Text('البريد الالكتروني',
                        style: TextStyle(
                            fontSize: 15,
                            color: darkMood?Colors.white:Colors.black,
                            fontFamily: "cairo",
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end):Text('E-post',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "cairo",
                            color: darkMood?Colors.white:Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      color: Colors.grey[300],
                      width: width,
                      height: height*0.06,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val){
                          setState(() {
                            email=val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    widget.isArabic?Text(
                      'كلمة المرور',
                      style: TextStyle(
                          fontSize: 15,
                          color: darkMood?Colors.white:Colors.black,
                          fontFamily: "cairo",
                          fontWeight: FontWeight.bold),
                    ):Text(
                      'Lösenord',
                      style: TextStyle(
                          fontSize: 15,
                          color: darkMood?Colors.white:Colors.black,
                          fontFamily: "cairo",
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      color: Colors.grey[300],
                      width: width,
                      height: height*0.06,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (val){
                          setState(() {
                            password=val;
                          });
                        },
                      ),
                    ),
                    //************************************************
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: height*0.02,bottom: height*0.01),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.black45),
                          ],
                        ),
                        width: width*0.7,
                        height: height*0.06,
                        child: MaterialButton(
                          onPressed: () async{
                            try {
                              Users user=new Users(email: email,password: password);
                              UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: user.email,
                                  password: user.password
                              );
                              Navigator.of(context)
                                  .pushReplacement(SlideRightTransition(page:HomeScreen(isArabic: widget.isArabic,)));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                                Fluttertoast.showToast(
                                    msg: 'No user found for that email.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                                Fluttertoast.showToast(
                                    msg: 'Wrong password provided for that user.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            }
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => Choose()),
//                                  );
//                            Navigator.of(context)
//                                .push(SlideRightTransition(page:SignUp()));
                          },
                          child:widget.isArabic?Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                fontFamily: 'cairo',
                                color: Colors.white,
                                fontSize: 18),
                          ):Text(
                            'logga in',
                            style: TextStyle(
                                fontFamily: 'cairo',
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    // Or statement
                    Center(
                      child:widget.isArabic? Text(
                        'او',
                        style: TextStyle(fontFamily: 'cairo',color: darkMood?Colors.white:Colors.black,),
                      ):Text(
                        'eller',
                        style: TextStyle(fontFamily: 'cairo',color: darkMood?Colors.white:Colors.black,),
                      ),
                    ),
                    //phone signin
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color:darkMood?Colors.blueGrey:Colors.black38,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.black45),
                          ],
                        ),
                        width: width*0.7,
                        height: height*0.06,
                        margin: EdgeInsets.only(top: height*0.01),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(LoginScreen(isArabic:widget.isArabic));
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.phone,color: Colors.white,),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Phone',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),)),
                //***********************************************
                Expanded(flex:3,child: Container(
                  child: Column(
                  children: [
                    //google signin
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.black45),
                          ],
                        ),
                        width: width*0.7,
                        height: height*0.06,
                        margin: EdgeInsets.only(top: height*0.02,bottom: height*0.02),
                        child: MaterialButton(
                          onPressed: () async{
                            await signInWithGoogle();
                            Navigator.of(context).pushReplacement(SlideRightTransition(page:HomeScreen(isArabic: widget.isArabic,)));
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  width: width*0.05,
                                  height: height*0.05,
                                  image: AssetImage(
                                      'assets/google-symbol.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //facebook SignIn
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 2,
                                color: Colors.black45),
                          ],
                        ),
                        width: width*0.7,
                        height: height*0.06,
                        margin: EdgeInsets.only(bottom: height*0.01),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  width: width*0.05,
                                  height: height*0.05,
                                  image: AssetImage(
                                      'assets/facebook.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(child:widget.isArabic? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child:Text(
                             'اشتراك',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Login(isArabic: widget.isArabic,)));
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ليس لديك حساب ؟',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'cairo',
                              color: darkMood?Colors.white:Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ):Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Du har inget konto',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'cairo',
                              color: darkMood?Colors.white:Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child:Text(
                            'Prenumeration',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp(isArabic: widget.isArabic,)));
                          },
                        ),
                      ],
                    )),
                  ],
                ),))
              ],
            ),
        ),
      ),
    );
  }
}
