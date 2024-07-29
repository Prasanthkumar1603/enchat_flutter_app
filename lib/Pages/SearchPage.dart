import 'package:flutter/material.dart';
import 'ChatScreen.dart'; // Import the ChatScreen here

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _allContacts = [
    {
      "name": "Appa",
      "message": "Voice call · In call",
      "time": "9:15 PM",
      "imagePath": 'lib/assets/p5.jpeg'
    },
    {
      "name": "Vimal Macha",
      "message": "Group call",
      "time": "6/10/24",
      "imagePath": 'lib/assets/p6.jpeg'
    },
    {
      "name": "Kaviya Clg Frd",
      "message": "Photo",
      "time": "6/10/24",
      "imagePath": 'lib/assets/p7.jpeg'
    },
    {
      "name": "Angry bird part two 🐥",
      "message": "tq❤️",
      "time": "6/8/24",
      "imagePath": 'lib/assets/p1.jpeg'
    },
    {
      "name": "Oru latcham appu😧😥",
      "message": "Ajit whytap frd: hello frds....",
      "time": "5/23/24",
      "imagePath": 'lib/assets/p3.jpeg'
    },
    {
      "name": "Balaji whytap frd",
      "message": "nalaikku varuviya",
      "time": "5/23/24",
      "imagePath": 'lib/assets/p2.jpeg'
    },
    {
      "name": "Raji whytap frd",
      "message": "Your Welcome",
      "time": "9:15 PM",
      "imagePath": 'lib/assets/p4.jpeg'
    },
  ];
  List<Map<String, String>> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts = _allContacts;
    _searchController.addListener(() {
      setState(() {
        _filteredContacts = _allContacts
            .where((contact) => contact['name']!
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff00E4E3),
      ),
      body: ListView.builder(
        itemCount: _filteredContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage(_filteredContacts[index]['imagePath']!),
            ),
            title: Text(_filteredContacts[index]['name']!),
            subtitle: Text(_filteredContacts[index]['message']!),
            trailing: Text(_filteredContacts[index]['time']!,
                style: TextStyle(color: Colors.grey)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    name: _filteredContacts[index]['name']!,
                    imagePath: _filteredContacts[index]['imagePath']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
