import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamster_kombat_web/constants.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  int _score = 0;
  double _buttonScale = 1.0;
  double _progress = 0.0;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1.0,
    )..addListener(() {
        setState(() {
          _buttonScale = _animationController!.value;
        });
      });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  // void _incrementScore() {
  //   _animationController?.forward().then((_) {
  //     _animationController?.reverse();
  //   });
  //   setState(() {
  //     _score++;
  //     _progress = (_score % 100) / 100.0; // Example progress calculation
  //   });
  // }

  void _incrementScore() {
    setState(() {
      _score++;
      _progress = (_score % 100) / 100.0; // Example progress calculation
    });
    _animationController!
        .forward()
        .then((_) => _animationController!.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProfileSection('Emile', Icons.person),
                        _buildProfileSection(
                            'Binance', Icons.account_balance_wallet),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Earn per tap',
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          width: 20,
                                          height: 20,
                                          'icons/dollar.svg'),
                                      const Text('+1'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Coins to level up',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
                                  Text('1M'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Profit per hour',
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          width: 20,
                                          height: 20,
                                          'icons/dollar.svg'),
                                      const Text('+636.92K'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          width: 50, height: 45, 'icons/dollar.svg'),
                      Text(
                        '$_score',
                        style: const TextStyle(
                          color: kPrimaryLightColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 300, // Adjust the width as needed
                    child: LinearProgressIndicator(
                      value: _progress,
                      backgroundColor: Colors.grey[700],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(kPrimaryColor),
                      minHeight: 10.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: _incrementScore,
                    child: Transform.scale(
                      scale: _buttonScale,
                      child: Material(
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: kPrimaryColor, width: 4.0),
                          ),
                          child: CircleAvatar(
                            radius: 76.0,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image.asset(
                                'images/main-character.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  _buildBoost(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(String name, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: kPrimaryColor),
        const SizedBox(width: 8.0),
        Text(
          name,
          style: const TextStyle(color: kPrimaryLightColor),
        ),
      ],
    );
  }

  Widget _buildBoost() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.flash_on_rounded,
                color: kPrimaryColor,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text('6500 / 6500'),
            ],
          ),
          Text('Boost'),
        ],
      ),
    );
  }
}
