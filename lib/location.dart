import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:respiro_projectfltr/AQI/AQI_check.dart';
import 'package:respiro_projectfltr/provider/helper.dart';

class Locationview extends StatefulWidget {
  const Locationview({super.key});

  @override
  State<Locationview> createState() => _LocationviewState();
}

class _LocationviewState extends State<Locationview> {
  late GoogleMapController _googleMapController;

  void _onmapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final prvdr = Provider.of<HelperProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigation_outlined),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Aqicheck_page(
                  lat: prvdr.searchlatti,
                  lon: prvdr.searchlont,
                ),
              ));
          prvdr.click();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<HelperProvider>(
                builder: (context, controller, _) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.searchcontroller,
                      onFieldSubmitted: (value) {
                        controller
                            .getconvertlatlon(controller.searchcontroller.text);
                        controller.moovecameratolatlon(_googleMapController);
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.clearcontroller();
                            },
                            icon: Icon(Icons.clear)),
                        hintText: 'Search ',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .8,
                  child: Consumer<HelperProvider>(
                    builder: (context, instance, child) {
                      String lat = instance.searchlatti.toString();
                      double latitude = instance.searchlatti ?? 0.0;
                      double longitude = instance.searchlont ?? 0.0;

                      // log('search lat ${latitude}, lon  ${longitude}');
                      return GoogleMap(
                        onMapCreated: _onmapCreated,
                        onTap: (argument) async {
                          await instance
                              .handleLocationPermission(context)
                              .then((value) => instance.latlog());

                          // log('this map lat lon ${instance.lat.toString()},${instance.lon.toString()}');
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            latitude ?? 11.1202668,
                            longitude ?? 76.1198972,
                          ),
                          zoom: 13,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId('marker'),
                            position: LatLng(
                              latitude,
                              longitude,
                            ),
                          ),
                        },
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
