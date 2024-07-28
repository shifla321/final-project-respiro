import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/Diseases/Asthma_page.dart';
import 'package:respiro_projectfltr/Diseases/COPD.dart';
import 'package:respiro_projectfltr/Diseases/Dementia_pahe.dart';
import 'package:respiro_projectfltr/Diseases/HeartAttack_page.dart';
import 'package:respiro_projectfltr/Diseases/LungCancer_page.dart';
import 'package:respiro_projectfltr/Diseases/Parkinson%E2%80%99s%20Diseases.dart';
import 'package:respiro_projectfltr/Diseases/Pneumonia_page.dart';
import 'package:respiro_projectfltr/Diseases/SkinDiseases_page.dart';
import 'package:respiro_projectfltr/Diseases/Stroke.dart';
import 'package:respiro_projectfltr/custom_round.dart';

import 'package:respiro_projectfltr/frame.dart';
import 'package:respiro_projectfltr/provider/firebaseprovider.dart';
import 'package:url_launcher/url_launcher.dart';

class news_page extends StatefulWidget {
  int indexnumber = 0;

  news_page({super.key, required this.indexnumber});

  @override
  State<news_page> createState() => _News_pageState();
}

class _News_pageState extends State<news_page> {
  @override
  Widget build(BuildContext context) {
    final _pages = [
      const Asthmapage(),
      const COPD_page(),
      const Pneumonia_page(),
    ];
    Future<void> _launchYoutube(String videoId) async {
      final String url = 'youtube://watch?v=$videoId';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        final webUrl = 'https://www.youtube.com/watch?v=$videoId';
        await launchUrl(Uri.parse(webUrl));
      }
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 195,
            child: Stack(children: [
              CustomPaint(
                size: const Size(double.maxFinite, 200),
                painter: RPSCustomPainter(),
              ),
              const CustomRound(),
              Padding(
                padding: const EdgeInsets.only(left: 110, top: 90),
                child: Text(
                  "News",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: HexColor("553504")),
                ),
              )
            ]),
          ),
          Expanded(child: Consumer<Firebaseprovider>(
            builder: (context, instance, child) {
              return FutureBuilder(
                  future: instance.getNews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final data = instance.newslist;

                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        log(data[index].image);

                        return GestureDetector(
                          onTap: () {
                            // switch (index) {
                            //   case 0:
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: ((context) => const Asthmapage())));
                            //     break;
                            //   case 1:
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: ((context) => const COPD_page())));
                            //     break;
                            //   case 2:
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: ((context) => const Pneumonia_page())));
                            //     break;
                            // }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 50),
                            height: 100,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: HexColor("BE8C39"),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchYoutube(data[index].link);
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data[index].image,
                                            ),
                                          ),
                                          // color: Colors.red,/
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _launchYoutube(
                                            'https://youtu.be/fP4AMHY6tk8?si=O9IZON-uCUzUbRFf');
                                      },
                                      child: Text(
                                        data[index].News,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
