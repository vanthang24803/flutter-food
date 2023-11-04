// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/login.dart';
import 'package:food/profile.dart';
import 'package:food/search.dart';

class ContactItem extends StatefulWidget {
  const ContactItem({super.key});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final PageController controller = PageController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    ;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDB166E),
        title: const Text(
          "ALL CATEGORIS",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: PageView(
        controller: controller,
        children: const [
          Search(),
          Login(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/cook.svg",
              color:
                  _selectedIndex == 0 ? const Color(0xFFDB166E) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/menu.svg",
              color:
                  _selectedIndex == 1 ? const Color(0xFFDB166E) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/loading.svg",
              color:
                  _selectedIndex == 2 ? const Color(0xFFDB166E) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/bell.svg",
              color:
                  _selectedIndex == 3 ? const Color(0xFFDB166E) : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/user.svg",
              color:
                  _selectedIndex == 4 ? const Color(0xFFDB166E) : Colors.grey,
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            controller.jumpToPage(index);
          });
        },
        elevation: 5,
      ),
    );
  }
}
