import 'package:flutter/material.dart';
import 'package:flutter_app/rss/scaffold_route_view.dart';
class Index extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Index();
  }

}

class _Index extends State<Index>{
  int _currentIndex = 0;
  StatefulWidget _currentPage;
  List<StatefulWidget>itemViews = [
    new ScaffoldRoute(0),
    new ScaffoldRoute(1),
    new ScaffoldRoute(2),
    new ScaffoldRoute(3),
    new ScaffoldRoute(4)
  ];

  @override
  void initState() {
    // TODO: implement initState
    _currentPage = itemViews[_currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

      body: _currentPage,

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _currentPage = itemViews[_currentIndex];
          });
        },
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