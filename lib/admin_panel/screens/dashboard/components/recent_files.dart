//import 'package:korkort11/admin_panel/models/RecentFile.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//
//import '../../../constants.dart';
//
//class RecentFiles extends StatelessWidget {
//  const RecentFiles({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.all(defaultPadding),
//      decoration: BoxDecoration(
//        color: secondaryColor,
//        borderRadius: const BorderRadius.all(Radius.circular(10)),
//      ),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: [
//          Text(
//            "الأختبارات",
//            style: Theme.of(context).textTheme.subtitle1,
//          ),
//          Padding(
//            padding: EdgeInsets.all(20),
//            child: Container(
//              width: double.infinity,
//              child: Column(
//                children: [
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: TextFormField(
//                      decoration: InputDecoration(
//                        hintText: "أدخل عنوان الأمتحان",
//                        prefixIcon: Icon(Icons.message,color: Colors.white,),
//                        fillColor: Colors.blue,
//                        filled: true,
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.yellow),
//                          borderRadius: BorderRadius.circular(15),
//                        )
//                      ),
//                    ),
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: TextFormField(
//                      decoration: InputDecoration(
//                          hintText: "أدخل وصف الأمتحان",
//                          fillColor: Colors.blue,
//                          prefixIcon: Icon(Icons.description,color: Colors.white,),
//                          filled: true,
//                          border: OutlineInputBorder(
//                            borderSide: BorderSide(color: Colors.yellow),
//                            borderRadius: BorderRadius.circular(15),
//                          )
//                      ),
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.all(20.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
//                        Container(
//                          width: 100,
//                          height: 70,
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(15),
//                            border: Border.all(color: Colors.blue)
//                          ),
//                          child: Center(
//                            child: Text("أضافة سؤال",style: TextStyle(
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              letterSpacing: 2
//                            ),),
//                          ),
//                        ),
//                        Container(
//                          width: 100,
//                          height: 70,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15),
//                              border: Border.all(color: Colors.blue)
//                          ),
//                          child: Center(
//                            child: Text("حسنا",style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                letterSpacing: 2
//                            ),),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
//
//DataRow recentFileDataRow(RecentFile fileInfo) {
//  return DataRow(
//    cells: [
//      DataCell(
//        Row(
//          children: [
//            SvgPicture.asset(
//              fileInfo.icon,
//              height: 30,
//              width: 30,
//            ),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//              child: Text(fileInfo.title),
//            ),
//          ],
//        ),
//      ),
//      DataCell(Text(fileInfo.date)),
//      DataCell(Text(fileInfo.size)),
//    ],
//  );
//}
