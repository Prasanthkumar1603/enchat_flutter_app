import 'package:flutter/material.dart';
import 'package:en_chat/Pages/login.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  void signIn() {
    // Navigate to the login page when the "Sign in" button is clicked
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EnChat()), // Navigate to your login page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/assets/2.png'),
              SizedBox(
                height:
                    40, // Increase the space between the image and the first button
              ),
              TextButton(
                onPressed:
                    signIn, // Call the signIn function when the button is pressed
                child: Container(child: Text("Sign in")),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff00E4E3),
                  padding:
                      EdgeInsets.symmetric(horizontal: 150.0, vertical: 12.0),
                ),
              ),
              SizedBox(
                height: 20, // Add space between the buttons
              ),
              TextButton(
                onPressed: () {
                  // Add your sign up action here
                },
                child: Container(child: Text('Sign Up')),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xffA060FF),
                  padding:
                      EdgeInsets.symmetric(horizontal: 148.0, vertical: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
