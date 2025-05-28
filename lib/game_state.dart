import 'dart:math';

void generateGrid(grid) {
  List<int> values = [];
  for (int i = 0; i < 25; i++) {
    for (int j = 0; j < 4; j++) {
      values.add(i);
    }
  }

  values.shuffle(Random());

  int index = 0;
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      grid[i][j] = values[index++];
    }
  }
}

class GameState {
  List<List<int>> grid = List.generate(10, (_) => List.filled(10, 0));
  bool selected = false;
  int selectedValue = 100;
  int selectedrow = 100;
  int selectedcol = 100;
  int matched = 0;
  bool gameOver = false;

  DateTime starTtime = DateTime.now();
  bool clockRunning = false;
  int timetaken = 0;

  void startClock() {
    if (!clockRunning) {
      starTtime = DateTime.now();
      clockRunning = true;
    }
  }

  int elapsedTime() {
    return DateTime.now().difference(starTtime).inSeconds;
  }

  int getTime() {
    clockRunning = false;
    return DateTime.now().difference(starTtime).inSeconds;
  }

  GameState() {
    generateGrid(grid);
  }
}
