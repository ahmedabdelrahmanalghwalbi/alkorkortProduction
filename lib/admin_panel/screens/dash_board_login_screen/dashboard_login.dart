import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:korkort/admin_panel/controllers/MenuController.dart';
import 'package:korkort/admin_panel/main.dart';
import 'package:korkort/admin_panel/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

class DashboardLoginScreen extends StatefulWidget {
  @override
  _DashboardLoginScreenState createState() => _DashboardLoginScreenState();
}

class _DashboardLoginScreenState extends State<DashboardLoginScreen> {
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height/3,
                  child: Image.asset("assets/dashboard_icons/logo.png",fit: BoxFit.contain,)),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "أدخل البريد الألكتروني (Ange e-postmeddelandet)",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  obscureText: true,
                 onChanged: (val){
                   setState(() {
                     password=val;
                   });
                 },
                  decoration: InputDecoration(
                      hintText: "أدخل كلمة المرور (Ange lösenordet)",
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(email=="KorKortAdmin@gmail.com" && password=="KorKortAdmin@12345"){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuController(),
                        ),
                      ],
                      child: MainScreen(),
                    ),
                    )
                    );
                  }
                },
                child: Container(
//              width: MediaQuery.of(context).size.width/5,
//              height: MediaQuery.of(context).size.height*0.1,
                margin: EdgeInsets.only(top: 70,left: 90,right: 90),
                padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text("تسجيل الدخول       (logga in)",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                      fontSize: 25
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
