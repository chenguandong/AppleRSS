import 'package:flutter/material.dart';
import 'package:flutter_app/rss/main_drawer_view.dart';
import 'package:flutter_app/rss/scaffold_route_view.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Index();
  }
}

class _Index extends State<Index> with SingleTickerProviderStateMixin {
  //定义底部导航Tab
  TabController _tabController;

  int _selectedIndex = 0;
  @override
  void initState() {
    _tabController = new TabController(
        vsync: this, //动画处理参数
        length: 5 //控制Tab的数量
        ); //底部主导航栏控制器

    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
     /* setState(() {

      });*/
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: new Text('Apple RSS'),
          leading: IconButton(
              icon: Icon(Icons.language, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              }),
        ), //头部的标题AppBar
        drawer: MyDrawer(),
        body: TabBarView(controller: _tabController, children: [
          ScaffoldRoute(0),
          ScaffoldRoute(1),
          ScaffoldRoute(2),
          ScaffoldRoute(3),
          ScaffoldRoute(4)
        ]),
        bottomNavigationBar:  BottomNavigationBar(
          fixedColor: Colors.blue,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.music_note),
                title: Text('AppleMusic')),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.apps),
                title: Text('iOS App')),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.desktop_mac),
                title: Text('Mac App')),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.video_library),
                title: Text('iTunes U')),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.rss_feed),
                title: Text('播客')),
          ],
        ),
    );

  }
}
