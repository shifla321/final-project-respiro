import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:respiro_projectfltr/Login/forgotpass.dart';
import 'package:respiro_projectfltr/Login/signup_ph.dart';

import 'package:respiro_projectfltr/home1.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

final _auth = FirebaseAuth.instance;

class _signinState extends State<signin> {
  final UserNameController = TextEditingController();
  final PasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email = "", password = "";

  bool obscure = true;
  void _toggle() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    login() async {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context as BuildContext)
            .showSnackBar(SnackBar(content: Text('Sign in succesfull')));
        Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(
              builder: (context) => const home1(),
            ));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text('invalid usrname or password')));
      }
    }

    signinwithgoogle(BuildContext context) async {
      try {
        final GoogleSignInAccount? goggleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await goggleUser?.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        print(
            'goggle user name ${userCredential.user?.displayName}===================================================');

        if (userCredential.user != null) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return home1();
            },
          ));
        }
      } on FirebaseException catch (e) {
        print('goggle error $e');
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/Wallpaper Sky.jpg",
                ),
                fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: UserNameController,
                    decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                        hintText: "User Name",
                        hintStyle: const TextStyle(fontSize: 20)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter a User Name";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: obscure,
                    controller: PasswordController,
                    decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _toggle();
                          },
                          icon: Icon(obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(fontSize: 20)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please Enter a Password";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 0, 0, 0))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgot()));
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 170,
                ),
                const Text(
                    "____________________________or_____________________________"),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/facebook.png"),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        signinwithgoogle(context);
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/google.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                    height: 36,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = UserNameController.text;
                              password = PasswordController.text;
                            });
                            login();
                          }
                        },
                        child: Text("Sign In",
                            style: const TextStyle(fontSize: 20),
                            selectionColor: Colors.white.withOpacity(0.5)))),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don have accout?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signup_ph(),
                              ));
                        },
                        child: Text('Signup'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
