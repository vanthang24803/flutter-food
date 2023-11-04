import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/list_production.dart';

class AppBarItem extends StatefulWidget {
  const AppBarItem({super.key});

  @override
  State<AppBarItem> createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem>
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
    return SafeArea(
      child: Scaffold(
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
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                child: Text("STARTERS"),
              ),
              Tab(
                child: Text("MAINS"),
              ),
              Tab(
                child: Text("SIDES"),
              ),
              Tab(
                child: Text("DESSERTS"),
              )
            ],
            controller: _tabController,
            
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: PageView(
                children: [
                  ListProduction(
                    title: 'all',
                  )
                ],
              ),
            ),
            Center(
              child: Text("CHATS"),
            ),
            Center(
              child: Text("CONTACTS"),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/vectors/cook.svg",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/vectors/menu.svg",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/vectors/loading.svg",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/vectors/bell.svg",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/vectors/user.svg",
              ),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: (index) {
            print("HiSmile $index");
            setState(() {
              _selectedIndex = index;
              controller.jumpToPage(index);
            });
          },
          elevation: 5,
        ),
      ),
    );
  }
}
