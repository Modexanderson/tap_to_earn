import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart'; // Ensure you have this dependency in your pubspec.yaml

class MineScreen extends StatefulWidget {
  const MineScreen({super.key});

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                                    'icons/dollar.svg',
                                    width: 20,
                                    height: 20,
                                  ),
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
                                    'icons/dollar.svg',
                                    width: 20,
                                    height: 20,
                                  ),
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
                    'icons/dollar.svg',
                    width: 50,
                    height: 45,
                  ),
                  const Text(
                    '2',
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Daily Combo'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'icons/dollar.svg',
                            width: 20,
                            height: 20,
                          ),
                          const Text(
                            '+5,000,000',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildComboCard(
                      image: 'icons/japan.svg', title: 'Licence Japan'),
                  _buildComboCard(image: 'icons/hamster.svg', title: 'QA Team'),
                  _buildComboCard(image: 'icons/meme.svg', title: 'Meme Coins'),
                ],
              ),
              const SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(const Radius.circular(10))),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Markets'),
                  Tab(text: 'PR & Team'),
                  Tab(text: 'Legal'),
                  Tab(text: 'Special'),
                ],
              ),
              SizedBox(
                height: 200, // Set an appropriate height for the TabBarView
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(child: Text('Markets')),
                    Center(child: Text('PR & Team')),
                    Center(child: Text('Legal')),
                    Center(child: Text('Special')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComboCard({required String image, required String title}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SvgPicture.asset(
              image,
              width: 40,
            ),
            const SizedBox(height: 20),
            Text(title),
          ],
        ),
      ),
    );
  }
}
