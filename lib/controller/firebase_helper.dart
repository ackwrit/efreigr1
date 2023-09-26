//gere toutes les opérations concernant la bdd Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FiresbaseHelper{
  //atttributs
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");



  //méthdes
  //inscription un utilisateur
  resgiter(mail,mdp,nom,prenom) async{
    UserCredential credential = await auth.createUserWithEmailAndPassword(email: mail, password: mdp);
    String uid = credential.user!.uid;
    Map<String,dynamic> map = {
      "MAIL":mail,
      "NOM":nom,
      "PRENOM":prenom,
      "FAVORIS":[]
    };
    adddUser(uid, map);




  }



//connexion d'unutilisateur
  connect(mail,mdp){
    auth.signInWithEmailAndPassword(email: mail, password: mdp);

  }


//ajouter un utilisateur
adddUser(String uid,Map<String,dynamic> data){
  cloudUsers.doc(uid).set(data);
}

updateUser(String uid, Map<String,dynamic> data){
    cloudUsers.doc(uid).update(data);
}





}