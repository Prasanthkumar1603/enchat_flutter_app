import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'HomePage.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  OtpVerificationScreen({required this.phoneNumber});

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _focusNodes;
  int _remainingTime = 20;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _otpControllers = [
      _otpController1,
      _otpController2,
      _otpController3,
      _otpController4
    ];
    _focusNodes = List.generate(4, (index) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    if (otp.length == 4) {
      FocusScope.of(context).unfocus();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Verified'),
            content: Text('OTP Verified Successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  Widget _buildOtpTextField(int index) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          controller: _otpControllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
          keyboardType: TextInputType.number,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index < 3) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else {
                _verifyOtp();
              }
            } else {
              if (index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            }
          },
        ),
      ),
    );
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    "We've sent you a code",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'the code was sent to ${widget.phoneNumber}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(4, (index) => _buildOtpTextField(index)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Resend code in 0:${_remainingTime.toString().padLeft(2, '0')}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
