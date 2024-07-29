import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Calls'),
            backgroundColor: Color(0xff00E4E3),
            actions: [
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  // Handle camera icon pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Handle search icon pressed
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  // Handle more icon pressed
                },
              ),
            ],
            floating: true,
            pinned: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildCallItem('BALAJI Whytap Frd', 'June 13, 12:46 PM',
                    Icons.call, Colors.green, 'lib/assets/p2.jpeg'),
                _buildCallItem(
                    'Thangachi',
                    'June 12, 6:08 PM',
                    Icons.videocam,
                    Colors.green,
                    'lib/assets/Screenshot_16-6-2024_21381_web.whatsapp.com.jpeg'),
                _buildCallItem(
                    'Kalishwari Frd (3)',
                    'June 12, 12:34 PM',
                    Icons.videocam,
                    Colors.green,
                    'lib/assets/Screenshot_16-6-2024_213842_web.whatsapp.com.jpeg'),
                _buildCallItem(
                    'Kalishwari Frd (4)',
                    'June 11, 10:19 PM',
                    Icons.videocam,
                    Colors.green,
                    'lib/assets/Screenshot_16-6-2024_213842_web.whatsapp.com.jpeg'),
                _buildCallItem('Ajith Whytap Frd', 'June 10, 11:19 PM',
                    Icons.call, Colors.green, 'lib/assets/R.png'),
                _buildCallItem('Appa', 'June 10, 9:15 PM', Icons.call,
                    Colors.green, 'lib/assets/p5.jpeg'),
                _buildCallItem('Appa', 'June 10, 8:26 PM', Icons.call,
                    Colors.red, 'lib/assets/p5.jpeg'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new call button pressed
        },
        child: Icon(Icons.add_call),
        backgroundColor: Color(0xff25D366),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildCallItem(String name, String time, IconData icon,
      Color iconColor, String imagePath) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      subtitle: Text(time),
      trailing: Icon(icon, color: iconColor),
      onTap: () {
        // Handle call item tapped
      },
    );
  }
}
