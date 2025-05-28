import 'package:flutter/material.dart';
import 'package:match_mania/game_state.dart';
import 'gamelogic.dart';
import 'dart:async';

class Board extends StatefulWidget {
  const Board({super.key});
  @override
  State<Board> createState() => _Board();
}

class _Board extends State<Board> {
  int Rows = 10;
  int Columns = 10;
  GameState gState = GameState();

  Timer? timer;
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted && !gState.gameOver && gState.clockRunning) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = Rows * Columns;
    MainAxisAlignment.center;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        centerTitle: true,
        title: Text(
          "Board",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),

      backgroundColor: const Color(0xFFF1F8F7),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Columns,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1.0,
                ),
                padding: EdgeInsets.all(3),
                itemCount: total,
                itemBuilder: (context, index) {
                  int row = index ~/ Rows;
                  int col = index % Rows;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tapped(row, col, gState);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: cellcolor(row, col, gState),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFF004D40),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: () {
                          if (gState.grid[row][col] != -1) {
                            return Image.asset(
                              'icons/icon${gState.grid[row][col]}.png',
                            );
                          }
                        }(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(2),
            height: 50,
            color: Color(0xFF00796B),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                () {
                  if (gState.gameOver == true) {
                    return Text(
                      'Duration : ${gState.timetaken}s',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  } else {
                    return Text(
                      'Time: ${gState.elapsedTime()}s',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }
                }(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
