import 'package:eferei2023gr109/View/Dashboard.dart';
import 'package:eferei2023gr109/View/loading.dart';
import 'package:eferei2023gr109/View/my_background.dart';
import 'package:eferei2023gr109/constant.dart';
import 'package:eferei2023gr109/controller/firebase_helper.dart';
import 'package:eferei2023gr109/controller/my_animation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoadingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController password = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController mail = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body:  Stack(
        children: [
          MyBackground(),
          Padding(
              padding: const EdgeInsets.all(15),
              child : Column(

                  children : [
                    //image
                    Image.network("https://www.captain-drive.com/wp-content/uploads/2014/12/lamborghini_aventador.jpg"),


                    //champs nom
                    MyAnimation(
                      duree: 1,
                      child: TextField(
                        controller: nom,
                          decoration : InputDecoration(
                              prefixIcon : const Icon(Icons.person),
                              hintText:"Entrer votre nom",
                              border : OutlineInputBorder(
                                  borderRadius : BorderRadius.circular(20)
                              )
                          )
                      ),
                    ),

                    const SizedBox(height : 10),


                    //champs prénom

                    MyAnimation(
                      duree: 2,
                      child: TextField(
                        controller: prenom,
                          decoration : InputDecoration(
                              prefixIcon : const Icon(Icons.person),
                              hintText:"Entrer votre prénom",
                              border : OutlineInputBorder(
                                  borderRadius : BorderRadius.circular(20)
                              )
                          )
                      ),
                    ),

                    const SizedBox(height : 10),


                    //champs mail

                    MyAnimation(
                      duree: 3,
                      child: TextField(
                        controller: mail,
                          decoration : InputDecoration(
                              prefixIcon : const Icon(Icons.mail,color:Colors.purple),
                              hintText:"Entrer votre mail",
                              border : OutlineInputBorder(
                                  borderRadius : BorderRadius.circular(20)
                              )
                          )
                      ),
                    ),

                    const SizedBox(height : 10),

                    //champs mdp
                    MyAnimation(
                      duree: 4,
                      child: TextField(
                        controller: password,



                          obscureText : true,
                          decoration : InputDecoration(
                              prefixIcon : const Icon(Icons.lock),
                              hintText:"Entrer votre password",
                              border : OutlineInputBorder(
                                  borderRadius : BorderRadius.circular(20)
                              )
                          )
                      ),
                    ),
                    const SizedBox(height : 10),


                    //bouton d'inscription
                    MyAnimation(
                      duree: 5,
                      child: ElevatedButton(

                          onPressed: (){
                            FiresbaseHelper().resgiter(mail.text, password.text, nom.text, prenom.text).then((value){
                              //fonction a réussi
                              setState(() {
                                moi = value;
                              });
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context){
                                    return const MyDashBoard();
                                  }
                              ));

                            }).catchError((error){
                              //afficher un popUp
                              print(error.toString());
                            });



                          },
                          child: const Text("Inscription")
                      ),
                    ),
                    const SizedBox(height : 10),

                    MyAnimation(
                      duree: 6,
                      child: ElevatedButton(
                          onPressed: (){
                            FiresbaseHelper().connect(mail.text, password.text).then((value){
                              //fonction a réussi
                              setState(() {
                                moi = value;
                              });
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context){
                                    return const MyDashBoard();
                                  }
                              ));

                            }).catchError((error){
                              //afficher un popUp
                              print(error.toString());
                            });

                          },
                          child: Text("Connexion")
                      ),
                    ),




                  ]
              )


          ),
        ],
      )
    );
  }
}
