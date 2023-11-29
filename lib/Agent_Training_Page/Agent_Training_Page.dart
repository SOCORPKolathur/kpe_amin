import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ConstFile.dart';

class Agent_Training_Page extends StatefulWidget {
  const Agent_Training_Page({Key? key}) : super(key: key);

  @override
  State<Agent_Training_Page> createState() => _Agent_Training_PageState();
}

class _Agent_Training_PageState extends State<Agent_Training_Page> {


  TextEditingController _editposttitlecontrolller=TextEditingController();

  TextEditingController _editpostSubtitlecontrolller=TextEditingController();

  TextEditingController _editUrllinkcontrolller=TextEditingController();

///change state boolean varibale

  bool _changestate=false;

  TextEditingController videoTitleController=TextEditingController();
  TextEditingController videoSubTitleController=TextEditingController();
  TextEditingController videoUrlController=TextEditingController();
  bool Loading =false;

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
                        "Agent Training Video Page",
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
                  child: Form(
                    key: _formKey,
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
                                validator: (value) => value!.isEmpty?"Field is Empty":null,
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
                                validator: (value) => value!.isEmpty?"Field is Empty":null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Video Url" ,
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
                                controller: videoUrlController,
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                                validator: (value) => value!.isEmpty?"Field is Empty":null,
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

                Padding(
                  padding:  EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      GestureDetector(

                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              Loading=true;
                            });
                            datacreatefunction();
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
                      SizedBox(width: 50,),

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
                      stream: FirebaseFirestore.instance.collection("Agenttraining_videos").orderBy("timestamp").snapshots(),
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
                                crossAxisCount: 4,
                                childAspectRatio: 110/50,
                                crossAxisSpacing: 10
                            ),
                            physics: const ScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {

                              var _AgentVideodata=snapshot.data!.docs[index];

                              return
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      _launchURL(_AgentVideodata['url']);
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
                                                  _AgentVideodata["img"].toString(),

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
                                                        _AgentVideodata["title"].toString(),
                                                        style:
                                                        GoogleFonts.poppins(fontSize: 14, color: const Color(0xff000000),
                                                            textStyle: TextStyle(overflow: TextOverflow.ellipsis)),
                                                      ),
                                                      Text(
                                                        _AgentVideodata["subtitle"].toString(),
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
                                                  _deletepopup(_AgentVideodata.id);
                                                },
                                                child: Icon(Icons.delete),
                                              ),
                                              SizedBox(width: 5,),

                                              InkWell(
                                                onTap: (){
                                                  editditem(_AgentVideodata.id);
                                                },
                                                child: Icon(Icons.edit),
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

  ///document create function

  datacreatefunction(){
    FirebaseFirestore.instance.collection("Agenttraining_videos").doc().set({
      "url":videoUrlController.text,
      "date":DateFormat.yMMMMd().format(DateTime.now()),
      "img":MarketingFlyerVideoImage,
      "subtitle":videoSubTitleController.text,
      "timestamp":DateTime.now().millisecondsSinceEpoch,
      "title":videoTitleController.text
    });
    clear();
    showdialog("Saved Successfully");

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
    FirebaseFirestore.instance.collection("Agenttraining_videos").doc(id).delete();
  }

  ///controller clear function
  clear(){
    setState(() {
      videoSubTitleController.clear();
      videoTitleController.clear();
      videoUrlController.clear();
        Loading=false;
    });
  }

  ///update document data
  upadtedocument(docid){
    FirebaseFirestore.instance.collection("Agenttraining_videos").doc(docid).update({
      "url":_editUrllinkcontrolller.text,
      "subtitle":_editpostSubtitlecontrolller.text,
      "title":_editposttitlecontrolller.text
    });
    setState(() {
      _editposttitlecontrolller.clear();
      _editpostSubtitlecontrolller.clear();
      _editUrllinkcontrolller.clear();
    });
  }

  ediditemsetvaluefunction(docid)async{
    var getdatae=await FirebaseFirestore.instance.collection("Agenttraining_videos").doc(docid).get();
    Map<String,dynamic>?value=getdatae.data();
    setState(() {
      _editposttitlecontrolller.text=value!['title'];
      _editpostSubtitlecontrolller.text=value!['subtitle'];
      _editUrllinkcontrolller.text=value!['url'];

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
              top: height / 4.85,
              bottom: height / 4.85,
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

                  ///poster name edit textdield
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Video Title",
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
                                controller: _editposttitlecontrolller,
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

                  ///poster Link edit textdield
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Video Sub Title",
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
                                controller: _editpostSubtitlecontrolller,
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
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Video Url",
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
                                controller: _editUrllinkcontrolller,
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
  _launchURL(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

}
