import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:respiro_projectfltr/Admin/Ad_home.dart';
import 'package:respiro_projectfltr/Admin/Ad_sign_in.dart';
import 'package:respiro_projectfltr/Login/signin.dart';
import 'package:respiro_projectfltr/home1.dart';

class LayoutBuilderCheck extends StatelessWidget {
  LayoutBuilderCheck({super.key});

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth > 600) {
          return Ad_Home();
          // Ad_Sign_in();
        } else {
          return auth.currentUser == null ? signin() : home1();
        }
      },
    );
  }
}
