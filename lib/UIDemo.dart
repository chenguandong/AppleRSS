/**
 * 工程生成计数器Demo
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/view/ToolsView.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.name}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String name;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _age = '0';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _age = '$_counter';
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
      children: <Widget>[
        new Image.network(
          'https://i1.mifile.cn/a4/xmad_1548667203841_ieyof.jpg',
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("每个子项都是一个包含图标和文本的列2222222222222",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("放置在变量和函数中",
                          textAlign: TextAlign.start,
                          style: new TextStyle(
                            color: Colors.black12,
                            fontSize: 16,
                          )),
                    ],
                  )
                ],
              )),
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              Text("100",
                  style: new TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                  ))
            ],
          ),
        ),
        ToolsView(),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "首先，构建标题部分左边栏。将Column（"
              "列）放入Expanded中会拉伸该列以使用该行中的所有剩余空闲空间。 设置crossAxisAlignmen"
              "t属性值为CrossAxisAlignment.start，这会将该列中的子项左对齐。",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )),
        )
      ],
    );
  }

  
}
