
import 'package:flutter/material.dart';
import 'package:korkort/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsDashboard extends StatefulWidget {
  @override
  _SettingsDashboardState createState() => _SettingsDashboardState();
}

class _SettingsDashboardState extends State<SettingsDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الأعدادات"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Card(
              child: GestureDetector(
                onTap: ()async{
                  SharedPreferences pref=await SharedPreferences.getInstance();
                  pref.setBool("isDarkMode", false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("الوضع الليلي",style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      Icon(Icons.wb_sunny,color: Colors.yellow,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(" language",style: TextStyle(
                        color: Colors.white
                    ),),
                    Icon(Icons.wb_sunny,color: Colors.yellow,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
