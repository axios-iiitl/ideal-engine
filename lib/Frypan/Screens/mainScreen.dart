import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'New_Post/newpost.dart';
import 'anonymous.dart';
import 'news_feed.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  final bool anynewpost;
  const MainScreen({Key key, this.anynewpost}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool anynewpost = false;
  _MainScreenState({this.anynewpost});
  PageController _pageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  List<Widget> tabPages = [Anonymous(), NewPost(), NewsFeed(), Profile()];

  void onItemTapped(int index) {
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
      backgroundColor: Colors.grey,
      key: _scaffoldKey,
      drawer: Drawer(
        child: Theme(
          data: Theme.of(context).copyWith(
              accentColor: Colors.black, unselectedWidgetColor: Colors.black),
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ),
              ExpansionTile(
                children: [
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          onItemTapped(0);
                        },
                        child: Row(
                          children: [
                            Icon(MdiIcons.accountGroupOutline),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                  "Anonymous",
                                  style: TextStyle(fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          onItemTapped(2);
                        },
                        child: Row(
                          children: [
                            Icon(MdiIcons.accountGroupOutline),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                "News Feed",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                title: Row(
                  children: [
                    Icon(Icons.chat_bubble_outline),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Frypan",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(MdiIcons.officeBuildingMarkerOutline),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Hostel Management",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.sports_handball_outlined),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Sports",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(MdiIcons.hand),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "Attendance",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              onItemTapped(3);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.account_circle_outlined,
                size: 25,
              ),
            ),
          )
        ],
        title: const Text('Axios App'),
        leading: new IconButton(
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
          icon: Icon(
            Icons.list,
            size: 25,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      /* bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              MdiIcons.incognito,
              size: 20,
            ),
            label: 'Anonymous',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.add_circle_outline_outlined,
              size: 20,
            ),
            label: 'New Post',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.article_outlined,
              size: 20,
            ),
            label: 'News Feed',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.account_circle_outlined,
              size: 20,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ), */
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._selectedIndex = page;
    });
  }

  void onTabTapped(int index) {
    if (anynewpost == true)
      this._pageController.animateToPage(1,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
