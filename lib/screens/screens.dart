import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamster_kombat_web/screens/mine_screen.dart';

import '../constants.dart';
import 'game_screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int _selectedIndex = 0;
  final List<String> _titles = [
    'Exchange',
    'Mine',
    'Games',
    'Friends',
    'Earn',
    'Airdrop'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap to Earn: Telegram Game'),
        // title: Text(_titles[_selectedIndex]),
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            GameScreen(),
            MineScreen(),
            // PigeonScreen(),
            // SearchScreen(),
            // const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: kBottomNavigationBarHeight,
              color:
                  kPrimaryColor, // Set background color of the BottomNavigationBar
            ),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    height: 40,
                    fit: BoxFit.contain,
                    'icons/binance.svg', // Icon for Home
                    // color:
                    //     kPrimaryLightColor, // Set icon color based on selected index
                  ),
                ),
                label: 'Exchange',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    height: 40,
                    fit: BoxFit.contain,
                    'icons/mining.svg', // Icon for Test
                  ),
                ),
                label: 'Mine',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 2
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    height: 40,
                    fit: BoxFit.contain,
                    'icons/group.svg', // Icon for Resources
                  ),
                ),
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 3
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    height: 40,
                    fit: BoxFit.contain,
                    'icons/wallet.svg', // Icon for Resources
                  ),
                ),
                label: 'Earn',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 4
                        ? kPrimaryColor
                        : Colors.transparent, // Set the selected item color
                    borderRadius: BorderRadius.circular(
                        10), // Set border radius for the selected item
                  ),
                  child: SvgPicture.asset(
                    height: 40,
                    fit: BoxFit.contain,
                    'icons/dollar.svg', // Icon for Resources
                  ),
                ),
                label: 'Airdrop',
              ),
            ],
            selectedItemColor: Colors
                .transparent, // Set transparent to hide default selection color
            currentIndex: _selectedIndex, // Set the current selected index
            onTap: _onItemTapped, // Handle tap events
            showSelectedLabels: true, // Hide default selected label
            showUnselectedLabels: true, // Hide default unselected label
            type: BottomNavigationBarType
                .fixed, // Ensure all icons are displayed with fixed width
          ),
        ],
      ),
    );
  }
}
