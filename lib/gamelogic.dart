import 'package:flutter/material.dart';
import 'game_state.dart';

void tapped(int row, int col, GameState gState) {
  if (gState.gameOver == true) return;

  /// do nothing when game is over
  if (gState.clockRunning == false) gState.startClock();
  if (gState.grid[row][col] == -1) return; //// tapping in solved cell
  if (gState.selected == true &&
      gState.selectedrow == row &&
      gState.selectedcol == col)
    return;
  if (gState.selectedValue == gState.grid[row][col] &&
      gState.selected == true) {
    gState.grid[row][col] = -1;
    gState.grid[gState.selectedrow][gState.selectedcol] = -1;
    gState.selected = false;
    gState.matched += 2;
    if (gState.matched == 100) {
      gState.timetaken = gState.getTime();
      gState.gameOver = true;
    }
    return;
  }

  ///// not selected or wrong tapped case
  gState.selectedrow = row;
  gState.selectedcol = col;
  gState.selectedValue = gState.grid[row][col];
  gState.selected = true;
  return;
}

String celldetails(int row, int col, GameState gState) {
  if (gState.grid[row][col] == -1) return "";
  return '${gState.grid[row][col]}';
}

Color cellcolor(int row, int col, GameState gState) {
  if (gState.grid[row][col] == -1)
    return const Color.fromARGB(255, 49, 189, 214);
  if (gState.selectedrow == row && gState.selectedcol == col)
    return Colors.yellow;
  return Colors.white;
}
