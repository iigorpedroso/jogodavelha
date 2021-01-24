import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jogo_velha/models/game.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text("Jogo da Velha",
                style: TextStyle(fontWeight: FontWeight.w100)),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: _body(),
          )),
      onWillPop: () async {
        return false;
      },
    );
  }

  Widget _body() {
    return Column(
      children: [this.players(), game()],
    );
  }

  Widget game() {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 0, mainAxisSpacing: 0),
          itemCount: tableGame.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      tableGame[index] == 3
                          ? ""
                          : tableGame[index] == 0
                              ? "0"
                              : "X",
                      style: TextStyle(
                          color: tableGame[index] == 3
                              ? Colors.transparent
                              : tableGame[index] == 0
                                  ? playersList[1]['color']
                                  : playersList[0]['color'],
                          fontSize: 50,
                          fontWeight: FontWeight.w900),
                    ),
                  )),
              onTap: () {
                if (continueGame() && tableGame[index] == 3) {
                  setState(() {
                    tableGame[index] = activatePlayer['char'];
                    if (verifyWinner(index))
                      showWinner();
                    else
                      activatePlayer =
                          activatePlayer['id'] == playersList[0]['id']
                              ? playersList[1]
                              : playersList[0];
                  });
                } else {}
              },
            );
          },
        ));
  }

  Widget players() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var p in playersList)
          playerContainer(
              p['name'],
              p['image'],
              p['color'],
              p['char'] == 0 ? "0" : "X",
              p['id'] == activatePlayer['id'],
              p['winner']),
      ],
    );
  }

  Widget playerContainer(String name, String imgProfile, Color color,
      String option, bool active, bool winner) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          decoration: BoxDecoration(
            color: active ? Colors.black.withOpacity(0.3) : Colors.transparent,
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
          child: Column(
            children: [
              Image.asset(imgProfile, height: 50),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(name,
                    style: TextStyle(color: Colors.white.withOpacity(0.5))),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    option,
                    style: TextStyle(
                        color: color,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            winner ? "Você ganhou!" : "",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  showWinner() {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "O ${activatePlayer['name']} ganhou!",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      },
    ).then((value) => {
          setState(() {
            initGame();
          })
        });
  }
}
