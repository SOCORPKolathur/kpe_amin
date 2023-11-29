import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Premium_Plan_Page extends StatefulWidget {
  const Premium_Plan_Page({Key? key}) : super(key: key);

  @override
  State<Premium_Plan_Page> createState() => _Premium_Plan_PageState();
}

class _Premium_Plan_PageState extends State<Premium_Plan_Page> {

  ///Text Controller

  TextEditingController Plannamecontroller = TextEditingController();
  TextEditingController Plannnumbercontroller = TextEditingController();
  TextEditingController Planntypecontroller = TextEditingController();
  TextEditingController _editpostnamecontrolller = TextEditingController();
  TextEditingController _editpostnumbercontrolller = TextEditingController();
  TextEditingController _editposttypecontrolller = TextEditingController();



  ///state change boolean variable

  bool _changePage=false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return
      _changePage==false?
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding:  EdgeInsets.only(left: width / 25.77,right:  width / 25.77,
              top: height/61.43),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Premium Plan Page",
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


        ///plan name and type and number textfield
        Row(
          children: [
            ///plan name
            Padding(
              padding: EdgeInsets.only(
                  top: height / 65.7, left: width / 25.77),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Plan Name",
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
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: Plannamecontroller,
                      maxLines: null,
                      style: GoogleFonts.poppins(
                          fontSize: width / 136.6),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: width / 68.3,
                            bottom: height / 82.125),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///plan number
            Padding(
              padding: EdgeInsets.only(
                  top: height / 65.7, left: width / 25.77),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Plan Number",
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
                    child: TextField(
                      controller: Plannnumbercontroller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: GoogleFonts.poppins(
                          fontSize: width / 136.6),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: width / 68.3,
                            bottom: height / 82.125),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///plan type
            Padding(
              padding: EdgeInsets.only(
                  top: height / 65.7, left: width / 25.77),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plan Type",
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
                    child: TextField(
                      controller: Planntypecontroller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: GoogleFonts.poppins(
                          fontSize: width / 136.6),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: width / 68.3,
                            bottom: height / 82.125),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
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
                ///document create function
                documentdatacrete();
                ///save popup
                showdialog("Plans Saved Successfully");
              },
              child: Container(
                width: width / 13.6,
                height: height / 16.42,
                //color: Color(0xffD60A0B),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD60A0B),
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
             SizedBox(width: width/27.32,),
          ],
        )

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
                      });
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(100),
                      shadowColor: Colors.indigo,
                      color: Colors.grey.shade400,
                      child:  SizedBox(
                          height: height/21.7,
                          width: width/45.533,
                          child: Icon(Icons.arrow_back,color: Colors.white,)),
                    )),
                 SizedBox(width: width/136.6,),

                Text(
                  " Premium Plan View Page",
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
              height: height/13.02,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color:  const Color(0xffd8e6ff),
              ),
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: height/32.55, left: width/68.3),
                    child: SizedBox(
                      width: width/13.66,

                      child: Text(
                        "Si.No",
                        style:
                        GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: width/91.066, top: height/32.55, right: width/21.0153),
                    child: SizedBox(
                      width: width/5.939,
                      child: Text(
                        "Plan Name",
                        style:
                        GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: height/32.55, left: width/54.64),
                    child: SizedBox(
                      width: width/9.1066,
                      child: Text(
                        "Plan Type",
                        style:
                        GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: height/32.55, left: width/6.83),
                    child: SizedBox(
                      width: width/22.766,
                      child: Text(
                        "Plan No",
                        style:
                        GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: height/32.55, left: width/6.83),
                    child: SizedBox(
                      width: width/22.766,
                      child: Text(
                        "Delete",
                        style:
                        GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                      ),
                    ),
                  ),






                ],
              ),
            ),
          ),
          SizedBox(height: height/41.143,),

          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Premium_Plans").snapshots(),
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

                      var _premimunplans=snapshot.data!.docs[index];

                    return Padding(
                      padding:   EdgeInsets.only(bottom: height/81.375),
                      child: Material( color: const Color(0xffd8e6ff),
                        elevation: 20,
                        shadowColor: Colors.black12,
                        child: Container(
                          height: height/13.02,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color:  const Color(0xffd8e6ff),
                          ),
                          child: Row(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Padding(
                                padding:  EdgeInsets.only(top: height/32.55, left: width/68.3),
                                child: SizedBox(
                                  width: width/13.66,
                                  height: height/16.275,
                                  child: Text(
                                    (index+1).toString(),
                                    style:
                                    GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                                  ),
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: width/91.066, top: height/32.55, right: width/21.0153),
                                child: SizedBox(
                                  width: width/5.939,
                                  height: height/16.275,
                                  child: Text(
                                    _premimunplans["planname"].toString(),
                                    style:
                                    GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                                  ),
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(top: height/32.55, left: width/54.64),
                                child: SizedBox(
                                  width: width/9.1066,
                                  height: height/16.275,
                                  child: Text(
                                      _premimunplans["plantype"].toString(),
                                    style:
                                    GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                                  ),
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(top: height/32.55, left: width/6.83),
                                child: SizedBox(
                                  width: width/22.766,
                                  height: height/16.275,
                                  child: Text(
                                      _premimunplans["planno"].toString(),
                                    style:
                                    GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                                  ),
                                ),
                              ),

                               Padding(
                                padding:  EdgeInsets.only(top: height/32.55, left: width/6.83),
                                child: SizedBox(
                                    width: width/22.766,
                                    height: height/16.275,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (){

                                          ///delete popup
                                          _deletepopup(_premimunplans.id);
                                        },

                                          child: const Icon(Icons.delete)),
                                       SizedBox(width: width/113.833,),

                                      InkWell(
                                          onTap: (){

                                            ///edit item popup
                                            editditem(_premimunplans.id) ;

                                          },

                                          child: const Icon(Icons.edit)),
                                    ],
                                  )
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
  
  ///document create function

documentdatacrete(){
    FirebaseFirestore.instance.collection("Premium_Plans").doc().set({
      "planname":Plannamecontroller.text,
      "planno":Plannnumbercontroller.text,
      "plantype":Planntypecontroller.text,
    });
    ///clear controller function
    controllerclear();

}

///controller clear function

  controllerclear(){
 setState(() {
   Planntypecontroller.clear();
   Plannamecontroller.clear();
   Plannnumbercontroller.clear();
 });
}


  ///delete popup
  String deletefile="https://assets5.lottiefiles.com/packages/lf20_tqsLQJ3Q73.json";

  _deletepopup(docid){
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    showDialog(context: context, builder:(context) {
      return Padding(
        padding:  EdgeInsets.only(top: height/4.34,bottom: height/4.34,left: width/3.902,right:width/3.902),
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height:height/21.7),
                Text("Are You Sure Want to Delete",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: width/75.888
                ),),

                 SizedBox(height:height/68.3),

                SizedBox(
                  height:height/3.6166,
                  width:width/7.588,
                  child: Lottie.network(deletefile),
                ),

                SizedBox(height:height/68.3),

                InkWell(
                  onTap: (){
                    deletedocument(docid);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height:height/  16.275,
                    width:width/7.588,
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
    FirebaseFirestore.instance.collection("Premium_Plans").doc(id).delete();
  }


  ///update document data
  upadtedocument(docid){
    FirebaseFirestore.instance.collection("Premium_Plans").doc(docid).set({
      "planname":_editpostnamecontrolller.text,
      "planno":_editpostnumbercontrolller.text,
      "plantype":_editposttypecontrolller.text,
    });
    setState(() {
      _editpostnamecontrolller.clear();
      _editpostnumbercontrolller.clear();
      _editposttypecontrolller.clear();
    });
  }

  ediditemsetvaluefunction(docid)async{
    var getdatae=await FirebaseFirestore.instance.collection("Premium_Plans").doc(docid).get();
    Map<String,dynamic>?value=getdatae.data();
    setState(() {
      _editpostnamecontrolller.text=value!['planname'];
      _editpostnumbercontrolller.text=value['planno'];
      _editposttypecontrolller.text=value['plantype'];
    });
  }


  ///edit popup
  editditem(docid) {
    ediditemsetvaluefunction(docid);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: height / 5.0,
              bottom: height / 5.0,
              left: width / 3.415,
              right: width / 3.415),
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height / 21.9),
                  Text(
                    "Are You Sure Want To Edit this Item ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700, fontSize: width / 68.3),
                  ),
                  SizedBox(height: height / 32.85),

                  /// plan name edit textdield
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plan Name",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: height / 131.4),
                          Container(
                              height: height / 16.425,
                              width: width / 6.209,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.cyan),
                              child: TextField(
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                                controller: _editpostnamecontrolller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: width / 136.6, bottom: height / 65.7)),
                              )),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height / 32.85),

                  ///plan no edit textdield
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plan Number",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: height / 131.4),
                          Container(
                              height: height / 16.425,
                              width: width / 6.209,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.cyan),
                              child: TextField(
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                                controller: _editpostnumbercontrolller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: width / 136.6, bottom: height / 65.7)),
                              )),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height / 32.85),

                  ///plan TYpe edit textdield
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plan Type",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: height / 131.4),
                          Container(
                              height: height / 16.425,
                              width: width / 6.209,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.cyan),
                              child: TextField(
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                                controller: _editposttypecontrolller,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: width / 136.6, bottom: height / 65.7)),
                              )),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height / 32.85),

                  InkWell(
                    onTap: () {
                      ///update functions
                      upadtedocument(docid);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 16.425,
                      width: width / 10.507,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xff263646)),
                      child: Center(
                        child: Text(
                          "Okay",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}
