import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/list_production.dart';
import 'package:food/screen_appbar/appbar_item.dart';
import 'package:food/screen_appbar/pageFavoriesInItem.dart';

class TESTVIEW extends StatefulWidget {
  const TESTVIEW({super.key});

  @override
  State<TESTVIEW> createState() => _TESTVIEWState();
}

class _TESTVIEWState extends State<TESTVIEW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarScreen(),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.restart_alt_outlined)),
            ),
          )
        ],
      ),
    );
  }
}

