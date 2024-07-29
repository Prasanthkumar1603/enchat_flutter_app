import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String status;
  final String avatarUrl;

  Contact({required this.name, required this.status, required this.avatarUrl});
}

class ContactsPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'My Undans (You)',
        status: 'Message yourself',
        avatarUrl:
            'lib/assets/Screenshot_15-6-2024_164637_web.whatsapp.com.jpeg'),
    Contact(
        name: 'Muthamizh Selven (DEV)',
        status: 'Real is Rare Fake is Everywhere',
        avatarUrl: 'lib/assets/R.png'),
    Contact(name: 'Mubliha Bestie', status: '', avatarUrl: 'lib/assets/R.png'),
    Contact(
        name: 'Nandhu Kutty.',
        status:
            'Accept your PAST without regret handle your PRESENT with confidence and fa…',
        avatarUrl: 'lib/assets/R.png'),
    Contact(name: 'Rithika', status: 'Sam', avatarUrl: 'lib/assets/R.png'),
    Contact(
        name: 'Aanath iOS Auditor',
        status: 'Hey there! I am using WhatsApp.',
        avatarUrl: 'lib/assets/R.png'),
    Contact(
        name: 'Aandavar Dharani', status: '', avatarUrl: 'lib/assets/R.png'),
    Contact(
        name: 'Abhi Zoho',
        status: 'Hey there! I am using WhatsApp.',
        avatarUrl: 'lib/assets/R.png'),
    Contact(
        name: 'Abi Anna KUMAR',
        status: 'D BLOODS',
        avatarUrl: 'lib/assets/R.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00E4E3),
        title: Text(
          'Select contact',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu selection
              if (value == 'Add Contact') {
                // Navigate to Add Contact page or show dialog
              } else if (value == 'Settings') {
                // Navigate to Settings page
              } else if (value == 'Customer Care') {
                // Navigate to Customer Care page or show dialog
              }
            },
            itemBuilder: (BuildContext context) {
              return {
                'View Profile',
                'Add Contact',
                'Requests',
                'Settings',
                'Customer Care',
                'Share',
                'Delete Account'
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(contact.avatarUrl),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.status),
          );
        },
      ),
    );
  }
}
