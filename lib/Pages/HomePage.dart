import 'package:flutter/material.dart';
import 'ChartPage.dart';
import 'CallsPage.dart';
import 'ContactsPage.dart';
import 'package:en_chat/Pages/ChartPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ChatsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Border color
              width: 1.0, // Border width
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff00E4E3), // Navigation bar color
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xff00E4E3),
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff00E4E3),
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff00E4E3),
              icon: Icon(
                Icons.contacts,
              ),
              label: 'Contacts',
            ),
          ],
        ),
      ),
    );
  }
}
