import 'package:flutter/cupertino.dart';

var playersList = [
  {
    'id': 1,
    'name': "Jogador 1",
    'color': Color(0xff90dfaa),
    'char': 1,
    'image': 'assets/images/player1.png',
    'winner': false,
  },
  {
    'id': 2,
    'name': "Jogador 2",
    'color': Color(0xffef9b14),
    'char': 0,
    'image': 'assets/images/player2.png',
    'winner': false,
  },
];

var activatePlayer = playersList[0];

var tableGame = [3, 3, 3, 3, 3, 3, 3, 3, 3];

void initGame() {
  for (var i = 0; i < tableGame.length; i++) tableGame[i] = 3;
  activatePlayer = playersList[0];
}

bool continueGame() {
  for (var t in tableGame) if (t == 3) return true;
  return false;
}

bool verifyWinner(index) {
  switch (index) {
    case 0:
      if (tableGame[index] == tableGame[1] && tableGame[index] == tableGame[2])
        return true;
      else if (tableGame[index] == tableGame[3] &&
          tableGame[index] == tableGame[6])
        return true;
      else if (tableGame[index] == tableGame[4] &&
          tableGame[index] == tableGame[8]) return true;
      return false;

    case 1:
      if (tableGame[index] == tableGame[0] && tableGame[index] == tableGame[2])
        return true;
      else if (tableGame[index] == tableGame[4] &&
          tableGame[index] == tableGame[7]) return true;
      return false;

    case 2:
      if (tableGame[index] == tableGame[0] && tableGame[index] == tableGame[1])
        return true;
      else if (tableGame[index] == tableGame[5] &&
          tableGame[index] == tableGame[8])
        return true;
      else if (tableGame[index] == tableGame[4] &&
          tableGame[index] == tableGame[6]) return true;
      return false;

    case 3:
      if (tableGame[index] == tableGame[0] && tableGame[index] == tableGame[7])
        return true;
      else if (tableGame[index] == tableGame[4] &&
          tableGame[index] == tableGame[5]) return true;
      return false;

    case 4:
      if (tableGame[index] == tableGame[1] && tableGame[index] == tableGame[7])
        return true;
      else if (tableGame[index] == tableGame[3] &&
          tableGame[index] == tableGame[5])
        return true;
      else if (tableGame[index] == tableGame[0] &&
          tableGame[index] == tableGame[8])
        return true;
      else if (tableGame[index] == tableGame[2] &&
          tableGame[index] == tableGame[6]) return true;
      return false;

    case 5:
      if (tableGame[index] == tableGame[2] && tableGame[index] == tableGame[8])
        return true;
      else if (tableGame[index] == tableGame[3] &&
          tableGame[index] == tableGame[4]) return true;
      return false;

    case 6:
      if (tableGame[index] == tableGame[0] && tableGame[index] == tableGame[3])
        return true;
      else if (tableGame[index] == tableGame[7] &&
          tableGame[index] == tableGame[8])
        return true;
      else if (tableGame[index] == tableGame[2] &&
          tableGame[index] == tableGame[4]) return true;
      return false;

    case 7:
      if (tableGame[index] == tableGame[6] && tableGame[index] == tableGame[8])
        return true;
      else if (tableGame[index] == tableGame[1] &&
          tableGame[index] == tableGame[4]) return true;
      return false;

    case 8:
      if (tableGame[index] == tableGame[2] && tableGame[index] == tableGame[5])
        return true;
      else if (tableGame[index] == tableGame[6] &&
          tableGame[index] == tableGame[7])
        return true;
      else if (tableGame[index] == tableGame[0] &&
          tableGame[index] == tableGame[4]) return true;
      return false;
  }
}
