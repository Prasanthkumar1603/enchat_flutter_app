import 'package:flutter/material.dart';

class CallingPage extends StatelessWidget {
  final String name;
  final String imagePath;

  CallingPage({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 60,
              ),
              SizedBox(height: 20),
              Text(
                name,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Calling...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      child: IconButton(
                        icon: Icon(Icons.mic_off, color: Colors.white),
                        onPressed: () {
                          // Add mute functionality here
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mute',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 30,
                      child: IconButton(
                        icon: Icon(Icons.call_end, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop(); // End the call
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'End',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      child: IconButton(
                        icon: Icon(Icons.volume_up, color: Colors.white),
                        onPressed: () {
                          // Add speakerphone functionality here
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Speaker',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
