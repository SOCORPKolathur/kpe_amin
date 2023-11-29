import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Premium_Plan_Combo_Page extends StatefulWidget {
  const Premium_Plan_Combo_Page({Key? key}) : super(key: key);

  @override
  State<Premium_Plan_Combo_Page> createState() => _Premium_Plan_Combo_PageState();
}

class _Premium_Plan_Combo_PageState extends State<Premium_Plan_Combo_Page> {
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
                " Premium Combo-Plan  Page",
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
