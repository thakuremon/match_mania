import 'package:flutter/material.dart';
import 'button.dart';
import 'game_board.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: button('Play Game', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Board()),
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: button('Best Score', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'no score to show!',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                );
              }),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: button('Leaderboard', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'nothing to show!',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
