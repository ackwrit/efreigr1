import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eferei2023gr109/constant.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class MyUser {
  late String uid;
  late String nom;
  late String prenom;
  late String mail;
  Colors? favoriteColor;
  DateTime? birthday;
  late List favoris;
  String? photo;
  Position? gps;


  //constructeur
  MyUser.empty(){
    uid ="";
    nom ="";
    prenom = "";
    mail ="";
    favoris = [];
  }
  MyUser(DocumentSnapshot snapshot){
    uid = snapshot.id;
    Map<String,dynamic>map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    mail = map["MAIL"];
    favoriteColor = map["FAVORISCOLOR"];
    birthday = map["BIRTHDAY"]?? DateTime.now();
    favoris = map["FAVORIS"];
    photo = map["PHOTO"]??imageDefault;
    GeoPoint? geoPoint = map["GPS"]?? GeoPoint(0, 0);
    gps = Position(longitude: geoPoint!.longitude, latitude: geoPoint.latitude, timestamp: DateTime.now(), accuracy: 0, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0);


  }


}