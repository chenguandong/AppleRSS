import 'package:flutter/material.dart';
import 'package:flutter_app/rss/apple_list_view.dart';
import 'package:flutter_app/rss/beans/menu_item_bean.dart';
import 'package:flutter_app/rss/main_drawer_view.dart';

class ScaffoldRoute extends StatefulWidget {
  int onIndex ;

  List<MenuItemBean> showMenuList = [];
  int pageLength = 0;
  int _selectedIndex ;

  final List<MenuItemBean> appleMusicItemList1 = [
    MenuItemBean("Coming Soon",
        "https://rss.itunes.apple.com/api/v1/cn/apple-music/coming-soon/all/100/explicit.json"),
    MenuItemBean("热门歌曲",
        "https://rss.itunes.apple.com/api/v1/cn/apple-music/hot-tracks/all/100/explicit.json"),
    MenuItemBean("New Releases",
        "https://rss.itunes.apple.com/api/v1/cn/apple-music/new-releases/all/100/explicit.json"),
    MenuItemBean("专辑排行",
        "https://rss.itunes.apple.com/api/v1/cn/apple-music/top-albums/all/100/explicit.json"),
    MenuItemBean("歌曲排行",
        "https://rss.itunes.apple.com/api/v1/cn/apple-music/top-songs/all/100/explicit.json"),
  ];

  final List<MenuItemBean> iOSAppItemList2 = [
    MenuItemBean("新鲜App",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/new-apps-we-love/all/100/explicit.json"),
    MenuItemBean("本周新游",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/new-games-we-love/all/100/explicit.json"),
    MenuItemBean("免费排行",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/top-free/all/100/explicit.json"),
    MenuItemBean("免费排行-iPad App",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/top-free-ipad/all/100/explicit.json"),
    MenuItemBean("畅销排行",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/top-grossing/all/100/explicit.json"),
    MenuItemBean("畅销排行-iPad App",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/top-grossing-ipad/all/100/explicit.json"),
    MenuItemBean("付费排行",
        "https://rss.itunes.apple.com/api/v1/cn/ios-apps/top-paid/all/100/explicit.json"),
  ];

  final List<MenuItemBean> macAppItemList3 = [
    MenuItemBean("免费排行-Mac App",
        "https://rss.itunes.apple.com/api/v1/cn/macos-apps/top-free-mac-apps/all/100/explicit.json"),
    MenuItemBean("畅销排行-Mac App",
        "https://rss.itunes.apple.com/api/v1/cn/macos-apps/top-grossing-mac-apps/all/100/explicit.json"),
    MenuItemBean("Mac App排行",
        "https://rss.itunes.apple.com/api/v1/cn/macos-apps/top-mac-apps/all/100/explicit.json"),
    MenuItemBean("付费排行-Mac App ",
        "https://rss.itunes.apple.com/api/v1/cn/macos-apps/top-paid-mac-apps/all/100/explicit.json"),
  ];

  final List<MenuItemBean> iTunesUItemList4 = [
    MenuItemBean("iTunes U课程排行",
        "https://rss.itunes.apple.com/api/v1/cn/itunes-u/top-itunes-u-courses/all/100/explicit.json"),
  ];

  final List<MenuItemBean> bokeItemList5 = [
    MenuItemBean("播客排行",
        "https://rss.itunes.apple.com/api/v1/cn/podcasts/top-podcasts/all/100/explicit.json"),
  ];


  ScaffoldRoute(this.onIndex);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScaffoldRoute();
  }
}

class _ScaffoldRoute extends State<ScaffoldRoute> {

  @override
  void initState() {
    initDataList();
    super.initState();
  }

  void initDataList() {
    widget._selectedIndex = widget.onIndex;
    widget.showMenuList.clear();
    if (widget._selectedIndex == 0) {
      widget.showMenuList.addAll(widget.appleMusicItemList1);
    } else if (widget._selectedIndex == 1) {
      widget.showMenuList.addAll(widget.iOSAppItemList2);
    } else if (widget._selectedIndex == 2) {
      widget.showMenuList.addAll(widget.macAppItemList3);
    } else if (widget._selectedIndex == 3) {
      widget.showMenuList.addAll(widget.iTunesUItemList4);
    } else if (widget._selectedIndex == 4) {
      widget.showMenuList.addAll(widget.bokeItemList5);
    }
    widget.pageLength = widget.showMenuList.length;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return DefaultTabController(
        length: widget.pageLength,
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text("Apple RSS"),
            leading: IconButton(
                icon: Icon(Icons.language, color: Colors.white), //自定义图标
                onPressed: () {
                  // 打开抽屉菜单
                  Scaffold.of(context).openDrawer();
                }),
            bottom: new TabBar(
              isScrollable: true,
              tabs: widget.showMenuList.map<Widget>((MenuItemBean choice) {
                return Tab(
                  text: choice.menuTitle,
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
              children: widget.showMenuList.map<Widget>((MenuItemBean choice) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new AppleListView(choice.menuTitle, choice.menuUrl),
                );
              }).toList(),
          ),
        ));
  }
}
