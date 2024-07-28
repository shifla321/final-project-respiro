import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/Admin/Ad_home.dart';
import 'package:respiro_projectfltr/Admin/firebasecontroller.dart';

class Ad_Sign_in extends StatefulWidget {
  const Ad_Sign_in({super.key});

  @override
  State<Ad_Sign_in> createState() => _Ad_Sign_inState();
}

class _Ad_Sign_inState extends State<Ad_Sign_in> {
  @override
  Widget build(BuildContext context) {
    final prvdr = Provider.of<AdminControlller>(context);
    return Scaffold(
        body: Container(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/res.jpg",
                ),
                fit: BoxFit.cover)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Text(
              'Air Quality Checker',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 38,
                  color: Colors.white),
            ),
          ),
          Stack(children: [
            Column(children: [
              Center(
                child: Container(
                  height: 490,
                  width: 620,
                  color: HexColor("5A3E10").withOpacity(0.7),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 60),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "UserName dddd",
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 60, top: 20, left: 40),
                        child: TextFormField(
                          controller: prvdr.adminemail,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 60, top: 20, left: 40),
                        child: TextFormField(
                          controller: prvdr.adminpassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Consumer<AdminControlller>(
                          builder: (context, instance, _) {
                            return ElevatedButton(
                              onPressed: () async {
                                await instance.signin(prvdr.adminemail.text,
                                    prvdr.adminpassword.text, context);
                              },
                              child: Text("SUBMIT"),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ])
        ]),
      ),
    ));
  }
}
