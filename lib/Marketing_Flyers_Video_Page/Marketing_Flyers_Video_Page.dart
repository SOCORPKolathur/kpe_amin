import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

import '../ConstFile.dart';

class Marketing_Flyers_Video_Page extends StatefulWidget {
  const Marketing_Flyers_Video_Page({Key? key}) : super(key: key);

  @override
  State<Marketing_Flyers_Video_Page> createState() => _Marketing_Flyers_Video_PageState();
}

class _Marketing_Flyers_Video_PageState extends State<Marketing_Flyers_Video_Page> {


  TextEditingController videoTitleController=TextEditingController();
  TextEditingController videoSubTitleController=TextEditingController();
  late VideoPlayerController _controller;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Stack(
        alignment: Alignment.center,

        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///Tittle Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: width / 25.77,right:  width / 25.77,
                            top: height/61.43),
                        child:
                        Text(
                          "Marketing Flyers Video Page",
                          style: GoogleFonts.poppins(
                              fontSize: width / 57.57,
                              color: const Color(0xff000000)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height/41.143,),

                  ///Video  container
                  Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Video Title" ,
                              style: GoogleFonts.poppins(
                                  fontSize: width / 87.57,
                                  color: const Color(0xff000000)),
                            ),
                            SizedBox(height: height/65.1,),
                            Container(
                              height: 40,
                              width: 300,
                              decoration: BoxDecoration(
                                color: const Color(0xffe6ebef),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: TextFormField(
                                controller: videoTitleController,
                                decoration: InputDecoration(
                                  border: InputBorder.none
                                ),
                                validator: (value)=>value!.isEmpty?"Field is Empty":null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Video Sub Title" ,
                              style: GoogleFonts.poppins(
                                  fontSize: width / 87.57,
                                  color: const Color(0xff000000)),
                            ),
                            SizedBox(height: height/65.1,),
                            Container(
                              height: 40,
                              width: 300,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xffe6ebef),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: TextFormField(
                                controller: videoSubTitleController,
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                                validator: (value)=>value!.isEmpty?"Field is Empty":null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 25,),


                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Video " ,
                              style: GoogleFonts.poppins(
                                  fontSize: width / 87.57,
                                  color: const Color(0xff000000)),
                            ),
                            SizedBox(height: height/65.1,),
                            InkWell(
                              onTap: () {
                                uploadToStorage();
                              },
                              child: Material(
                                elevation: 20,
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffe6ebef),
                                shadowColor: Colors.grey.shade100,
                                child: Container(
                                    height: height / 8.212,
                                    width: width / 17.075,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(4),
                                      color: const Color(0xffe6ebef),
                                    ),
                                    child: Center(
                                        child:  Icon(
                                          imgUrl!=null?Icons.done:   Icons.add,
                                          color: const Color(0xffa3c9e2),
                                          size: width / 34.15,
                                        ))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 50,),
                        GestureDetector(

                          onTap: (){
                           if( _formKey.currentState!.validate()){
                             ///Video upload function from firebase
                             uploadimagedunction();
                           }

                          },
                          child: Container(
                            width: width / 13.6,
                            height: height / 16.42,
                            //color: Color(0xffD60A0B),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff263646),
                            ),
                            child: Center(
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: width / 91.066),
                                )),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Material(
                    elevation: 25,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    shadowColor: Colors.black12,
                    child: SizedBox(
                      height: 450,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance.collection("Marketting_video").orderBy("timestamp").snapshots(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData==null){
                            return const Center(child: CircularProgressIndicator(),);
                          }
                          if(!snapshot.hasData){
                            return const Center(child: CircularProgressIndicator(),);
                          }
                          return
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  childAspectRatio: 110/50,
                                  crossAxisSpacing: 10
                              ),
                              physics: const ScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {

                                var _marketflyersVideo=snapshot.data!.docs[index];

                                return
                                  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      _controller = VideoPlayerController.networkUrl(Uri.parse(_marketflyersVideo['Url'] ))
                                        ..initialize().then((_) {
                                          _controller.play();
                                          showVideoModel(context);
                                        });
                                    },
                                    child: Material( color: const Color(0xffd8e6ff),
                                      elevation: 20,
                                      shadowColor: Colors.black12,
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color:  const Color(0xffd8e6ff),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,

                                            children: [

                                              SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: Image.network(
                                                  _marketflyersVideo["img"].toString(),

                                                ),
                                              ),

                                              Padding(
                                                padding:  EdgeInsets.only(left: 4),
                                                child: SizedBox(
                                                  width: 100,
                                                  height: 40,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        _marketflyersVideo["title"].toString(),
                                                        style:
                                                        GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000),
                                                        textStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                                                      ),
                                                      Text(
                                                        _marketflyersVideo["subtitle"].toString(),
                                                        style:
                                                        GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000),
                                                            textStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  _deletepopup(_marketflyersVideo.id);
                                                },
                                                child: Icon(Icons.delete),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),

                ],
              ),
            ),
          ),

          Loading==true?Container(
            height: 280,
            width:280,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

            ),
            child: Lottie.asset(LoadingLottie),) :const SizedBox(),

        ],
      );
  }

  ///Video upload function

  String fileName = const Uuid().v1();
  var imgUrl;
  String Uploadimage='';

  File ?Pickimage;
  FirebaseStorage fs = FirebaseStorage.instance;
  bool Loading =false;

  uploadToStorage() async {

    InputElement input = FileUploadInputElement() as InputElement
      ..accept = 'video/*';
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        setState(() {
          Pickimage=file;
          imgUrl=reader.result;
        });
      });
    });


  }

  ///save to the image firebase function
  uploadimagedunction() async {
    setState(() {
      Loading=true;
    });
    if(Pickimage!=null){

      var snapshot = await fs.ref().child('Marketing_video').child(Pickimage!.name).putBlob(Pickimage);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        Uploadimage=downloadUrl;
      });
      ///document create function

      marketvideodatacreatefunction();

      ///save popup
      showdialog("Video Added Successfully");
    }

  }

  ///docuemnt data create function

  marketvideodatacreatefunction(){
    FirebaseFirestore.instance.collection("Marketting_video").doc().set({
      "Url":Uploadimage,
      "date":DateFormat.yMMMMd().format(DateTime.now()),
      "img":MarketingFlyerVideoImage,
      "subtitle":videoSubTitleController.text,
      "timestamp":DateTime.now().millisecondsSinceEpoch,
      "title":videoTitleController.text
    });
    setState(() {
      Uploadimage="";
      Pickimage=null;
      imgUrl=null;
      videoTitleController.clear();
      videoSubTitleController.clear();
      Loading=false;
    });
  }

  ///save  popup
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

  showVideoModel(context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          insetPadding: EdgeInsets.all(12),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height/217,
                      horizontal: width/455.33
                  ),
                  child: Container(
                    height: size.height * 0.8,
                    width: size.width * 0.6,
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ) : Container(),
                  )
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  ///delete popup
  String deletefile="https://assets5.lottiefiles.com/packages/lf20_tqsLQJ3Q73.json";

  _deletepopup(docid){

    showDialog(context: context, builder:(context) {
      return Padding(
        padding: const EdgeInsets.only(top: 150.0,bottom: 150,left: 350,right:350),
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height:30),
                Text("Are You Sure Want to Delete",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize:18
                ),),

                const SizedBox(height:20),

                SizedBox(
                  height:180,
                  width:180,
                  child: Lottie.network(deletefile),
                ),

                const SizedBox(height:20),

                InkWell(
                  onTap: (){
                    deletedocument(docid);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height:40,
                    width:180,
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

  ///delete document
  deletedocument(id){
    FirebaseFirestore.instance.collection("Marketting_video").doc(id).delete();
  }


}
