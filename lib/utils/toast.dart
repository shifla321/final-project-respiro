import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

class Toast {
  succestoas(BuildContext context, msg) {
    return CherryToast.success(
            title: Text(msg, style: TextStyle(color: Colors.black)))
        .show(context);
  }

  errortoast(BuildContext context, msg) {
    return CherryToast.info(
      title: Text(msg, style: TextStyle(color: Colors.black)),
      actionHandler: () {
        print("Action button pressed");
      },
    ).show(context);
  }
}
