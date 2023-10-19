import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  Position gps;
  MyMap({required this.gps,super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //variable
  late CameraPosition initCamera;
  Completer<GoogleMapController> completerMaps = Completer();

  @override
  void initState() {
    // TODO: implement initState
    initCamera = CameraPosition(target: LatLng(widget.gps.latitude,widget.gps.longitude),zoom: 14);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(

      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: (controller){
        completerMaps.complete(controller);

      },
        initialCameraPosition: initCamera,
    );
  }
}
