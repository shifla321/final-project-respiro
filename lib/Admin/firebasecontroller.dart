import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:respiro_projectfltr/Admin/Ad_home.dart';

class AdminControlller with ChangeNotifier {
  final adminemail = TextEditingController();
  final adminpassword = TextEditingController();

  final adminkey = 'UDJ7zaRmpjRhr9irHhcfQk6KoQK2';

  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  clear() {
    adminemail.clear();
    adminpassword.clear();
  }

  Future signin(String email, String password, context) async {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (value.user!.uid == adminkey) {
        Navigator.of(context)
            .pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => Ad_Home(),
                ),
                (route) => false)
            .then((value) => clear());
      } else {
        log('error ');
      }
    });
  }
}
