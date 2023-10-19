import 'package:geolocator/geolocator.dart';

class MyPermissionGps {



  Future<Position>init() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(serviceEnabled){
      LocationPermission permission = await Geolocator.checkPermission();
      return checkPermission(permission);

    }
    else
      {
        return Future.error("Nous pouvons accéder à sa géolocalisation");
      }
  }


  Future<Position>checkPermission(LocationPermission permission){
    switch(permission){
      case LocationPermission.deniedForever : return Future.error("Il ne souhaite pas qu'on accède à ses données");
      case LocationPermission.denied : return Geolocator.requestPermission().then((value) =>checkPermission(value));
      case LocationPermission.unableToDetermine : return Geolocator.requestPermission().then((value) =>checkPermission(value));
      case LocationPermission.whileInUse : return Geolocator.getCurrentPosition();
      case LocationPermission.always : return Geolocator.getCurrentPosition();
    }

  }
}