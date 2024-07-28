import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/AQI/AQI_check.dart';
import 'package:respiro_projectfltr/Admin/Ad_General.dart';
import 'package:respiro_projectfltr/Admin/firebasecontroller.dart';
import 'package:respiro_projectfltr/apiresponse/response_weather.dart';

import 'package:respiro_projectfltr/Admin/layout.dart';

import 'package:respiro_projectfltr/businesslogic/firebase_options.dart';
import 'package:respiro_projectfltr/firebase/Firebase.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';
import 'package:respiro_projectfltr/provider/helper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WetherDataProvider>(
          create: (_) => WetherDataProvider(),
        ),
        ChangeNotifierProvider(create: (_) => AdminControlller()),
        ChangeNotifierProvider(create: (_) => HelperProvider()),
        ChangeNotifierProvider(create: (_) => Firebaseprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            //  Ad_General()
             LayoutBuilderCheck(),
      ),
    );
  }
}


//hh