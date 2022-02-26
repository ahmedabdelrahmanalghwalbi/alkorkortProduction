import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:korkort/view/main_page/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  bool isArabic;
  HomeScreen({this.isArabic});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  int currentValue1 ;
  int currentValue2 ;
  bool isSelected1=false;
  bool isSelected2=false;
  bool isChoose1=true;
  bool isChoose2=true;
  AnimationController _controller;
  Animation _animation ;
  String type ;
  bool darkMood=false;
  getDarkMood()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      darkMood=pref.getBool("darkMood");
    });
  }
  @override
  void initState() {
    super.initState();
    getDarkMood();
    _controller=AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation=Tween<double>(begin: -1.0,end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton =Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          }, child: Center(
          child:widget.isArabic? Text("حسنا",style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: "cairo"
          ),textAlign: TextAlign.center,):Text("Okej",style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: "cairo"
          ),textAlign: TextAlign.center,),
        ), style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        ),
      ],);

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title:widget.isArabic?Text("يجب أختيار لغة الاسئلة",style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,):Text("Språket för testet måste väljas",style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
      ),textAlign: TextAlign.center,),
      content:Container(
        height: MediaQuery.of(context).size.height*.15,
        child: Column(
          children: [
            widget.isArabic?Text("يتم الأختيار عبر الضغط علي 'اختيار اللغة' في يسار الصفحة",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: "cairo"
            ),textAlign: TextAlign.end,):Text("Valet görs genom att trycka på 'Välj språk' till vänster på sidan",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: "cairo"
            ),textAlign: TextAlign.start,),
            widget.isArabic?Text("ملحوظة: لغة الأسئلة هي اللغة اللتي ستقوم بتقديم الأمتحان بها",style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: "cairo"
            ),textAlign: TextAlign.end,):Text("OBS: Språket för frågorna är det språk som du kommer att ta provet på",style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: "cairo"
            ),textAlign: TextAlign.start,),
          ],
        ),
      ),
      actions: [
        okButton
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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: darkMood?Colors.black:Colors.white,
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: width,
          height: height,
          child: Column(
            children: [
              //title
              Expanded(flex: 1,child:  Center(
                child:widget.isArabic?Text(
                      'أختر الفئة التي تريد دراستها',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        fontSize: 20,
                        color: darkMood?Colors.white:Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ):Text(
                  'Välj den kategori du vill studera',
                  style: TextStyle(
                    fontFamily: 'cairo',
                    fontSize: 20,
                    color: darkMood?Colors.white:Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),),
              //list of exams
              Expanded(flex:9,child:Container(child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Opacity(
                    opacity: isChoose1?1:0.4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 1,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                         widget.isArabic? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'للفئة التيوري',
                                style:
                                TextStyle(fontFamily: 'cairo', fontSize: 20),
                              ),
                              Text(
                                '-B',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                ' سؤال 1500   ',
                                style:
                                TextStyle(fontFamily: 'cairo', fontSize: 20),
                              ),
                            ],
                          ): Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(
                               'Kategori',
                               style:
                               TextStyle(fontFamily: 'cairo', fontSize: 20),
                             ),
                             Text(
                               '-B',
                               style: TextStyle(fontSize: 20),
                             ),
                             Text(
                               ' Fråga 1500   ',
                               style:
                               TextStyle(fontFamily: 'cairo', fontSize: 20),
                             ),
                           ],
                         ),
                          SizedBox(height: 5),
                          Container(
                            width: width,
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          GestureDetector(
                            onTap: (){
                              isSelected1?setState(() {
                                isChoose1=true;
                                isChoose2=false;
                                type = "B";
                                _controller.forward();
                              }):showAlertDialog(context);
                            },
                            child: Container(
                              height: height*.2,
                              width: width*.7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/car (1).png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    isSelected1?TextButton(onPressed: (){
                                      setState(() {
                                        isChoose1=true;
                                        isChoose2=false;
                                        type="B";
                                        _controller.forward();
                                      });
                                    }, child:widget.isArabic? Text(
                                      'اختيار',
                                      style: TextStyle(fontFamily: 'cairo',color: Colors.black),
                                    ):Text(
                                      'Urval',
                                      style: TextStyle(fontFamily: 'cairo',color: Colors.black),
                                    ),
                                    )
                                        :TextButton(onPressed: (){
                                      showAlertDialog(context);
                                    }, child:widget.isArabic? Text(
                                      'اختيار',
                                      style: TextStyle(fontFamily: 'cairo',color: Colors.black),
                                    ): Text(
                                      'Urval',
                                      style: TextStyle(fontFamily: 'cairo',color: Colors.black),
                                    ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                  iconSize: 30,
                                  hint:widget.isArabic?Text("أختيار اللغة",style: TextStyle(fontFamily: "cairo"),):Text("Jag väljer språk",style: TextStyle(fontFamily: "cairo"),),
                                  value: currentValue1,
                                  items: [
                                    DropdownMenuItem(
                                      value: 0,
                                      child: Text(
                                        'العربية',
                                        style: TextStyle(fontFamily: 'cairo'),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Text('swedish ',style: TextStyle(
                                          fontFamily: 'cairo',
                                          color: Colors.black
                                      ),),
                                    ),
                                  ].cast<DropdownMenuItem<int>>(),
                                  onChanged: (value) {
                                    setState(() {
                                      currentValue1 = value;
                                      isSelected1=true;
                                    });
                                    print('changed to $value');
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height*.02,),
                  Opacity(
                    opacity:isChoose2?1:0.4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 1,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          widget.isArabic? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' التيوري للفئة ',
                                style:
                                TextStyle(fontFamily: 'cairo', fontSize: 20),
                              ),
                              Text(
                                '-C',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                ' سؤال 2000   ',
                                style:
                                TextStyle(fontFamily: 'cairo', fontSize: 20),
                              ),
                            ],
                          ): Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kategori',
                          style:
                          TextStyle(fontFamily: 'cairo', fontSize: 20),
                        ),
                        Text(
                          '-C',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          ' Fråga 1500   ',
                          style:
                          TextStyle(fontFamily: 'cairo', fontSize: 20),
                        ),
                      ],
                    ),
                          SizedBox(height: 5),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          GestureDetector(
                            onTap: (){
                              isSelected2?setState(() {
                                isChoose1=false;
                                isChoose2=true;
                                type ="C";
                                _controller.forward();
                              }):showAlertDialog(context);
                            },
                            child: Container(
                              height: height*.2,
                              width: width*.7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage('assets/truck.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    isSelected2?TextButton(child:widget.isArabic? Text('اختيار', style: TextStyle(fontFamily: 'cairo',color: Colors.black),):Text('Urval',
                                  style: TextStyle(fontFamily: 'cairo',color: Colors.black),
                                      ),onPressed: (){
                                      setState(() {
                                        isChoose2=true;
                                        isChoose1=false;
                                        type="C";
                                        _controller.forward();
                                      });
                                    },):TextButton(onPressed: (){
                                      showAlertDialog(context);
                                    }, child:widget.isArabic? Text(
                                      'اختيار',
                                      style: TextStyle(fontFamily: 'cairo',color: Colors.black),
                                    ): Text(
                                      'Urval',
                                      style: TextStyle(fontFamily: 'cairo',color: Colors.black),
                                    ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DropdownButton(
                                  iconSize: 30,
                                  value: currentValue2,
                                  hint:widget.isArabic?Text("أختيار اللغة",style: TextStyle(fontFamily: "cairo"),):Text("Jag väljer språk",style: TextStyle(fontFamily: "cairo"),),
                                  items: [
                                    DropdownMenuItem(
                                      value: 0,
                                      child: Text(
                                        'العربية',
                                        style: TextStyle(fontFamily: 'cairo'),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Text('swedish ',style: TextStyle(
                                          fontFamily: 'cairo'
                                      ),),
                                    ),
                                  ].cast<DropdownMenuItem<int>>(),
                                  onChanged: (value) {
                                    setState(() {
                                      currentValue2 = value;
                                      isSelected2=true;
                                    });
                                    print('changed to $value');
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),)),
              //the choose button
              Expanded(flex:2,child:Center(
                child: AnimatedBuilder(animation: _controller, builder:(BuildContext context,Widget child){
                  return Transform(
                    transform:Matrix4.translationValues(_animation.value*width, 0, 0) ,
                    child:Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60, left: 60, bottom: 20),
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
                          width: double.infinity,
                          height: 40,
                          child: MaterialButton(
                            onPressed: ()async {
                              SharedPreferences pref=await SharedPreferences.getInstance();
                              pref.setBool("isArabic", widget.isArabic);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage(type: type,isArabic:widget.isArabic)),
                            );
                            },
                            child:widget.isArabic?Text(
                              'تم الاختيار',
                              style: TextStyle(
                                  fontFamily: 'cairo',
                                  color: Colors.white,
                                  fontSize: 18),
                            ):Text(
                              'vald',
                              style: TextStyle(
                                  fontFamily: 'cairo',
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )),
            ],
          ),
        ),
      )
    );
  }
}
