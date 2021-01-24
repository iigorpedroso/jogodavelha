import 'package:flutter/material.dart';
import 'package:jogo_velha/views/game_view.dart';
import 'package:jogo_velha/views/main_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MainView(),
      'game': (context) => GameView(),
    },
    theme: ThemeData(
      primaryColor: Color(0xff2a1b52)
    ),
  ));
}
