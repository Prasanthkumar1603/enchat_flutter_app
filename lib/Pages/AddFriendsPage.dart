import 'package:flutter/material.dart';
import 'dart:ui';

class AddFriendsPage extends StatefulWidget {
  @override
  _AddFriendsPageState createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<AddFriendsPage> {
  List<String> requestedIds = []; // List to hold requested IDs

  TextEditingController idController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00E4E3),
        title: Text(
          'Add Friends',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Glass effect overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black
                  .withOpacity(0.2), // Adjust opacity for the glass effect
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enter ID no:',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: idController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter ID number',
                        fillColor: Colors.white.withOpacity(0.8),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                                context); // Navigate back to previous screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Red background color
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Handle request action
                            String id = idController.text.trim();
                            if (id.isNotEmpty) {
                              setState(() {
                                requestedIds
                                    .add(id); // Add ID to requested list
                                idController.clear(); // Clear text field
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // Blue background color
                          ),
                          child: Text(
                            'Request',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Request History:',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: requestedIds.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white.withOpacity(0.8),
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Text("Mr.Bean",
                                  style: TextStyle(color: Colors.black)),
                              subtitle: Text(requestedIds[index],
                                  style: TextStyle(color: Colors.black54)),
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('lib/assets/img.png'),
                              ),
                              trailing: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              // You can add more UI components as per your design
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
