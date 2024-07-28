import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:respiro_projectfltr/Advices/Advices.dart';
import 'package:respiro_projectfltr/model/advice.dart';
import 'package:respiro_projectfltr/model/diseasesmodel.dart';
import 'package:respiro_projectfltr/model/news.dart';
import 'package:respiro_projectfltr/model/notification.dart';
import 'package:respiro_projectfltr/model/polutedcity.dart';
import 'package:respiro_projectfltr/model/usermodel.dart';
import 'package:respiro_projectfltr/model/wether.dart';

class Firebaseprovider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  final diseasesname = TextEditingController();
  final diseasesnote = TextEditingController();
  final diseaseseffect = TextEditingController();
  final diseasesovercome = TextEditingController();

  final advicename = TextEditingController();
  final advicenote = TextEditingController();

  //admin
  final msg = TextEditingController();
  final id = TextEditingController();
  final news = TextEditingController();

  clear() {
    msg.clear();
    id.clear();
    diseasesnote.clear();
    notifyListeners();
  }

  List<String> advice = [];

  void addadviselist(String advicenote) {
    advice.add(advicenote);
   
    notifyListeners();
  }

  //  set

  Future addadvice(AdwiseModel adwiseModel) async {
    final snapshot = await db.collection('advice').doc();

    snapshot.set(adwiseModel.toJson(snapshot.id));
  }

  Future adddiseases(
    DiseasesModel diseases,
  ) async {
    final snapshot = db.collection('Diseases').doc();

    snapshot.set(diseases.toJsone(snapshot.id));
  }

  Future addNews(NewsModel newsModel) async {
    final snapshot = db.collection('news').doc();

    snapshot.set(newsModel.tojsone(snapshot.id));
  }

  // get

  List<NotificationModel> notimodel = [];
  Future getnotification(uid) async {
    final snapshot =
        await db.collection('Notification').where('toid', isEqualTo: uid).get();

    notimodel = snapshot.docs.map((e) {
      return NotificationModel.fromJson(e.data());
    }).toList();
  }

  List<PolutedState> polutesstate = [];
  Future getPolutedCity() async {
    final snapshot = await db.collection('PolutedCities').get();

    polutesstate = snapshot.docs.map((e) {
      return PolutedState.fromJson(e.data());
    }).toList();
  }

  List<NewsModel> newslist = [];
  Future getNews() async {
    final snapshot = await db.collection('news').get();

    newslist = snapshot.docs.map((e) {
      return NewsModel.fromjsone(e.data());
    }).toList();
  }

  List<AdwiseModel> adv = [];
  Future getAdvide() async {
    final snapshot = await db.collection('advice').get();

    adv = snapshot.docs.map((e) {
      return AdwiseModel.fromjson(e.data());
    }).toList();
  }

  Usermodel? usermodel;
  Future getuser(uid) async {
    final snapshot = await await db
        .collection('user firebase')
        .where('uid', isEqualTo: uid)
        .get();

    usermodel = Usermodel.fromJson(snapshot.docs.first.data());
  }

  // List<Usermodel> allusermodel = [];
  // Future gettalluser() async {
  //   final snapshot = await db.collection('user firebase').get();

  //   allusermodel = snapshot.docs.map((e) {
  //     return Usermodel.fromJson(e.data());
  //   }).toList();
  //   notifyListeners();
  // }

  Future notificationset(NotificationModel notificationModel) async {
    final snapshot = await db.collection('Notification').doc();

    snapshot.set(notificationModel.toJsone(snapshot.id));
  }

  Future adduser(
    Usermodel usermodel,
  ) async {
    final snapshot = await db.collection('user firebase').doc();

    snapshot.set(usermodel.toJsone(snapshot.id));
  }

  Future elementAdd(WetherModel wetherModel, id) async {
    final snapshot = db.collection('Elemants').doc();

    snapshot.set(wetherModel.toJson(id));
    notifyListeners();
  }

  String? selectedelemet;

  value(value) {
    selectedelemet = value as String;
    notifyListeners();
  }

  bool obscure = false;

  toggle() {
    obscure = !obscure;
    notifyListeners();
  }

  List<DiseasesModel> co = [];

  Future getdiseases() async {
    final snapshot = await db.collection('Diseases').get();

    co = snapshot.docs.map((e) {
      return DiseasesModel.fromJson(e.data());
    }).toList();
  }

  List<DiseasesModel> listOfDisieses = [];
  Future checkValues(WetherModel weathermodel) async {
    listOfDisieses = [];
    log(weathermodel.toString());
    getdiseases();

    if (weathermodel.co > 50) {
      for (var i in co) {
        if (i.element == "co") {
          listOfDisieses.add(i);
        }
      }
    }
    if (weathermodel.no2 > 250) {
      for (var i in co) {
        if (i.element == "no2") {
          listOfDisieses.add(i);
        }
      }
    }
    if (weathermodel.pm25 > 250) {
      for (var i in co) {
        if (i.element == "pm2.5") {
          listOfDisieses.add(i);
        }
      }
    }
    if (weathermodel.s02 > 50) {
      for (var i in co) {
        if (i.element == "so2") {
          listOfDisieses.add(i);
        }
      }
    }
    if (weathermodel.o3 > 2) {
      for (var i in co) {
        if (i.element == "o3") {
          listOfDisieses.add(i);
        }
      }
    }
    if (weathermodel.pm10 > 2) {
      for (var i in co) {
        if (i.element == "pm_10") {
          listOfDisieses.add(i);
        }
      }
    }
  }

  WetherModel? wetherModel;
}
