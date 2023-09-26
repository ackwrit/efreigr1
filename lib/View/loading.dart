import 'package:eferei2023gr109/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Lottie.asset("01.json"),
        Lottie.asset("02.json"),
        Lottie.asset("03.json"),
        MyHomePage(title: "coucou")

      ],
    );
  }
}
