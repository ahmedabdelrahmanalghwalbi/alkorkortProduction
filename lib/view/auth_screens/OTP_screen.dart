import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korkort/view/auth_screens/phone_auth_model.dart';

class OtpScreen extends StatelessWidget {
  final loginController = Get.put(PhoneLogin());
  final otp = TextEditingController();
  bool isArabic;
  OtpScreen({this.isArabic});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginController.isLoading(false) ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1,child: Container(),),
              Expanded(flex:3,child:Container(child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/driving-school (1).png'),
                      ),
                    ),
                  ),
                  isArabic?Row(
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
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'اهلا وسهلا في',
                        style: TextStyle(
                            fontSize: 20,
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
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),

                    ],
                  )
                ],
              ),)),
              Expanded(flex: 5,child: ListView(children: [
                Container(
                  child: Column(
                    children: [
                      Form(
                          child: Column(
                            children: [
                              Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: TextFormField(
                                      controller: otp,
                                      keyboardType: TextInputType.phone,
                                      decoration:
                                      InputDecoration(labelText:isArabic?'أدخل الكود المرسل':'Ange den skickade koden',
                                          labelStyle: TextStyle(
                                              fontFamily: "cairo"
                                          ),
                                          prefixIcon:Icon(Icons.phone,color: Colors.black38,),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black38),
                                              borderRadius: BorderRadius.circular(15)
                                          )
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.all(30),
                                child: GestureDetector(
                                  onTap: () {
                                    loginController.verifyOTP(otp.text,isArabic);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(top:10,bottom: 10,left: 40,right: 40),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child:isArabic?Text("تسجيل الدخولل",style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "cairo",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),):Text("logga in",style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "cairo",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ]),),
              Expanded(flex: 2,child: Container(),)
            ],
          ),
        ),
      )
    );
  }
}

/*
* Center(
          child: Column(
            children: [
              Spacer(),
              TextField(
                controller: otp,
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                onPressed: ()  {
                  loginController.verifyOTP(otp.text);
                },
                child: Text("VERIFY"),
                color: Colors.blue,
                textColor: Colors.white,
              ),
              Spacer(),
            ],
          )),*/