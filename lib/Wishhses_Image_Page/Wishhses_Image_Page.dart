import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

class Wishhses_Image_Page extends StatefulWidget {
  const Wishhses_Image_Page({Key? key}) : super(key: key);

  @override
  State<Wishhses_Image_Page> createState() => _Wishhses_Image_PageState();
}

List<String> Typelist=[
  "Type",
  "Anniversary",
  "Birthday",
  "Festival",
  "General Posters",
  "Policies Advertisment",
  "Thank you"
];
class _Wishhses_Image_PageState extends State<Wishhses_Image_Page> {

  TextEditingController Typecontroller=TextEditingController();

  ///state change boolean variable
  bool _changePage=false;


  String viewimagevalue="";
  bool viewphotovalue=false;

  String Typedropdownvalue="Type";






  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      viewphotovalue==false && _changePage==false?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///Tittle Text
          Padding(
            padding:  EdgeInsets.only(left: width / 25.77,right:  width / 25.77,
                top: height/61.43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wishes Page",
                  style: GoogleFonts.poppins(
                      fontSize: width / 57.57,
                      color: const Color(0xff000000)),
                ),
                GestureDetector(

                  onTap: (){
                    setState(() {
                      _changePage=true;
                    });
                  },
                  child: Container(
                    width: width / 13.6,
                    height: height / 16.42,
                    //color: Color(0xffD60A0B),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff57375D),
                    ),
                    child: Center(
                        child: Text(
                          "View",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: width / 91.066),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height/41.143,),

          ///name and text-field
          Row(
            children: [
              ///Type  name
              Padding(
                padding: EdgeInsets.only(
                    top: height / 65.7, left: width / 25.77),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Type",
                      style: GoogleFonts.poppins(
                          fontSize: width / 97.57,
                          color: const Color(0xff000000)),
                    ),
                    SizedBox(height: height/41.143,),

                    Container(
                      width: width / 6.5,
                      height: height / 16.42,
                      //color: Color(0xffDDDEEE),
                      decoration: BoxDecoration(
                          color: const Color(0xffDDDEEE),
                          borderRadius: BorderRadius.circular(4)),
                      child:
                      DropdownButton2<String>(
                        value: Typedropdownvalue,
                        isExpanded: true,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width / 105.07),
                        underline: Container(
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            Typedropdownvalue = value!;
                            Typecontroller.text = value;
                          });
                             print(Typecontroller.text);
                        },

                        items: Typelist.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20,),


              ///image show container
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
                          image: imgUrl!=null?
                          DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                MemoryImage(Uint8List.
                              fromList(base64Decode(imgUrl!.split(",").last)))
                          ):null
                      ),
                      child: Center(
                          child:  Icon(
                            Icons.add,
                            color: const Color(0xffa3c9e2),
                            size: width / 34.15,
                          ))),
                ),
              ),







            ],
          ),


          SizedBox(height: height/8.228,),

          ///submit button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              GestureDetector(

                onTap: (){

                  ///image upload function from firebase
                  uploadimagedunction();

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
              const SizedBox(width: 50,),
            ],
          )
        ],
      ):
      viewphotovalue==true&&viewimagevalue!=""?
          Column(
            children: [
              const SizedBox(height: 25,),
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          viewimagevalue="";
                          viewphotovalue=false;
                        });
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(100),
                        shadowColor: Colors.indigo,
                        color: Colors.grey.shade400,
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(Icons.arrow_back,color: Colors.white,)),
                      )),
                ],
              ),
              SizedBox(

                height: 500,
                width: 500,
                child: Image.network(viewimagevalue,fit: BoxFit.cover,),


              ),
            ],
          ):

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:  EdgeInsets.only(left: width / 55.77,top: height/61.43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                GestureDetector(
                    onTap: (){
                      setState(() {
                        _changePage=false;
                        viewphotovalue=false;
                      });
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(100),
                      shadowColor: Colors.indigo,
                      color: Colors.grey.shade400,
                      child: const SizedBox(
                          height: 30,
                          width: 30,
                          child: Icon(Icons.arrow_back,color: Colors.white,)),
                    )),
                const SizedBox(width: 10,),

                Text(
                  "Wishes Image View Page",
                  style: GoogleFonts.poppins(
                      fontSize: width / 57.57,
                      color: const Color(0xff000000)),
                ),
              ],
            ),
          ),
          SizedBox(height: height/41.143,),
          Material( color: const Color(0xffd8e6ff),
            elevation: 20,
            shadowColor: Colors.black12,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:  const Color(0xffd8e6ff),
              ),
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: SizedBox(
                      width: 100,

                      child: Text(
                        "Si.No",
                        style:
                        GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20, right: 65),
                    child: SizedBox(
                      width: 600,
                      child: Text(
                        "Name",
                        style:
                        GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 200),
                    child: SizedBox(
                      width: 60,
                      child: Text(
                        "Delete",
                        style:
                        GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: height/41.143,),

          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("WishesImage").orderBy("type",descending: false).snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData==null){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator(),);
              }
              return
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {

                    var _wishesdata=snapshot.data!.docs[index];

                    return Padding(
                      padding:  const EdgeInsets.only(bottom: 8.0),
                      child: Material( color: const Color(0xffd8e6ff),
                        elevation: 20,
                        shadowColor: Colors.black12,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color:  const Color(0xffd8e6ff),
                          ),
                          child: Row(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, left: 20),
                                child: SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: Text(
                                    (index+1).toString(),
                                    style:
                                    GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, top: 20, right: 65),
                                child: SizedBox(
                                  width: 600,
                                  height: 40,
                                  child: Row(
                                    children: [
                                      Text(
                                        _wishesdata["type"].toString(),
                                        style:
                                        GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                                      ),
                                      const SizedBox(width: 20,),

                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            viewimagevalue=_wishesdata["img"].toString();
                                            viewphotovalue=true;
                                          });
                                        },
                                        child: Image.network(_wishesdata["img"].toString(),
                                          height: 40,
                                          width: 40,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, left: 200),
                                child: SizedBox(
                                    width: 60,
                                    height: 40,
                                    child: InkWell(
                                        onTap: (){
                                          ///delete popup
                                          _deletepopup(_wishesdata.id);
                                        },

                                        child: const Icon(Icons.delete))
                                ),
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


  ///document create from firebase create function
  wishesdatacreatefunction()  {
    FirebaseFirestore.instance.collection("WishesImage").doc().set({
      "img":Uploadimage,
      "type":Typecontroller.text,
    });
     clear();
  }

  ///image upload function

  String fileName = const Uuid().v1();
  var imgUrl;
  String Uploadimage='';

  File ?Pickimage;
  FirebaseStorage fs = FirebaseStorage.instance;

  uploadToStorage() async {
    InputElement input = FileUploadInputElement() as InputElement
      ..accept = 'image/*';
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

    if(Pickimage!=null){
      var snapshot = await fs.ref().child('Wishes').child(Pickimage!.name).putBlob(Pickimage);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        Uploadimage=downloadUrl;
      });
      ///document create function
      wishesdatacreatefunction();
      ///save popup
      showdialog("Saved Successfully");
    }

  }



  ///controller clear function
  clear(){
    setState(() {
      Typecontroller.clear();
      Uploadimage="";
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
    FirebaseFirestore.instance.collection("WishesImage").doc(id).delete();
  }








}
