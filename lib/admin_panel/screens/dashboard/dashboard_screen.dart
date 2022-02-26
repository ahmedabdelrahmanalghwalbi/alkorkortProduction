import 'package:korkort/admin_panel/responsive.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'components/my_fiels.dart';
import 'components/recent_files.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
           Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
//                      MyFiels(),
//                      SizedBox(height: defaultPadding),
//                      RecentFiles(),
                      Column(
                        children: [
                          Container(child: Image.asset("assets/dashboard_icons/logo.png",fit: BoxFit.contain,),
                            width: MediaQuery.of(context).size.width/2,
                            height: MediaQuery.of(context).size.height/2,
                          ),
                          Container(
//                            color: Colors.red,
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Text("لوحة التحكم",style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                                ),),
                                Text("kontrollbord",style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                ),),
                              ],
                            ),
                          )
                        ],
                      ),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
//                      if (Responsive.isMobile(context)) StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
//                if (!Responsive.isMobile(context))
//                  Expanded(
//                    flex: 2,
//                    child: StarageDetails(),
//                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
