import 'package:flutter/material.dart';
import 'package:korkort/view/main_page/home1.dart';
import 'package:korkort/view/main_page/home1c.dart';
import 'package:korkort/view/main_page/home2.dart';
import 'package:korkort/view/main_page/home3.dart';
import 'package:korkort/view/main_page/home4.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String type;
  bool isArabic;
  MyHomePage({this.type,this.isArabic});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String testType;
  bool arabic;
  int _selectedIndex = 0;
  var  _widgetOptionsB = [
    Home1(),
    Home2(),
    Home3(),
    Home4(),
  ];
  var _widgetOptionsC = [
    Home1c(),
    Home2(),
    Home3(),
    Home4(),
  ];


  @override
  void initState() {
    super.initState();
//    testType =widget.type;
//    print("this is the testing type ${testType}");
//    print("this is the widget type that getting from the previous page ${widget.type}");
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        body: Center(
          child:widget.type=="B"?_widgetOptionsB.elementAt(_selectedIndex):widget.type=="C"?_widgetOptionsC.elementAt(_selectedIndex):_widgetOptionsB.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.brown[50],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title:widget.isArabic?Text(
                  'الرئيسية',
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 12,
                  ),
                ):Text(
                  'Main',
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 12,
                  ),
                )),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/alert 1.png')),
              title:widget.isArabic?Text(
                'شواخص المرور',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 12,
                ),
              ):Text(
                'Vägskyltar',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 12,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/process.png')),
              title:widget.isArabic? Text(
                'خطوات التقديم',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 12,
                ),
              ):Text(
                'Tillämpningssteg',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 12,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              title:widget.isArabic? Text(
                'المزيد',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 12,
                ),
              ): Text(
                'Mer',
                style: TextStyle(
                  fontFamily: 'cairo',
                  fontSize: 12,
                ),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.red,
          onTap: _onItemTapped,
          // selectedItemColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
