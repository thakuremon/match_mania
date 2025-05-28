import 'package:flutter/material.dart';
import 'package:match_mania/new_account.dart';
import 'texteditor.dart';
import 'button.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'match mania',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF00695C),
          centerTitle: true,
          title: Text(
            "Log in to continue",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 100.0),
          child: Card(
            elevation: 5,
            color: const Color(0xFFE0F2F1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textField(
                    'email',
                    Icons.email,
                    TextEditingController(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textField(
                    'password',
                    Icons.lock,
                    TextEditingController(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: button('Login', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  }),
                ),
                //SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('don\'t have any account? '),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewAccount()),
                        );
                      },
                      child: Text(
                        'create new',
                        style: TextStyle(color: Color(0xFF00897B)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
