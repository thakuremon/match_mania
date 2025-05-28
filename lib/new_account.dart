import 'package:flutter/material.dart';
import 'button.dart';
import 'texteditor.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF00695C),
          centerTitle: true,
          title: Text(
            "Create new account",
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
                  child: button('Create account', () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'account created succesfully!',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    );
                  }),
                ),
                //SizedBox(height: 10),
                //Row(mainAxisAlignment: MainAxisAlignment.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
