import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
import 'package:en_chat/Pages/CameraPage.dart'; // Import your CameraPage.dart
import 'AddFriendsPage.dart';
import 'RequestsPage.dart';
import 'SearchPage.dart';
import 'ChatScreen.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xff00E4E3),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Chats",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.white),
                            onPressed: () {
                              // final cameras = await availableCameras();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CameraPage(cameras),
                              //   ),
                              // );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchPage()),
                              );
                            },
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
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 101.0, // Height for the stories section
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildAddStoryItem(context),
                _buildYourStoryItem(
                    'lib/assets/WhatsApp Image 2024-05-18 at 11.45.40 PM.jpeg',
                    'Your Story'),
                _buildStoryItem('lib/assets/p1.jpeg', 'Appa'),
                _buildStoryItem('lib/assets/p2.jpeg', 'Vimal Macha'),
                _buildStoryItem('lib/assets/p3.jpeg', 'Kaviya Clg Frd'),
                _buildStoryItem('lib/assets/p4.jpeg', 'Angry bird part two 🐥'),
                _buildStoryItem('lib/assets/p5.jpeg', 'Oru latcham appu😧😥'),
                _buildStoryItem('lib/assets/p6.jpeg', 'Balaji whytap frd'),
                _buildStoryItem('lib/assets/p7.jpeg', 'Raji whytap frd'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildChatItem("Appa", "Voice call · In call", "9:15 PM",
                    Color(0xffA060FF), true, 'lib/assets/p5.jpeg', context),
                _buildChatItem("Vimal Macha", "Group call", "6/10/24",
                    Colors.grey, false, 'lib/assets/p6.jpeg', context),
                _buildChatItem("Kaviya Clg Frd", "Photo", "6/10/24",
                    Colors.blue, false, 'lib/assets/p7.jpeg', context),
                _buildChatItem("Angry bird part two 🐥", "tq❤️", "6/8/24",
                    Colors.grey, true, 'lib/assets/p1.jpeg', context),
                _buildChatItem(
                    "Oru latcham appu😧😥",
                    "Ajit whytap frd: hello frds....",
                    "5/23/24",
                    Colors.blue,
                    false,
                    'lib/assets/p3.jpeg',
                    context),
                _buildChatItem(
                    "Balaji whytap frd",
                    "nalaikku varuviya",
                    "5/23/24",
                    Colors.grey,
                    false,
                    'lib/assets/p2.jpeg',
                    context),
                _buildChatItem("Raji whytap frd", "Your Welcome", "9:15 PM",
                    Color(0xffA060FF), false, 'lib/assets/p4.jpeg', context),
                _buildChatItem(
                    "நாராயணன்",
                    "Hi da",
                    "6/10/24",
                    Colors.grey,
                    false,
                    'lib/assets/Screenshot_16-6-2024_212731_web.whatsapp.com.jpeg',
                    context),
                _buildChatItem(
                    "Ramya Clg Frd",
                    "enna pantra",
                    "6/10/24",
                    Colors.blue,
                    false,
                    'lib/assets/Screenshot_16-6-2024_212612_web.whatsapp.com.jpeg',
                    context),
                _buildChatItem(
                    "Thangachi",
                    "Group call",
                    "6/8/24",
                    Colors.grey,
                    false,
                    'lib/assets/Screenshot_16-6-2024_21381_web.whatsapp.com.jpeg',
                    context),
                _buildChatItem(
                    "Prem",
                    "Ho",
                    "5/23/24",
                    Colors.blue,
                    false,
                    'lib/assets/Screenshot_16-6-2024_213842_web.whatsapp.com.jpeg',
                    context),
                _buildChatItem(
                    "Maya whytap",
                    "helo",
                    "5/23/24",
                    Colors.grey,
                    true,
                    'lib/assets/Screenshot_16-6-2024_214148_web.whatsapp.com.jpeg',
                    context),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 230.0,
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Kumar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                accountEmail: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID no: 92893727",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                      'lib/assets/WhatsApp Image 2024-05-18 at 11.45.40 PM.jpeg'),
                  radius: 40,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff00E4E3),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('View Profile'),
              onTap: () {
                // Navigate to profile view
                // You can add navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('Add Contact'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddFriendsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.mobile_friendly),
              title: Text('Requests'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RequestsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle the onTap action for Settings
              },
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text('Customer Care'),
              onTap: () {
                // Handle the onTap action for Customer Care
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
              onTap: () {
                // Handle the onTap action for Share
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete Account'),
              onTap: () {
                // Handle the onTap action for Delete Account
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.message),
      //   backgroundColor: Colors.green,
      // ),
    );
  }

  Widget _buildAddStoryItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              // final cameras = await availableCameras();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CameraPage(cameras),
              //   ),
              // );
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.add, size: 30, color: Colors.black),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Add Story',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildYourStoryItem(String imagePath, String userName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 5),
          Text(
            userName,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String imagePath, String userName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 5),
          Text(
            userName,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(String name, String message, String time,
      Color iconColor, bool isInCall, String imagePath, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(color: Colors.grey)),
          if (isInCall) Icon(Icons.check_circle, color: Color(0xffA060FF)),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(name: name, imagePath: imagePath),
          ),
        );
      },
    );
  }
}
