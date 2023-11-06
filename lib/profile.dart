// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/home.dart';
import 'package:food/orderHistory.dart';

import 'package:food/payment.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class Item {
  final Color color;
  final String svgAsset;
  final String label;
  final Widget destinationScreen;

  Item(
      {required this.label,
      required this.svgAsset,
      required this.color,
      required this.destinationScreen});
}

List<Item> items = [
  Item(
    label: 'Orders History',
    svgAsset: 'assets/vectors/menu.svg',
    color: const Color(0xFF4C8DE7),
    destinationScreen: const OrderHistoryItem(),
  ),
  Item(
    label: 'Payment Method',
    svgAsset: 'assets/vectors/card.svg',
    color: const Color(0xFF8ABE4E),
    destinationScreen: const Payment(),
  ),
  Item(
    label: 'Reward Credits',
    svgAsset: 'assets/vectors/star.svg',
    color: const Color(0xFFF55525),
    destinationScreen: const Home(),
  ),
  Item(
    label: 'Settings',
    svgAsset: 'assets/vectors/setting.svg',
    color: const Color(0xFFF8A627),
    destinationScreen: const Home(),
  ),
  Item(
    label: 'Invite Friends',
    svgAsset: 'assets/vectors/user.svg',
    color: const Color(0xFFF2E3C2),
    destinationScreen: const Home(),
  ),
];

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFDB166E),
            height: 300,
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/vectors/setting.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 20,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/avt_men.png',
                  width: 100,
                  height: 100,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Erik Walters",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "0383 zendar park",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(items.length, (index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: items[index].color,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  items[index].svgAsset,
                                  width: 24,
                                  height: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              items[index].label,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => items[index]
                                        .destinationScreen, // Điều hướng
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                'assets/vectors/chevron-right.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
