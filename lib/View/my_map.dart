import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //variable
  Completer<GoogleMapController> completerMaps = Completer();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller){
        completerMaps.complete(controller);

      },
        initialCameraPosition: CameraPosition(target: LatLng(48.835420179233786, 2.5493275588380384),zoom: 14)
    );
  }
}
