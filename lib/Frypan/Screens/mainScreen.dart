import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'New_Post/new_post.dart';
import 'anonymous.dart';
import 'news_feed.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  List<Widget> tabPages = [Anonymous(), NewPost(), NewsFeed(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    "Services",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
            ListTile(
              title: Center(
                  child: Text(
                "Frypan",
                style: TextStyle(fontSize: 17),
              )),
              onTap: null,
            ),
            ListTile(
              title: Center(
                  child: Text(
                "Hostel Management",
                style: TextStyle(fontSize: 17),
              )),
              onTap: null,
            ),
            ListTile(
              title: Center(
                  child: Text(
                "Sports",
                style: TextStyle(fontSize: 17),
              )),
              onTap: null,
            ),
            ListTile(
              title: Center(
                  child: Text(
                "Attendance",
                style: TextStyle(fontSize: 17),
              )),
              onTap: null,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(''),
        leading: new IconButton(
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
          icon: Icon(
            Icons.list,
            size: 35,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 20, 8),
            child: Icon(
              Icons.account_circle,
              size: 35,
            ),
          )
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              MdiIcons.incognitoCircle,
              color: Colors.white,
            ),
            label: 'Anonymous',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            label: 'New Post',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.article,
              color: Colors.white,
            ),
            label: 'News Feed',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._selectedIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}