import 'package:flutter/material.dart';
import 'package:pakasep/utility/style.dart';

class Menu extends StatefulWidget {
  @override
  Menu({Key key}) : super(key: key);
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedDestination = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'MENU',
                style: menu700Dark,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 30.0,
              ),
              title: Text(
                'Home',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                size: 30.0,
              ),
              title: Text(
                'Profile',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: Icon(
                Icons.not_interested,
                size: 30.0,
              ),
              title: Text(
                'Perumahan',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
            ),
            ListTile(
              leading: Icon(
                Icons.contact_support,
                size: 30.0,
              ),
              title: Text(
                'Developer',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
            ),
            ListTile(
              leading: Icon(
                Icons.chat_bubble,
                size: 30.0,
              ),
              title: Text(
                'Cek Status',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 4,
              onTap: () => selectDestination(4),
            ),
            ListTile(
              leading: Icon(
                Icons.save_alt_rounded,
                size: 30.0,
              ),
              title: Text(
                'Simulasi',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 5,
              onTap: () => selectDestination(5),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 30.0,
              ),
              title: Text(
                'Lain-lain',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 6,
              onTap: () => selectDestination(6),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 30.0,
              ),
              title: Text(
                'Logout',
                style: menu700Dark,
              ),
              selected: _selectedDestination == 7,
              onTap: () => selectDestination(7),
            ),
          ],
        ),
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
