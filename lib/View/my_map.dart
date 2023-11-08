

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eferei2023gr109/constant.dart';
import 'package:eferei2023gr109/controller/firebase_helper.dart';
import 'package:eferei2023gr109/controller/texting.dart';
import 'package:eferei2023gr109/model/my_user.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

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
  Set<Marker> allMarkers = Set();




  init() {
    //test
    Map<String,dynamic> data = {
      'GPS': GeoPoint(widget.gps.latitude, widget.gps.longitude)
    };
    FiresbaseHelper().updateUser(moi.uid, data);
    //récupérattion des marekers
    //

    initCamera = CameraPosition(target: LatLng(widget.gps.latitude,widget.gps.longitude),zoom: 14);
  }

  @override
  void initState() {
    // TODO: implement initState
    init();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: allMarkers,

      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: (controller){
        completerMaps.complete(controller);

      },
        initialCameraPosition: initCamera,
    );
  }
}
