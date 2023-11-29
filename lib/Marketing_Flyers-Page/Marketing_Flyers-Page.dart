import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';
class Marketing_Flyers extends StatefulWidget {
  const Marketing_Flyers({Key? key}) : super(key: key);

  @override
  State<Marketing_Flyers> createState() => _Marketing_FlyersState();
}

class _Marketing_FlyersState extends State<Marketing_Flyers> {

  TextEditingController Namecontroller=TextEditingController();

  TextEditingController _editnamecontrolller=TextEditingController();


  ///state change boolean variable
  bool _changePage=false;
  bool viewphotovalue=false;
  String viewimagevalue="";
  String selectedWishsesType="";


  var imgUrl;
  File ?Pickimage;
  String Uploadimage='';
  FirebaseStorage fs = FirebaseStorage.instance;
  String fileName = const Uuid().v1();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return

    _changePage==false?
      Padding(
        padding:  EdgeInsets.symmetric(
          vertical: height/81.375,
          horizontal: width/170.75
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    "Marketing Flyers Page",
                    style: GoogleFonts.poppins(
                        fontSize: width / 57.57,
                        color: const Color(0xff000000)),
                  ),
                  GestureDetector(

                    onTap: (){
                      addflyeritem();
                    },
                    child: Container(
                      width: width / 8.6,
                      height: height / 16.42,
                      //color: Color(0xffD60A0B),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff57375D),
                      ),
                      child: Center(
                          child: Text(
                            "Add Category's",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: width / 91.066),
                          )),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: height/18.228,),
            Container(
              height: height/1.4466,
              color: Colors.white70,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("Marketing_Flyers").orderBy("name").snapshots(),
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

                        var _marketflyers=snapshot.data!.docs[index];

                        return Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: width/170.75,
                            vertical: height/81.375,
                          ),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                _changePage=true;
                                selectedWishsesType=_marketflyers['name'];
                              });
                              print(_changePage);
                              print(selectedWishsesType);
                            },
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [

                                    SizedBox(
                                      width: width/13.66,
                                      height: height/16.275,
                                      child: Center(
                                        child: Text(
                                          _marketflyers["name"].toString(),
                                          style:
                                          GoogleFonts.poppins(fontSize: width/97.571, color: const Color(0xff000000)),
                                        ),
                                      ),
                                    ),


                                    SizedBox(
                                        width: width/22.766,
                                        height: height/16.275,
                                        child: Row(
                                          children: [

                                            InkWell(
                                                onTap: (){
                                                  ///delete popup
                                                  _deletepopup(_marketflyers.id);
                                                },

                                                child: const Icon(Icons.delete)),

                                             SizedBox(width: width/113.833,),

                                            InkWell(
                                                onTap: (){

                                                  ///edit item popup
                                                  editditem(_marketflyers.id) ;

                                                },

                                                child: const Icon(Icons.edit)),

                                          ],
                                        )
                                    ),






                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },);
                },
              ),
            ),
            SizedBox(height: height/8.228,),

            ///submit button
          /*  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                GestureDetector(

                  onTap: (){
                    ///document create function
                    _markettingdocuementfunction();
                    ///save popup
                    showdialog("Plans Saved Successfully");
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
            )*/
          ],
              ),
        ),
      ):
    viewphotovalue==true&&viewimagevalue!=""?
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
          ),
          SizedBox(

            height: 500,
            width: 500,
            child: Image.network(viewimagevalue,fit: BoxFit.cover,),


          ),
        ],
      ),
    ):
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 25,),
            ///Tittle Text
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [

                  GestureDetector(
                      onTap: (){
                        setState(() {
                          viewimagevalue="";
                          viewphotovalue=false;
                          _changePage=false;
                          selectedWishsesType="";
                           imgUrl="";
                          Pickimage=null;
                           Uploadimage='';

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
                  SizedBox(width: width/130.6,),
                  Text(
                    selectedWishsesType.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: width / 57.57,
                        color: const Color(0xff000000)),
                  ),

                ],
              ),
            ),

            SizedBox(height: height/49.1,),

            Container(
              height: 450,
              color: Colors.white70,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("WishesImage").where("type",isEqualTo:selectedWishsesType).snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData==null){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        childAspectRatio: 150/90,
                      ),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {

                        var _wishesdata=snapshot.data!.docs[index];
                        return Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                viewimagevalue=_wishesdata["img"].toString();
                                viewphotovalue=true;
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(_wishesdata["img"].toString(),height: 100,width: 100,),
                                    SizedBox(width: width/34.15,),

                                    SizedBox(
                                        width: width/22.766,
                                        height: height/16.275,
                                        child: Row(
                                          children: [

                                            InkWell(
                                                onTap: (){
                                                  ///delete popup
                                                  _deleteWishListpopup(_wishesdata.id);
                                                },

                                                child: const Icon(Icons.delete)),

                                             SizedBox(width: width/113.833,),

                                          ],
                                        )
                                    ),
                                  ],
                                ),
                            ),
                                              ),
                          ),
                        );
                      },);
                },
              ),
            ),

            ///image show container
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                            child: Icon(
                              Icons.add,
                              color: const Color(0xffa3c9e2),
                              size: width / 34.15,
                            ))),
                  ),
                ),
                SizedBox(
                  width: width/130.6,
                ),
                GestureDetector(

                  onTap: (){
                    uploadimagedunction();
                  },
                  child: Container(
                    width: width / 8.6,
                    height: height / 16.42,
                    //color: Color(0xffD60A0B),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff57375D),
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
                SizedBox(
                  width: width/90.6,
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  /// Edit Methods----------------

  ///update document data(Edit Documents)
  upadtedocument(docid){
    FirebaseFirestore.instance.collection("Marketing_Flyers").doc(docid).update({
      "name":_editnamecontrolller.text,
    });
    setState(() {
      _editnamecontrolller.clear();
    });
  }

  ediditemsetvaluefunction(docid)async{
    var getdatae=await FirebaseFirestore.instance.collection("Marketing_Flyers").doc(docid).get();
    Map<String,dynamic>?value=getdatae.data();
    setState(() {
      _editnamecontrolller.text=value!['name'];
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
              top: height / 3.65,
              bottom: height / 3.65,
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

                  /// name edit textdield
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
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
                                controller: _editnamecontrolller,
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

  ///---------------------------------End



  /// Marketing Flyers Methods------------
  ///AddItem popup
  addflyeritem() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              top: height / 3.65,
              bottom: height / 3.65,
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
                    "Are You Sure Want To Add  New Item ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700, fontSize: width / 68.3),
                  ),
                  SizedBox(height: height / 32.85),

                  /// name edit textdield
                  Row(
                    children: [
                      SizedBox(width: width / 7.805),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
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
                                controller: Namecontroller,
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

                      ///document create function
                      _markettingdocuementfunction();
                      ///save popup
                      Navigator.pop(context);

                     showdialog("Add New Category Item Successfully");

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
  
  
  ///Marketing flyers document data create function

   _markettingdocuementfunction(){
    FirebaseFirestore.instance.collection("Marketing_Flyers").doc().set({
      "name":Namecontroller.text,
    });
    _matkintingclearcontroller();
}

   ///Marketing flyers document data controller clear function
  _matkintingclearcontroller (){
    setState(() {
      Namecontroller.clear();
    });
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
    FirebaseFirestore.instance.collection("Marketing_Flyers").doc(id).delete();
  }


  ///--------------------------------


  ///Wishes ImageS Methods---------------------
  ///document create from firebase create function
  wishesdatacreatefunction()  {
    FirebaseFirestore.instance.collection("WishesImage").doc().set({
      "img":Uploadimage,
      "type":selectedWishsesType,
    });
    clear();
  }

  ///image upload function

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
      Uploadimage="";
      Pickimage=null;
      imgUrl="";
    });
  }



  _deleteWishListpopup(docid){

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
                    deletWishListdocument(docid);
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
  ///delete document for wish list Image
  deletWishListdocument(id){
    FirebaseFirestore.instance.collection("WishesImage").doc(id).delete();
  }

  /// -------------------End


}
