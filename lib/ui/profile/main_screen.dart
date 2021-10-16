import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:transport/ui/profile/profile_widget_modal.dart';
import 'package:transport/ui/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black);
  List<Widget> _widgetOptions = [
    HomePage(),
    dragable(),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
    Text(
      'Ещё',
      style: optionStyle,
    ),
  ];
  static DraggableScrollableSheet dragable() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.2,
      maxChildSize: 0.6,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.blue[100],
          height: 300,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 5,
            activeColor: Colors.white,
            iconSize: 22,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.blueBase,
            color: AppColors.grey,
            tabs: const [
              GButton(
                icon: LineIcons.user,
                text: 'Профиль',
              ),
              GButton(
                icon: LineIcons.map,
                text: 'Маршрут',
              ),
              GButton(
                icon: LineIcons.bus,
                text: 'Транспорт',
              ),
              GButton(
                icon: LineIcons.bell,
                text: 'Уведомления',
              ),
              GButton(
                icon: LineIcons.alignJustify,
                text: 'Еще',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
