import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:lottie/lottie.dart';

class Notification_Page extends StatefulWidget {
  const Notification_Page({Key? key}) : super(key: key);

  @override
  State<Notification_Page> createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {
  
  TextEditingController TitleController=TextEditingController();
  TextEditingController ContentController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return
      Scaffold(
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height/131.4,),

            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: width / 25.77,top: height/61.43),
                  child: Text(
                    " Notifications",
                    style: GoogleFonts.poppins(
                        fontSize: width / 57.57,
                        color: const Color(0xff000000)),
                  ),
                ),
              ],
            ),

            SizedBox(height: height/91.4,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: width/35.55),
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.black12,
                    color: Color(0xff263646),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Container(
                      width: width/2.168,
                      padding: EdgeInsets.only(
                          top: height/13.14,
                          bottom: height/13.14,
                          left: width/27.32,
                          right:width/27.32
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                child: Container(
                                  width: width/2.7,
                                  height: height/13.14,
                                  child: TextField(
                                    controller: TitleController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: width/68.3),
                                        hintText: "Title"
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                          SizedBox(height:height/65.7,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: width/151.7,),
                              Card(
                                child: Container(
                                  width: width/2.7,
                                  height: height/13.14,
                                  child: TextField(
                                    controller: ContentController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: width/68.3),
                                        hintText: "Content"
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: height/65.7,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(width: width/136.6,),

                              Padding(
                                padding:  EdgeInsets.only(
                                  left: width/170.75,
                                  right:  width/170.75,
                                  top: height/82.125,
                                  bottom: height/82.125,
                                ),


                              ),

                              SizedBox(width: width/136.6,),

                            ],
                          ),
                          SizedBox(height: height/65.7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  allusersdata();
                                  sendnowpopuop();
                                }, child: Container(
                                color: Colors.white,
                                  child: Padding(
                                  padding:  EdgeInsets.only(

                                      left: width/170.75,
                                      right: width/170.75,
                                      top: height/82.125,
                                      bottom:height/82.125
                                  ),
                                  child: Text("Submit",style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                     color: Colors.black
                                  ),),
                              ),
                                ),

                              ),
                              SizedBox(width: width/136.6,),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

             
              ],
            )

          ],
        ),

      );
  }
  
  
  allusersdata()async{
    var userdata=await FirebaseFirestore.instance.collection("Users").get();
    for(int i=0;i<userdata.docs.length;i++){
      FirebaseFirestore.instance.collection("Users").doc(userdata.docs[i].id).collection("Messages").doc().set({
        "Title":TitleController.text,
        "Content":ContentController.text,
        "Read":false,
        "timestamp":DateTime.now().millisecondsSinceEpoch,
      });
      print(userdata.docs[i]['fcm_token']);
      print("FCmToken--------------------------------");
      sendPushMessagefirebase(userdata.docs[i]['fcm_token'],ContentController.text,TitleController.text);
    }


  }

  Future<bool> sendPushMessagefirebase(String token, String body, String title) async {
    bool isSended = false;
    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
          'key=AAAAsjkTLd4:AAAA-Y97X3I:APA91bGTXqDGT_wsoVv9aFmxMmRwuA-WVBakP5mbugEiVh2rqrb3rv7aWj72brel_V1PjBnpv-P_3iCciWzNxMJhvNI1lZXsW31AccVRAY4U2caF_uyz-ABQTLMJ7vih8H0Orkd86e10',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': body, 'title': title},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSended = true;
        Messagefunc();
      } else {
        isSended = false;
      }
    } catch (e) {
    }
    return isSended;
  }

  Messagefunc(){

  FirebaseFirestore.instance.collection("Messages").doc().set({
    "Title":TitleController.text,
    "Content":ContentController.text,
    "Read":false,
    "timestamp":DateTime.now().millisecondsSinceEpoch,
  });
  setState(() {
    TitleController.clear();
    ContentController.clear();
  });
  
}

  sendnowpopuop() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(
              left: width / 4.268,
              right: width / 2.845,
              top: height / 4.106,
              bottom: height / 4.106),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF3E8FF),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height / 16.425,
              ),
              SizedBox(
                height: height / 3.750,
                width: width / 11.383,
                child: Lottie.network(
                    "https://assets8.lottiefiles.com/private_files/lf30_nsqfzxxx.json"),
              ),
              SizedBox(
                height: height / 54.75,
              ),
              Text(
                "Message Send Successfully....",
                style: GoogleFonts.poppins(
                    fontSize: width / 77.613,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(
                height: height / 82.1250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //cancel button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 23.464,
                      width: width / 11.383,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: width / 106.718),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: width / 34.15,
                  ),

                  //okay button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 23.464,
                      width: width / 11.383,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                            "Okay",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: width / 106.718),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: width / 34.15,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }


}
