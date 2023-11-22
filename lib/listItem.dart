import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/list_production.dart';
import 'package:food/screen_appbar/appbarScreen.dart';
import 'package:food/screen_appbar/pageFavoriesInItem.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final PageController controller = PageController();

  late TabController _tabController;

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
    return Scaffold(
      body: Column(
        children: [
          const AppbarScreen(),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: const FavoriesInItemPage()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.restart_alt_outlined)),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
