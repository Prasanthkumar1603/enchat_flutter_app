import 'dart:ui';
import 'package:flutter/material.dart';
import 'OtpVerificationScreen.dart';

class PhoneNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/1.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          // Glassmorphic effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Text(
                          "Two Factor Authentication",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Image.asset(
                            'lib/assets/illustration.png'), // Replace with your image asset
                        // SizedBox(height: 20),
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Once verified, the next time you log in, you will be required to enter the verification code.',
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        Container(
                          // decoration: BoxDecoration(
                          //   color: Color(0xFFEFE9FE).withOpacity(0.8),
                          //   borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(20.0),
                          //     topRight: Radius.circular(20.0),
                          //   ),
                          // ),
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                'Verify your identity with',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50.0), // Adjusted radius
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.sms),
                                  title: Text('SMS'),
                                  subtitle: Text('+91  90478 42657'),
                                  onTap: () {
                                    // Navigate to OTP screen with phone number
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OtpVerificationScreen(
                                          phoneNumber: '+91 9047842657',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.white // Adjusted radius
                                    ),
                                child: ListTile(
                                  leading: Icon(Icons.security),
                                  title: Text('Google Authenticator'),
                                  subtitle:
                                      Text('You\'ll find the code in the app'),
                                  onTap: () {
                                    // Navigate to OTP screen (assumed for Google Authenticator)
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            OtpVerificationScreen(
                                          phoneNumber:
                                              'Google Authenticator', // Adjust as needed
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  // Handle register new device action
                                },
                                child: Text('Register new device'),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
