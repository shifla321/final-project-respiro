import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:respiro_projectfltr/Login/signin.dart';
import 'package:respiro_projectfltr/home1.dart';
import 'package:respiro_projectfltr/model/usermodel.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';

class signup_ph extends StatefulWidget {
  const signup_ph({super.key});

  @override
  State<signup_ph> createState() => _signup_phState();
}

class _signup_phState extends State<signup_ph> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  String email = "", password = "";

  registration() async {
    final fbprovider = Provider.of<Firebaseprovider>(context, listen: false);
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registration Succesfull")));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => home1()),
          (route) => false,
        );
        //  String registered_user_id = randomString(10);
        String uid = _auth.currentUser!.uid;
        // Map<String,dynamic> registereinfomap = {
        //   "name": nameController.text,
        //   "email": emailController.text,
        //   "password" : passwordController.text,
        //   "phone":phoneController.text,
        //   "id": uid,
        // };
        fbprovider.adduser(Usermodel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          uid: uid,
        ));
        const SnackBar(content: Text("Details added to firebase Succesfully"));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Weak Password"),
          ));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Email is Already used")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage("assets/images/Wallpaper Sky.jpg"),
                    fit: BoxFit.cover)),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 32),
                        selectionColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40, right: 40, left: 40),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value!.isEmpty) {
                            return "Please Enter a user name";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.account_circle_rounded,
                            size: 30,
                          ),
                          hintText: "User Name  ",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 9) {
                            return "Please Enter a Valid Phone Number";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: phoneController,
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.phone_rounded,
                            size: 30,
                          ),
                          hintText: "Phone Number  ",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter an Email";
                          }
                          RegExp emailRegExp = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.email,
                            size: 30,
                          ),
                          hintText: "Email  ",
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter A password";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: " Password",
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Consumer<Firebaseprovider>(
                          builder: (context, fbprvdr, child) {
                            return TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please confirm your password";
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: confirmController,
                              obscureText: fbprvdr.obscure,
                              decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.5),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      fbprvdr.toggle();
                                    },
                                    icon: Icon(fbprvdr.obscure
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                hintText: "Confirm Password",
                                hintStyle: const TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                            );
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: 36,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  email = emailController.text;
                                  password = passwordController.text;
                                });
                                registration();
                              }
                            },
                            child: const Text(
                              "Sign Up ",
                              style: TextStyle(fontSize: 20),
                              selectionColor: Colors.black,
                            )),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
