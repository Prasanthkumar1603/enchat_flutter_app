import 'package:flutter/material.dart';
import 'dart:ui';

import 'CallingPage.dart';
import 'ViewProfilePage.dart';
import 'SimpleGamePage.dart'; // Import the game page

// Define a class to represent a message
class Message {
  final String text;
  final bool
      isSender; // true if the message is sent by the user, false if received

  Message({required this.text, required this.isSender});
}

class ChatScreen extends StatefulWidget {
  final String name;
  final String imagePath;

  ChatScreen({required this.name, required this.imagePath});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<Message> _messages = [];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // Function to handle automatic reply after a delay
  void _handleAutomaticReply(String messageText) {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _messages.add(Message(
            text: 'Hi, how are you?', isSender: false)); // Reply message
      });
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00E4E3),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CallingPage(
                    name: widget.name,
                    imagePath: widget.imagePath,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.play_circle_outline,
                color: Colors.white), // Updated icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SimpleGamePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image with glass effect
          Positioned.fill(
            child: Image.asset(
              'lib/assets/1.png',
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
          Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                backgroundImage: AssetImage(widget.imagePath),
                radius: 50,
              ),
              SizedBox(height: 20),
              Text(widget.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Text('En Chat',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              Text("You're friends on En Chat",
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              Text('New En Chat Account',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the view profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewProfilePage(
                        name: widget.name,
                        imagePath: widget.imagePath,
                        about: "This is a sample about section.",
                        email: "example@example.com",
                      ),
                    ),
                  );
                },
                child: Text('VIEW PROFILE'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xffA060FF),
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
              SizedBox(height: 10),
              Text('APR 14 AT 1:15 PM',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    if (message.isSender) {
                      // If the message is sent by the user
                      return Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Color(0xff00E4E3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    } else {
                      // If the message is received
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Color(0xffA060FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type messages...',
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: Color(0xff00E4E3)),
                      onPressed: () {
                        setState(() {
                          if (_messageController.text.isNotEmpty) {
                            final messageText = _messageController.text;
                            _messages.add(
                                Message(text: messageText, isSender: true));
                            _messageController.clear();
                            _handleAutomaticReply(
                                messageText); // Handle automatic reply
                          }
                        });
                        _scrollToBottom();
                      },
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
