import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:korkort/quiz/views/home.dart';

class Home7 extends StatefulWidget {
  @override
  _Home7State createState() => _Home7State();
}

class _Home7State extends State<Home7> {
  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context ) {
      // set up the button
      Widget okButton(var color ,var label){
        return ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          }, child: Center(
          child: Text(label,style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "cairo"
          ),textAlign: TextAlign.center,),
        ), style: ElevatedButton.styleFrom(
          primary: color,
        ),
        );}

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("هل تريد اكمال الأمتحان ؟",style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo"
        ),textAlign: TextAlign.center,),
        content:Container(
          height: MediaQuery.of(context).size.height*.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("أمتحان أسئلة النظري 3",style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "cairo"
              ),textAlign: TextAlign.end,),
              Text("تم الحفظ: اليوم 2020/5/1",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "cairo"
              ),textAlign: TextAlign.end,),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top:10,bottom: 10,left: 20,right: 20),
            child: Row(
              children: [
                okButton(Colors.green,"اكمال الأمتحان"),
                SizedBox(width: MediaQuery.of(context).size.width*.05,),
                okButton(Colors.red,"اعادة الأمتحان" )
              ],
            ),
          ),

        ],

      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'امتحانات الاسئلة النظرية الفئة -B',
              style: TextStyle(
                fontFamily: 'cairo',
                fontSize: 16,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:MediaQuery.of(context).size.height*.78,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' الاقسام التي تم انهائها 2/17',
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 16,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.green,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.green,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            showAlertDialog(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Quiz()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.deepOrange[900],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '4',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '6',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '7',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'امتحان اسئلة النظري',
                                    style: TextStyle(
                                      fontFamily: 'cairo',
                                      fontSize: 18,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  Text(
                                    '8',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.08,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Text(
                      'اعلان',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'cairo',
                          fontSize: 18,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(blurRadius: 3, color: Colors.black45)
                          ]),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
