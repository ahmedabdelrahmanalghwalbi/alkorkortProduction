import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:korkort/admin_panel/screens/educational_videos/educational_videos.dart';
import 'package:korkort/admin_panel/screens/get_delete_examB/get_delete_examB.dart';
import 'package:korkort/admin_panel/screens/get_delete_examC/get_delete_examC.dart';
import 'package:korkort/admin_panel/screens/public_information_B/public_info_B.dart';
import 'package:korkort/admin_panel/screens/public_information_C/public_info_C.dart';
import 'package:korkort/admin_panel/screens/problem_box/problem_box.dart';
import 'package:korkort/admin_panel/screens/settings/dashboard_settings.dart';
import 'package:korkort/admin_panel/screens/traffic_signs/traffic_sign_home.dart';
import 'package:korkort/admin_panel/screens/users/users.dart';
import 'package:korkort/quiz//views/create_quiz.dart' as quiz1;
import 'package:korkort/quiz2/views/create_quiz.dart' as quiz2;
import 'package:korkort/admin_panel/screens/company_advertisments/comany_advertisment.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/dashboard_icons/logo.png"),
            ),
            DrawerListTile(
              title: "(Användare)المستخدمين",
              svgSrc: "assets/dashboard_icons/menu_profile.svg",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Users()));
              },
            ),
            DrawerListTile(
              title: "شواخص المرور (Vägskyltar)",
              svgSrc: "assets/dashboard_icons/menu_task.svg",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TrafficSignsHome()));
              },
            ),
            DrawerListTile(
              title: "فيديوهات تعليمية (pedagogiska videor)",
              svgSrc: "assets/dashboard_icons/menu_task.svg",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EducationalVideos()));
              },
            ),
            DrawerListTile(
              title: "(Tester B)أختبارات B",
              svgSrc: "assets/dashboard_icons/menu_doc.svg",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>quiz1.CreateQuiz()));
              },
            ),
            DrawerListTile(
              title: " B عرض و حذف أختبارات (Visa och ta bort tester B)",
              svgSrc: "assets/dashboard_icons/menu_doc.svg",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>GetAndDeleteBExams()));
              },
            ),
            DrawerListTile(
              title: "(Allmän information B) المعلومات العامة B",
              svgSrc: "assets/dashboard_icons/menu_doc.svg",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>PublicInformationB()));
              },
            ),
            DrawerListTile(
              title: "(Tester C)أختبارات C",
              svgSrc: "assets/dashboard_icons/menu_doc.svg",
              press: () {
                Navigator.push(
              context, MaterialPageRoute(builder: (context) =>quiz2.CreateQuiz()));
              },
            ),
            DrawerListTile(
              title: " C عرض و حذف أختبارات (Visa och ta bort tester C)",
              svgSrc: "assets/dashboard_icons/menu_doc.svg",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>GetAndDeleteCExams()));
              },
            ),
            DrawerListTile(
              title: "(Allmän information C) المعلومات العامة C",
              svgSrc: "assets/dashboard_icons/menu_doc.svg",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>PublicInformationC()));
              },
            ),
            DrawerListTile(
              title: "أعلن لدينا (Annonsera med oss)",
              svgSrc: "assets/dashboard_icons/menu_notification.svg",
              press: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>CompanyAdvertisments()));
              },
            ),
            DrawerListTile(
              title: "(Klagomål)صندوق الشكاوي",
              svgSrc: "assets/dashboard_icons/menu_notification.svg",
              press: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ProblemsBox()));
              },
            ),

//            DrawerListTile(
//              title: "Settings",
//              svgSrc: "assets/icons/menu_setting.svg",
//              press: () {},
//            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
