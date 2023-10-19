import 'package:eferei2023gr109/View/my_background.dart';
import 'package:eferei2023gr109/constant.dart';
import 'package:eferei2023gr109/controller/firebase_helper.dart';
import 'package:flutter/material.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  //variable
  bool changedPrenom = false;
  TextEditingController prenom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.66,
        decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(80),topRight: Radius.circular(80))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage:NetworkImage(moi.photo??imageDefault),
            ),

            (changedPrenom)?
            TextField(
              controller: prenom,

              decoration: InputDecoration(
                hintText: "Entrer le prénom"
              ),
            ): Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(moi.prenom,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                IconButton(
                    onPressed: (){
                      setState(() {
                        changedPrenom = true;
                      });

                    },
                    icon: const Icon(Icons.u_turn_right_sharp)
                )
              ],
            ),
            (changedPrenom)?ElevatedButton(onPressed: (){
              setState(() {
                changedPrenom = false;
                moi.prenom = prenom.text;
              });
              Map<String,dynamic> data = {
                "PRENOM":moi.prenom
              };
              FiresbaseHelper().updateUser(moi.uid, data);
            },
                child: const Text("Enregistrement")
            ):Container(),
            Text(moi.nom,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text("${moi.birthday!.day}/${moi.birthday!.month}/${moi.birthday!.year}")
            
          ],
        )
       
        
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          MyBackground(),
          Center(child: Text("coucou"))
        ],
      ),
    );
  }
}
