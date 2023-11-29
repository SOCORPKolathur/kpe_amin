import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Plan_Details_Page extends StatefulWidget {
  const Plan_Details_Page({Key? key}) : super(key: key);

  @override
  State<Plan_Details_Page> createState() => _Plan_Details_PageState();
}

class _Plan_Details_PageState extends State<Plan_Details_Page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///Tittle Text
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: width / 25.77,right:  width / 25.77,
                    top: height/61.43),
                child: Text(
                  "Plan Details Page",
                  style: GoogleFonts.poppins(
                      fontSize: width / 57.57,
                      color: const Color(0xff000000)),
                ),
              ),
            ],
          ),
          SizedBox(height: height/41.143,),
        ],
      );
  }
}
