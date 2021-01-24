import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15, top: 100),
            child: Text("Jogo da Velha",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w100)),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 15, top: 80),
              child: Image.asset('assets/images/icon.png', height: 150)),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'game');
                },
                child: Text(
                  "COMEÇAR",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.only(left: 20, right: 20))),
          )
        ],
      ),
    );
  }
}
