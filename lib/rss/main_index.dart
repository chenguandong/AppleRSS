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
  int _currentIndex = 0;

  //定义底部导航Tab
  TabController _tabController;

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

  //定义底部导航项目
  final List<Tab> _bottomTabs = <Tab>[
    Tab(icon: Icon(Icons.music_note), text: 'AppleMusic'),
    Tab(icon: Icon(Icons.apps), text: 'iOS App'),
    Tab(icon: Icon(Icons.desktop_mac), text: 'Mac App'),
    Tab(icon: Icon(Icons.video_library), text: 'iTunes U'),
    Tab(icon: Icon(Icons.rss_feed), text: '播客'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepOrange,
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
        bottomNavigationBar: new Material(
          color: Colors.deepOrange, //底部导航栏主题颜色
          child: new TabBar(
            isScrollable:false;
            controller: _tabController,
            tabs: _bottomTabs,
            indicatorColor: Colors.transparent, //tab标签的下划线颜色
          ),
        )

        /*BottomNavigationBar(
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
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
      ),*/
        );
  }
}
