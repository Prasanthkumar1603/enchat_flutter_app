import 'dart:ui';

import 'package:flutter/material.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<String> requests = [
    "Mr. Bean",
    "Bala",
    "Sathya",
    "Ruba",
    "Pavi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requests',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff00E4E3),
      ),
      body: Stack(
        children: [
          // Background image with glassy effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color:
                    Colors.black.withOpacity(0.5), // Adjust opacity as needed
              ),
            ),
          ),
          // ListView of requests
          ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              return _buildRequestItem(requests[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRequestItem(String request) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("lib/assets/R.png"),
        ),
        title: Text(request),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                _handleAcceptRequest(request);
              },
              icon: Icon(Icons.check, color: Colors.green), // Accept icon
            ),
            SizedBox(width: 6),
            IconButton(
              onPressed: () {
                _handleRejectRequest(request);
              },
              icon: Icon(Icons.close, color: Colors.red), // Reject icon
            ),
          ],
        ),
      ),
    );
  }

  void _handleAcceptRequest(String request) {
    // Handle accept logic here
    setState(() {
      requests.remove(request); // Remove accepted request from the list
    });
    // Additional logic as per your requirements
  }

  void _handleRejectRequest(String request) {
    // Handle reject logic here
    setState(() {
      requests.remove(request); // Remove rejected request from the list
    });
    // Additional logic as per your requirements
  }
}
