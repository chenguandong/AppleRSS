import 'package:flutter/material.dart';
import 'package:flutter_app/rss/apple_list_view.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaffoldRoute();
  }
}

class _ScaffoldRoute extends State<ScaffoldRoute> {
  final List<MenuItemBean> menuItemList = [
    MenuItemBean("播客",
        "https://rss.itunes.apple.com/api/v1/cn/podcasts/top-podcasts/all/100/explicit.json"),
    MenuItemBean("音乐",
        "https://rss.itunes.apple.com/api/v1/cn/apple-music/hot-tracks/all/100/explicit.json"),
    MenuItemBean("应用",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/top-free/all/100/explicit.json"),
  ];
  int _selectedIndex = 1;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: menuItemList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Apple RSS"),
            bottom: new TabBar(
              tabs: menuItemList.map<Widget>((MenuItemBean choice) {
                return Tab(
                  text: choice.menuTitle,
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: menuItemList.map<Widget>((MenuItemBean choice) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: new AppleListView(
                    choice.menuTitle, choice.menuUrl),
              );
            }).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.blue,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  backgroundColor: Colors.red,
                  icon: Icon(Icons.music_note),
                  title: Text('Music')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), title: Text('App')),
              BottomNavigationBarItem(
                  backgroundColor: Colors.red,
                  icon: Icon(Icons.desktop_mac), title: Text('Mac')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_library), title: Text('U')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed), title: Text('Bodcast')),
            ],
          ),
        ));
  }
}

class MenuItemBean {
  final String menuTitle;
  final String menuUrl;

  MenuItemBean(this.menuTitle, this.menuUrl);
}
