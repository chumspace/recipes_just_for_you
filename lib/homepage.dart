import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;
  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
        title: Text('Basic Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Logged in as:' + user.email!,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your custom action here
              },
              child: Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
