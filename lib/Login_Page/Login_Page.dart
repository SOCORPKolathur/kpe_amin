import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Landing_Screen/Landing_Screen.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {


  TextEditingController Username=TextEditingController();
  TextEditingController Password=TextEditingController();
  bool obsecure=false;

  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: const Color(0xff263646),
      body:
      Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 15,
          color: const Color(0xffE5E5E5),
          child: Container(
            height: height/1.095,
            width: width/3.415,
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                //app logo images
                Container(
                  height:height/4.38,
                  width: width/9.10,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/KPE LOGO.png"))
                  ),
                ),

                //Text 1
                Text("Log in to Admin",style: GoogleFonts.mulish(fontSize: 24,fontWeight: FontWeight.w700),),

                //Text 2
                Text("Dashboard",style: GoogleFonts.mulish(fontSize: 24,fontWeight: FontWeight.w700),),

                 SizedBox(height: height/6.51,),
                //text3 email and password
                //email text and text field
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Username",style: GoogleFonts.mulish(color: const Color(0xff9FA2B4),fontWeight: FontWeight.w400),),
                    ),
                  ],
                ),
                //textfiels email
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: Username,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Username",
                        hintStyle: GoogleFonts.mulish(color: const Color(0xff9FA2B4),fontWeight: FontWeight.w400)),

                  ),
                ),

                //password text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Password",style: GoogleFonts.mulish(color: const Color(0xff9FA2B4),fontWeight: FontWeight.w400),),
                    ),


                  ],
                ),

                //password textfield

                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    obscureText: obsecure,
                    controller: Password,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            obsecure=!obsecure;
                          });

                        }, icon:const Icon(Icons.remove_red_eye_outlined,)),
                        hintStyle: GoogleFonts.mulish(color: const Color(0xff9FA2B4),fontWeight: FontWeight.w400)),
                    onSubmitted: (_){
                      if(Password.text=="admin@123"&&Username.text=="admin"){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LandinG_Screen(),));
                      }
                    },
                  ),
                ),

                //log in Button
                GestureDetector(
                  onTap: (){
                    if(Password.text=="admin@123"&&Username.text=="admin"){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LandinG_Screen(),));
                    }
                  },
                  child: Container(
                    height: height/13.14,
                    margin: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff3751FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("Log in",
                        style: GoogleFonts.mulish(
                            color: const Color(0xffFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
