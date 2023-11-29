
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class Slider_IMage_Sencondary_Page extends StatefulWidget {
  const Slider_IMage_Sencondary_Page({Key? key}) : super(key: key);

  @override
  State<Slider_IMage_Sencondary_Page> createState() => _Slider_IMage_Sencondary_PageState();
}

class _Slider_IMage_Sencondary_PageState extends State<Slider_IMage_Sencondary_Page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: width / 25.77,top: height/61.43),
            child: Text(
              "Agent Training Posts",
              style: GoogleFonts.poppins(
                  fontSize: width / 57.57,
                  color: const Color(0xff000000)),
            ),
          ),
          SizedBox(height: height/41.143,),


           SizedBox(height: height/65.1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              InkWell(
                onTap: (){
                  uploadToStorage();

                },
                child: Container(
                  height: height/21.7,
                  width: width/10.5076,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color(0xff263646)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add,color: Colors.white,),
                       SizedBox(width: width/683,),
                      Text("Add Images",style: GoogleFonts.poppins(fontWeight:
                      FontWeight.w600,color: Colors.white),),
                    ],
                  ),
                ),
              ),
               SizedBox(width: width/91.066,),


            ],
          ),
           SizedBox(height: height/65.1,),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("slider2").snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData==null){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator(),);
              }
              return
                GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio:25/10.8,
                  ) ,
                  physics:const  ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var docs=snapshot.data!.docs[index];

                    return  Padding(
                      padding:  EdgeInsets.symmetric(
                          vertical: height/81.375,
                          horizontal: width/170.75
                      ),
                      child: Material(
                        elevation: 18,
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white54,
                        shadowColor: Colors.black12,
                        child: Container(
                          height: height/6.51,
                          width: width/3.9028,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white54,
                          ),
                          child: Row(
                            children: [
                               SizedBox(width: width/68.3,),

                              Container(
                                height: height/3.255,
                                width: width/6.83,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(docs['urls'].toString())
                                    )
                                ),
                              ),
                               SizedBox(width: width/68.3,),

                              InkWell(
                                onTap: (){
                                  _catogory2(docs.id);
                                },
                                child: Container(
                                    height: height/21.7,
                                    width: width/13.66,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Delete",style: GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                        ),
                                         SizedBox(width: width/455.333,),
                                        const Icon(Icons.delete,color: Colors.black,),
                                      ],
                                    )),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },);
            },
          ),
        ],
      );

  }

  ///delete popup
  String deletefile="https://assets5.lottiefiles.com/packages/lf20_tqsLQJ3Q73.json";

  _catogory2(docid){

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    showDialog(context: context, builder:(context) {
      return Padding(
        padding:  EdgeInsets.only(top: height/4.34,bottom: height/4.34,left: width/3.9028,right:width/3.9028),
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height:height/21.7),
                Text("Are You Sure Want to Delete",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize:18
                ),),

                 SizedBox(height:height/32.55),

                SizedBox(
                  height:height/3.6166,
                  width:width/7.5888,
                  child: Lottie.network(deletefile),
                ),

                 SizedBox(height:height/32.55),

                InkWell(
                  onTap: (){
                    deletedocument(docid);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height:height/16.275,
                    width:width/7.5888,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff263646)
                    ),
                    child: Center(
                      child: Text("Okay",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      );
    },);
  }

  ///document Create function
  createdoc(){
    FirebaseFirestore.instance.collection("slider2").doc().set({
      "urls":imgUrl,
    });
  }


  ///delete document function

  deletedocument(ID){
    FirebaseFirestore.instance.collection("slider2").doc(ID).delete();

  }

  ///Image Picke Function
  String fileName = const Uuid().v1();
  String imgUrl="";
  uploadToStorage() async {
    InputElement input = FileUploadInputElement() as InputElement
      ..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('Images').child(file.name).putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });

        if(imgUrl!=""){
          createdoc();
          showdialog("Slider Image Add Successfully");

        }

      });
    });

  }

  ///save popup
  showdialog(contenttitle) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: height / 2.2,
            width: width / 2.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color(0xff263646),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height / 25.2,
                ),
                Text(
                  contenttitle.toString(),
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: width / 54),
                ),
                SizedBox(
                  height: height / 50.4,
                ),
                SizedBox(
                  height: height / 5.04,
                  width: width / 2.4,
                  child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_xwmj0hsk.json"),
                ),
                SizedBox(
                  height: height / 50.4,
                ),
                InkWell(
                  onTap: () {

                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height / 18.9,
                    width: width / 5.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Okay",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
