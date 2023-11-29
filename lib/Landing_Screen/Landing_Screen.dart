
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpe_amin/Marketing_Flyers-Page/Marketing_Flyers-Page.dart';
import 'package:kpe_amin/Premium_Plan_Combo_Page/Premium_Plan_Combo_Page.dart';
import 'package:kpe_amin/Premium_Plan_Page/Premium_Plan_Page.dart';
import 'package:sidebarx/sidebarx.dart';

import '../Agent_Training_Page/Agent_Training_Page.dart';
import '../DasBoard-Page/DashBoard_Page.dart';
import '../Marketing_Flyers_Video_Page/Marketing_Flyers_Video_Page.dart';
import '../Notification_Page/Notification_Page.dart';
import '../Plan_Details_Page/Plan_Details_Page.dart';
import '../Slider-Image-Page/Slide Images.dart';
import '../Slider_IMage_Sencondary_Page/Slider_IMage_Sencondary_Page.dart';
import '../User_data_Page/User_data_Page.dart';
import '../Wishhses_Image_Page/Wishhses_Image_Page.dart';

class LandinG_Screen extends StatefulWidget {
  const LandinG_Screen({Key? key}) : super(key: key);

  @override
  State<LandinG_Screen> createState() => _LandinG_ScreenState();
}

class _LandinG_ScreenState extends State<LandinG_Screen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: const Color(0xff263646),
        title: Row(
          children: [

            const SizedBox(width: 10,),
            Text("KP Enterprises",style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700),),
          ],
        ),
        toolbarHeight: 40,
      ),
      body: Row(
        children: [
          ExampleSidebarX(controller: _controller,),
          Expanded(
            child: Material(
              shadowColor: Colors.black12,
              child: Center(
                child: _ScreensExample(
                  controller: _controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(7),
      child: SidebarX(
        controller: _controller,
        theme: SidebarXTheme(
            iconTheme:const IconThemeData(
                color: Colors.white
            ),
            hoverColor: const Color(0xff9FA2B4),
            itemTextPadding: const EdgeInsets.only(left: 20),
            selectedItemTextPadding:const EdgeInsets.only(left: 20),
            selectedItemDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),

            ),

            selectedIconTheme: const IconThemeData(
              color: Colors.black,
            ),
            selectedTextStyle: GoogleFonts.mulish(color:Colors.black),
            margin: const EdgeInsets.all(8),

            padding:const EdgeInsets.all(8),
            textStyle: GoogleFonts.poppins(
              color: const Color(0xffA7B7DD),),
            decoration: BoxDecoration(
                color: const Color(0xff363740),
                borderRadius: BorderRadius.circular(18)
            ),
            itemPadding: const EdgeInsets.only(right: 20)
        ),
        extendedTheme:  SidebarXTheme(
          width: width/6.83,
          padding: EdgeInsets.only(top:height/32.85),
          margin: EdgeInsets.only(
              top: height/82.125,
              bottom: height/82.125,
              right: width/341.5,
              left: width/341.5
          ),
          decoration: BoxDecoration(
              color: const Color(0xff263646),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        footerDivider: divider,
        items:const [
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Dashboard',
          ),
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Latest Updates',
          ),

          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Training Posts',
          ),
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Premium Plans',
          ),
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Premium Details',
          ),

          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Premium Combo',
          ),
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Marketing Flyers',
          ),
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Marketing Videos',
          ),
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Agent Training',
          ),

          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Users',
          ),
          SidebarXItem(
            icon: Icons.stop_circle_sharp,
            label: 'Notification',
          ),




        ],
      ),
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return const DashBoard_Page();
          case 1:
            return const Slide_Image();
          case 2:
            return const Slider_IMage_Sencondary_Page();
          case 3:
            return const Premium_Plan_Page();
          case 4:
            return const Plan_Details_Page();
          case 5:
            return const Premium_Plan_Combo_Page();
          case 6:
            return const Marketing_Flyers();
          case 7:
            return const Marketing_Flyers_Video_Page();
          case 8:
            return const Agent_Training_Page();

          case 9:
            return const User_data_Page();
          case 10:
            return const Notification_Page();

          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'index 5';
    case 6:
      return 'index 6';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color.fromRGBO(241, 204, 41, 1.0);
const canvasColor = Color.fromRGBO(243, 205, 42, .9);
const scaffoldBackgroundColor = Color.fromRGBO(243, 205, 42, .8);
const accentCanvasColor = Color.fromRGBO(243, 205, 42, .4);
const white = Colors.white;
final actionColor =  const Color.fromRGBO(243, 205, 42, .9).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

// Future<bool> sendPushMessagefirebase(String token, String body, String title) async {
//   bool isSended = false;
//   try {
//     var response = await http.post(
//       Uri.parse('https://fcm.googleapis.com/fcm/send'),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Authorization':
//         'key=AAAAsjkTLd4:APA91bF9m1718V4-RssSRihs7Fwly8H5hbVev7_iM8Yc6fPaWl9WgqLElFOS7PkPXiKm-410_9BK4tIXODRSA7pa4XOOq7u1ITSt32k_VXx3EPgvW3WWpdNTC60-kJ_YtGdbVUWHhIQP',
//       },
//       body: jsonEncode(
//         <String, dynamic>{
//           'notification': <String, dynamic>{'body': body, 'title': title},
//           'priority': 'high',
//           'data': <String, dynamic>{
//             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//             'id': '1',
//             'status': 'done'
//           },
//           "to": token,
//         },
//       ),
//     );
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       isSended = true;
//     } else {
//       isSended = false;
//     }
//   } catch (e) {
//   }
//   return isSended;
// }
