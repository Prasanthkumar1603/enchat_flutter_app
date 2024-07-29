import 'dart:ui';

import 'package:flutter/material.dart';

class ViewProfilePage extends StatelessWidget {
  final String name;
  final String imagePath;
  final String about;
  final String email;

  ViewProfilePage({
    required this.name,
    required this.imagePath,
    required this.about,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00E4E3),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: 2000,
        child: Stack(
          children: [
            // Background image with glass effect
            Positioned.fill(
              child: Image.asset(
                'lib/assets/1.png', // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 50,
                  ),
                  SizedBox(height: 20),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Id no:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "12123123",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'About:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    about,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileActionButton(
                        icon: Icons.share,
                        label: 'Share',
                        onTap: () {
                          // Implement share action
                        },
                      ),
                      ProfileActionButton(
                        icon: Icons.message,
                        label: 'Message',
                        onTap: () {
                          // Implement message action
                        },
                      ),
                      ProfileActionButton(
                        icon: Icons.call,
                        label: 'Call',
                        onTap: () {
                          // Implement call action
                        },
                      ),
                      ProfileActionButton(
                        icon: Icons.report,
                        label: 'Report',
                        onTap: () {
                          // Implement report action
                        },
                      ),
                      ProfileActionButton(
                        icon: Icons.more_vert,
                        label: 'More',
                        onTap: () {
                          // Implement more action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.blue,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
