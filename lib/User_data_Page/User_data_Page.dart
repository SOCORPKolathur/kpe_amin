import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class User_data_Page extends StatefulWidget {
  const User_data_Page({Key? key}) : super(key: key);

  @override
  State<User_data_Page> createState() => _User_data_PageState();
}

class _User_data_PageState extends State<User_data_Page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: width / 25.77,right:  width / 25.77,
              top: height/61.43),
          child: Text(
            "User List Page",
            style: GoogleFonts.poppins(
                fontSize: width / 57.57,
                color: const Color(0xff000000)),
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
                    width: 200,
                    child: Text(
                      "Plan Name",
                      style:
                      GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 25),
                  child: SizedBox(
                    width: 200,

                    child: Text(
                      "Plan Type",
                      style:
                      GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 50),
                  child: SizedBox(
                    width: 380,
                    child: Text(
                      "Plan No",
                      style:
                      GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
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
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
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

                  var _Userdata=snapshot.data!.docs[index];

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
                                width: 200,
                                height: 40,

                                child: Text(
                                  _Userdata["Name"].toString(),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, left: 25),
                              child: SizedBox(
                                width: 200,
                                height: 40,

                                child: Text(
                                  _Userdata["Phone"].toString(),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, left: 50),
                              child: SizedBox(
                                width: 380,
                                height: 40,

                                child: Text(
                                  _Userdata["Email"].toString(),
                                  style:
                                  GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000)),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, left: 20),
                              child: SizedBox(
                                  width: 60,
                                  height: 40,
                                  child: InkWell(
                                      onTap: (){
                                        ///delete popup
                                        _deletepopup(_Userdata.id);
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
    FirebaseFirestore.instance.collection("Users").doc(id).delete();
  }

}
