import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DashBoard_Page extends StatefulWidget {
  const DashBoard_Page({Key? key}) : super(key: key);

  @override
  State<DashBoard_Page> createState() => _DashBoard_PageState();
}

class _DashBoard_PageState extends State<DashBoard_Page> {

  ///variables
  int Userdoclength=0;
  int Plansdoclength=0;


  bool userdataview=false;


  @override
  void initState() {
    // TODO: implement initState
    UserCountdatafromfirebase();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return userdataview==false?
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        ///dashboard text
        Row(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width / 25.77,top: height/61.43),
              child: Text(
                " DashBoard",
                style: GoogleFonts.poppins(
                    fontSize: width / 57.57,
                    color: const Color(0xff000000)),
              ),
            ),
          ],
        ),

        SizedBox(height: height/41.143,),

        ///card designs
        Row(
          children: [

            ///card design1
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              child:
              Container(
                height: height/4.69,
                width: width/4.017,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors:[Color(0xff6BAAFC),Color(0xff305FEC)])
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            margin: EdgeInsets.only(
                                left:width/136.6,
                                top: height/65.7
                            ),
                            child: SvgPicture.asset("assets/Vector.svg",
                              height:height/13.14,
                              width: width/27.32,
                              color: Colors.white,
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: height/32.85,
                            right:width/68.3,
                          ),
                          child: Column(
                            children: [
                              Text("User Count",style: GoogleFonts.poppins(
                                  fontSize:width/75.88,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),),
                              Container(
                                margin: EdgeInsets.only(right: width/68.3),
                                child: Text(Userdoclength.toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: width/22.76),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


            ///card design2
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              child: Container(
                height: height/4.69,
                width: width/4.017,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors:[Color(0xffEF5E7A),Color(0xffD35385)])
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            margin: const EdgeInsets.only(left:10,top: 10),
                            child: SvgPicture.asset("assets/Vector.svg",
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            )
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20,right: 20,),
                          child: Column(
                            children: [
                              Text("Premium Plans",style: GoogleFonts.poppins(fontSize: 18,
                                  fontWeight: FontWeight.w700,color: Colors.white),),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: Text(Plansdoclength.toString(),style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,fontSize: 60),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


            ///card design3
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
              child: Container(
                height: height/4.69,
                width: width/4.017,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors:[Color(0xffD623FE),Color(0xffA530F2)])
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            margin: const EdgeInsets.only(left:10,top: 10),
                            child: SvgPicture.asset("assets/Vector.svg",
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            )
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20,right: 20,),
                          child: Column(
                            children: [
                              Text("Others",style: GoogleFonts.poppins(fontSize: 18,
                                  fontWeight: FontWeight.w700,color: Colors.white),),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: Text("09",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,fontSize: 60),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height:height/16.425),
        //Users container
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //card-1
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(15) ),
              child: Container(
                height: height/2.0,
                width: width/2.75,
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(15)
                ),
                child: Column(
                  children: [

                    Row(
                      children: [
                        SizedBox(width: width/136.6,),

                        Padding(
                          padding:  EdgeInsets.only(
                              left: width/170.25,
                              top: height/25.26
                          ),
                          child: Text("Users",style: GoogleFonts.poppins(fontSize: 15,fontWeight:FontWeight.w500),),
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.only(top: 20, bottom:10),
                      padding: EdgeInsets.only(left:  width/136.6),
                      child:
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
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {

                                var _Userdata=snapshot.data!.docs[index];

                                return  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${_Userdata["Name"].toString()} - ${_Userdata["Email"].toString()}",style:
                                    GoogleFonts.poppins(fontWeight: FontWeight.w600,
                                        fontSize: 14),),

                                    const Divider(),


                                  ],);

                              },);
                        },
                      ),
                    ),


                    TextButton(onPressed: (){
                      setState(() {
                        userdataview=!userdataview;
                      });
                    },
                        child:Text("View More",style: GoogleFonts.poppins(
                        color: const Color(0xff3751FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),))

                  ],
                ),
              ),
            ),




            /*Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //card 2
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: height/3.285,
                    width: width/2.75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 29,top: 12,),
                          child: Text("Inbox",style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,color: const Color(0xff252733)),),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 29),
                              child: Text("Group :",style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,color: const Color(0xff9FA2B4)),),
                            ),
                            Text("Support",style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,color: Colors.grey),)
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 29,top: 20,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Waiting For Order id#1234",style: GoogleFonts.poppins(color: const Color(0xff252733),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),),


                              Container(
                                margin: const EdgeInsets.only(right: 29),
                                child: Text('4:39',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,
                                    color: const Color(0xff9FA2B4)
                                ),),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.only(left: 29,top: 10,bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Waiting For Order id#1234",style: GoogleFonts.poppins(color: const Color(0xff252733),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),),
                              Container(
                                margin: const EdgeInsets.only(right: 29),
                                child: Text('11.07',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,
                                    color: const Color(0xff9FA2B4)
                                ),),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: TextButton(
                              onPressed: (){
                              }, child: Text("View more..",style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xff3751FF),
                              fontWeight: FontWeight.w600
                          ),)),
                        )
                      ],
                    ),
                  ),
                ),


                SizedBox(height:height/16.425,),

                //card 3
                Card(
                  color: Colors.white,
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: height/3.35,
                    width: width/2.75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          margin: const EdgeInsets.only(top: 21,left: 29,bottom: 21),
                          child: Text("Customer Support",style: GoogleFonts.poppins(
                              color: const Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),),
                        ),


                        Container(
                          margin: const EdgeInsets.only(left: 29,bottom: 30),
                          width: width/3.38,
                          child: Text("Ask you query , place requests or important issues. Our support team will contact 24/7 to you. ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffBFBFBF),
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),),
                        ),


                        //buttons
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left:29),
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Container(
                                    width: width/10.67,
                                    height: height/16.425,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffC3DFFA),
                                        borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height/36.5,
                                          width: width/68.3,
                                          decoration: const BoxDecoration(),
                                        ),
                                        Text("Connect now",style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xff1A6BBA)
                                        ),)

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                                width: width/10.67,
                                height: height/16.425,
                                margin: const EdgeInsets.only(left:39),
                                child: Text("Terms & ServicesPrivacy Policy",style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffB9B9B9)
                                ),)
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )*/
          ],
        )



      ],
    ):
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: width / 55.77,right:  width / 25.77,top:height/30.571
          ),
          child: Row(
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      userdataview=false;
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
                "User List Page",
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


  ///user count and plans count fucntion

UserCountdatafromfirebase()async{
    var User_Docuemnt=await FirebaseFirestore.instance.collection("Users").get();
    var Plan_Docuemnt=await FirebaseFirestore.instance.collection("Premium_Plans").get();
    setState(() {
      Userdoclength=User_Docuemnt.docs.length;
    });
    setState(() {
      Plansdoclength=Plan_Docuemnt.docs.length;
    });
}


///user data functions

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
