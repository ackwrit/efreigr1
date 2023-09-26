import 'package:eferei2023gr109/View/loading.dart';
import 'package:eferei2023gr109/View/my_background.dart';
import 'package:eferei2023gr109/controller/my_animation.dart';
import 'package:flutter/material.dart';

void main() {
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


                          },
                          child: const Text("Inscription")
                      ),
                    ),
                    const SizedBox(height : 10),

                    MyAnimation(
                      duree: 6,
                      child: ElevatedButton(
                          onPressed: (){

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
