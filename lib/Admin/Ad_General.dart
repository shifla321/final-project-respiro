import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/Login/success.dart';
import 'package:respiro_projectfltr/firebase/Firebase.dart';
import 'package:respiro_projectfltr/model/advice.dart';
import 'package:respiro_projectfltr/model/diseasesmodel.dart';
import 'package:respiro_projectfltr/model/news.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';
import 'package:respiro_projectfltr/utils/toast.dart';

class Ad_General extends StatefulWidget {
  const Ad_General({super.key});

  @override
  State<Ad_General> createState() => _Ad_GeneralState();
}

class _Ad_GeneralState extends State<Ad_General> {
  final element = {'co', 'no2', 'o3', 'pm_10', 'pm2.5', 'so2'};

  String? selectedelemet;

  final storage = FirebaseStorage.instance;
  String imageurl = '';
  XFile? pickedFile;
  File? image;
  Uint8List webimage = Uint8List(8);

  Future<void> pickimage(BuildContext context) async {
    String url;
    final now = DateTime.now();
    final ImagePicker picker = ImagePicker();

    try {
      if (kIsWeb) {
        final XFile? returnimage =
            await picker.pickImage(source: ImageSource.gallery);
        if (returnimage != null) {
          var f = await returnimage.readAsBytes();
          webimage = f;

          UploadTask uploadTask = storage
              .ref('advice/$now')
              .putData(webimage, SettableMetadata(contentType: 'image/jpeg'));
          TaskSnapshot snapshot = await uploadTask;
          url = await snapshot.ref.getDownloadURL();
          imageurl = url;
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error picking image')),
          );
        }
      } else {
        final XFile? returnimage =
            await picker.pickImage(source: ImageSource.gallery);
        if (returnimage != null) {
          image = File(returnimage.path);

          UploadTask uploadTask = storage
              .ref('diseases/$now')
              .putFile(image!, SettableMetadata(contentType: 'image/jpeg'));
          TaskSnapshot snapshot = await uploadTask;
          url = await snapshot.ref.getDownloadURL();
          imageurl = url;
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error picking image')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  String? selectedelemet2;

  final storage2 = FirebaseStorage.instance;
  String imageurl2 = '';
  XFile? pickedFile2;
  File? image2;
  Uint8List webimage2 = Uint8List(8);

  Future<void> pickedimagesecond(BuildContext context) async {
    String url2;
    final now = DateTime.now();
    final ImagePicker picker = ImagePicker();

    try {
      if (kIsWeb) {
        final XFile? returnimage =
            await picker.pickImage(source: ImageSource.gallery);
        if (returnimage != null) {
          var f = await returnimage.readAsBytes();
          webimage2 = f;

          UploadTask uploadTask = storage2
              .ref('advice/$now')
              .putData(webimage2, SettableMetadata(contentType: 'image/jpeg'));
          TaskSnapshot snapshot = await uploadTask;
          url2 = await snapshot.ref.getDownloadURL();
          imageurl2 = url2;
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error picking image')),
          );
        }
      } else {
        final XFile? returnimage =
            await picker.pickImage(source: ImageSource.gallery);
        if (returnimage != null) {
          image = File(returnimage.path);

          UploadTask uploadTask = storage
              .ref('diseases/$now')
              .putFile(image!, SettableMetadata(contentType: 'image/jpeg'));
          TaskSnapshot snapshot = await uploadTask;
          url2 = await snapshot.ref.getDownloadURL();
          imageurl = url2;
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error picking image')),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  final link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final instance = Provider.of<Firebaseprovider>(context, listen: false);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/res.jpg"),
            ),
          ),
          title: Row(
            children: [
              Text('RESPIRO',
                  style: GoogleFonts.elsie(
                      color: const Color.fromARGB(255, 222, 170, 11))),
            ],
          ),
        ),
        body: Column(children: [
          const Divider(
            color: Colors.black,
          ),
          Text(
            "General",
            style: GoogleFonts.elsie(
              fontSize: 23,
              color: const Color.fromARGB(255, 110, 60, 25),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: HexColor("F4BE6D")),
              tabs: [
                const Tab(
                  text: "Diseases",
                ),
                const Tab(
                  text: "Advices",
                ),
                const Tab(
                  text: "News",
                ),
                const Tab(
                  text: "Daily",
                )
              ]),
          Expanded(
            child: TabBarView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: 290,
                      color: HexColor("BE8C39"),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: Icon(Icons.add),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: instance.diseasesname,
                              decoration: const InputDecoration(
                                  hintText: "Diseases Name"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        await pickimage(context);
                      },
                      child: Container(
                        height: 110,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 133, 112, 112),
                          // image: DecorationImage(
                          //     ima)
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),

                  Consumer<Firebaseprovider>(
                    builder: (context, insatnce, child) {
                      return SizedBox(
                        width: width * .180,
                        child: DropdownButtonFormField(
                          hint: Text('select element '),
                          items: element.map((e) {
                            return DropdownMenuItem<String>(
                              child: Text(e),
                              value: e.toString(),
                            );
                          }).toList(),
                          onChanged: (value) {
                            instance.value(value);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: width * .300,
                        height: height * .150,
                        child: TextFormField(
                          controller: instance.diseasesnote,
                          decoration: InputDecoration(
                            hintText: 'Diseases note',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .300,
                        height: height * .150,
                        child: TextFormField(
                          controller: instance.diseaseseffect,
                          decoration: InputDecoration(
                            hintText: 'Diseases effect',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .300,
                        height: height * .150,
                        child: TextFormField(
                          controller: instance.diseasesovercome,
                          decoration: InputDecoration(
                            hintText: 'Diseases overcome',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<Firebaseprovider>(
                        builder: (context, insatnceprvdr, child) {
                          return ElevatedButton(
                            onPressed: () {
                              if (instance.diseasesname == null &&
                                  imageurl == null &&
                                  instance.diseasesnote.text == null &&
                                  instance.diseaseseffect.text == null &&
                                  instance.diseasesovercome.text == null) {
                                Toast().errortoast(context, 'Fill the form');
                              } else {
                                instance
                                    .adddiseases(
                                  DiseasesModel(
                                    Name: instance.diseasesname.text,
                                    Image: imageurl,
                                    Note: instance.diseasesnote.text,
                                    Effect: instance.diseaseseffect.text,
                                    overcome: instance.diseasesovercome.text,
                                    element:
                                        insatnceprvdr.selectedelemet.toString(),
                                  ),
                                )
                                    .then((value) {
                                  Toast().succestoas(
                                      context, 'add diseases succes');
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            child: Text('Add diseases'),
                          );
                        },
                      )
                    ],
                  ),
                  //   Expanded(
                  //       child: DefaultTabController(
                  //     length: 3,
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           color: Colors.red,
                  //           child: Container(
                  //             // height: 55,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(14),
                  //               color: const Color.fromARGB(255, 255, 255, 255),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color:
                  //                       const Color.fromARGB(255, 142, 128, 128)
                  //                           .withOpacity(0.5),
                  //                   blurRadius: 5.0,
                  //                   spreadRadius: 2.0,
                  //                   offset: const Offset(0, 3),
                  //                 ),
                  //               ],
                  //             ),

                  //             child: TabBar(
                  //                 indicatorSize: TabBarIndicatorSize.tab,
                  //                 indicator: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(14),
                  //                     color: HexColor("F4BE6D")),
                  //                 tabs: [
                  //                   const Tab(
                  //                     text: "Asthma",
                  //                   ),
                  //                   const Tab(
                  //                     text: "Effect",
                  //                   ),
                  //                   const Tab(
                  //                     text: "Overcome",
                  //                   )
                  //                 ]),

                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ))
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 290,
                            color: HexColor("BE8C39"),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    child: Icon(Icons.add),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: instance.advicename,
                                    decoration: const InputDecoration(
                                        hintText: "advice Name"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              await pickimage(context);
                            },
                            child: Container(
                              height: 110,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 133, 112, 112),
                                // image: DecorationImage(
                                //     ima)
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        Row(
                          children: [
                            SizedBox(
                                width: width * .300,
                                height: height * .150,
                                child: Consumer<Firebaseprovider>(
                                  builder: (context, helper, child) {
                                    return TextFormField(
                                      controller: instance.advicenote,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              if (instance
                                                  .advicenote.text.isNotEmpty) {
                                                // helper.advice.add(
                                                //     instance.diseasesnote.text);
                                                helper.addadviselist(
                                                    instance.advicenote.text);
                                                   
                                              }
                                                                                               
                                            },
                                            icon: Icon(Icons.add)),
                                        hintText:
                                            'advice note list bullet point',
                                        border: OutlineInputBorder(),
                                      ),
                                    );
                                  },
                                )),
                            // Consumer<Firebaseprovider>(
                            //   builder: (context, value, child) {
                            //     return IconButton(
                            //         onPressed: () {
                            //           log('${value.advice.length}');
                            //         },
                            //         icon: Icon(Icons.add));
                            //   },
                            // )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Consumer<Firebaseprovider>(
                              builder: (context, insatnceprvdr, child) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (insatnceprvdr
                                            .advicename.text.isNotEmpty &&
                                        insatnceprvdr
                                            .advicenote.text.isNotEmpty) {
                                      insatnceprvdr.addadvice(
                                        AdwiseModel(
                                          Advidename:
                                              insatnceprvdr.advicename.text,
                                          adviceimage: imageurl,
                                          advices: insatnceprvdr.advice,
                                        ),
                                      );
                                      Toast().succestoas(context, 'add advice');
                                    } else {
                                      Toast()
                                          .errortoast(context, 'Fill the form');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                  ),
                                  child: Text('Add advice'),
                                );
                              },
                            )
                          ],
                        ),
                        //   Expanded(
                        //       child: DefaultTabController(
                        //     length: 3,
                        //     child: Column(
                        //       children: [
                        //         Container(
                        //           color: Colors.red,
                        //           child: Container(
                        //             // height: 55,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(14),
                        //               color: const Color.fromARGB(255, 255, 255, 255),
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                   color:
                        //                       const Color.fromARGB(255, 142, 128, 128)
                        //                           .withOpacity(0.5),
                        //                   blurRadius: 5.0,
                        //                   spreadRadius: 2.0,
                        //                   offset: const Offset(0, 3),
                        //                 ),
                        //               ],
                        //             ),

                        //             child: TabBar(
                        //                 indicatorSize: TabBarIndicatorSize.tab,
                        //                 indicator: BoxDecoration(
                        //                     borderRadius: BorderRadius.circular(14),
                        //                     color: HexColor("F4BE6D")),
                        //                 tabs: [
                        //                   const Tab(
                        //                     text: "Asthma",
                        //                   ),
                        //                   const Tab(
                        //                     text: "Effect",
                        //                   ),
                        //                   const Tab(
                        //                     text: "Overcome",
                        //                   )
                        //                 ]),

                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 89, 85, 72),
                        ),
                        child: Center(
                          child: Text(
                            "Head Line news",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // height: 100,
                              width: 250,
                              color: const Color.fromARGB(255, 149, 138, 105),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Consumer<Firebaseprovider>(
                                              builder: (context, prvdr, child) {
                                                return TextFormField(
                                                  controller: prvdr.news,
                                                  decoration: InputDecoration(
                                                      hintText: 'head Line'),
                                                );
                                              },
                                            )),
                                        SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Color.fromARGB(255, 68, 65, 59),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            await pickedimagesecond(context);
                          },
                          child: Container(
                            height: 110,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 133, 112, 112),
                              // image: DecorationImage(
                              //     ima)
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: TextFormField(
                          controller: link,
                          decoration: InputDecoration(
                            hintText: 'Add link',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<Firebaseprovider>(
                        builder: (context, instance, child) {
                          return GestureDetector(
                            onTap: () async {
                              if (instance.news != null && imageurl2 != null) {
                                await instance.addNews(NewsModel(
                                  News: instance.news.text,
                                  image: imageurl2,
                                  link: link.text,
                                ));
                                Toast().succestoas(context, 'add news');
                              }
                            },
                            child: Container(
                              color: Colors.blue,
                              width: 110,
                              height: 40,
                              child: Text('Add news'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 180,
                  ),
                ],
              ),
              Row(
                children: [
                  // Container(
                  //   height: 50,
                  //   width: 110,
                  //   color: Colors.amber,
                  // ),
                  Expanded(
                      child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.red,
                          child: Container(
                            // height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 142, 128, 128)
                                          .withOpacity(0.5),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TabBar(
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: HexColor("F4BE6D")),
                                  tabs: [
                                    const Tab(
                                      text: "HOME",
                                    ),
                                    const Tab(
                                      text: "WORK",
                                    ),
                                    const Tab(
                                      text: "OTHER",
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 55,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 232, 174, 50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: "headings"),
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_circle_right,
                              color: const Color.fromARGB(255, 79, 60, 6),
                            ),
                          ],
                        );
                      },
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
