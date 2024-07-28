import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/Diseases/Diseases.dart';
import 'package:respiro_projectfltr/model/diseasesmodel.dart';

class Asthmapage extends StatefulWidget {
  final DiseasesModel? singlediseas;
  const Asthmapage({super.key, this.singlediseas});

  @override
  State<Asthmapage> createState() => _AsthmapageState();
}

class _AsthmapageState extends State<Asthmapage> {
  List<String> sentences = [
    'Implement sustainable practices:\n Rotate crops, use cover crops, and \n minimize tillage to improve soil health \n and reduce dust generation.\n',
    'Manage manure responsibly:\n Compost manure properly and utilize \n anaerobic digesters to capture methane \n emissions and generate renewable energy.\n',
    'Minimize pesticide and fertilizer use: \n Implement integrated pest management \n (IPM) and optimize fertilizer application \n based on soil testing to \n reduce chemical runoff and \n air pollution.',
    'Choose efficient irrigation methods:\n Utilize drip irrigation or precision \n irrigation to minimize water waste \n and nutrient leaching, reducing potential\n  water pollution.',
    "Support renewable energy:\n  Consider installing solar panels \n or wind turbines on your farm \n to reduce reliance on fossil fuels \n and decrease your carbon footprint.\n",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, left: 50),
                      child: Text(
                        widget.singlediseas!.Name,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                            color: HexColor("553504")),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 260,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.singlediseas!.Image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromARGB(255, 219, 215, 214),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 142, 128, 128)
                          .withOpacity(0.5),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: HexColor("F4BE6D")),
                    tabs: [
                      const Tab(
                        text: "Asthma",
                      ),
                      const Tab(
                        text: "Effect",
                      ),
                      const Tab(
                        text: "Overcome",
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          widget.singlediseas!.Name,
                          style: const TextStyle(fontSize: 32),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(widget.singlediseas!.Note,
                            style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(child: Container(child: Text(widget.singlediseas!.Effect))),
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       return Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.all(16),
                  //             child: Icon(
                  //               Icons.fiber_manual_record,
                  //               size: 10,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 8,
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Text(widget.singlediseas!.Effect),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //     itemCount: sentences.length,
                  //   ),
                  // ),
                  //   Expanded(
                  //     child: ListView.builder(
                  //       itemBuilder: (context, index) {
                  //         return Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.all(16),
                  //               child: Icon(
                  //                 Icons.fiber_manual_record,
                  //                 size: 10,
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               width: 8,
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Text(sentences[index]),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //       itemCount: sentences.length,
                  //     ),
                  //   )
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(child: Container(child: Text(widget.singlediseas!.overcome))),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
