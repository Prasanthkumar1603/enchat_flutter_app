import 'package:flutter/material.dart';
import 'dart:ui';

class SimpleGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00E4E3),
        title: Text(
          'Stone Paper Scissors',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Glass effect overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          // Main content
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Top GIF image
              Container(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                    'lib/assets/tumblr_oaixsaM9XV1qz7t0xo1_540.gif'),
              ),
              // Main content
              Expanded(
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Make your choice:',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      GameButtons(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GameButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GameButton(
            label: 'Stone', color: Colors.brown, borderColor: Colors.grey),
        SizedBox(width: 20),
        GameButton(
            label: 'Paper', color: Colors.white, borderColor: Colors.grey),
        SizedBox(width: 20),
        GameButton(
            label: 'Scissors', color: Colors.red, borderColor: Colors.grey),
      ],
    );
  }
}

class GameButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color borderColor;

  GameButton(
      {required this.label, required this.color, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: () {
          showResult(context, label);
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void showResult(BuildContext context, String choice) {
    List<String> options = ['Stone', 'Paper', 'Scissors'];
    String computerChoice =
        options[(DateTime.now().millisecondsSinceEpoch % 3)];

    String result = determineWinner(choice, computerChoice);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(
              'You chose $choice.\nYour friend chose $computerChoice.\n$result'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String determineWinner(String playerChoice, String computerChoice) {
    if (playerChoice == computerChoice) {
      return 'It\'s a draw!';
    } else if ((playerChoice == 'Stone' && computerChoice == 'Scissors') ||
        (playerChoice == 'Paper' && computerChoice == 'Stone') ||
        (playerChoice == 'Scissors' && computerChoice == 'Paper')) {
      return 'You win!';
    } else {
      return 'Your friend wins!';
    }
  }
}
