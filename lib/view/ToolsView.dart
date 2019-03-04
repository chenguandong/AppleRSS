/**
 * 工程生成计数器Demo
 */
import 'package:flutter/material.dart';

class ToolsView extends StatefulWidget {
  ToolsView({Key key, this.title, this.name}) : super(key: key);

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
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ToolsView();
  }
}

class _ToolsView extends State<ToolsView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
          children: <Widget>[
            ToolsItemView(iconName:"PHONE",icons: Icons.phone,),
            ToolsItemView(iconName:"MESSAGE",icons: Icons.message,),
            ToolsItemView(iconName:"MAP",icons: Icons.map,)

          ],
        ));
  }
}


class ToolsItemView extends StatefulWidget {
  final String iconName;
  final IconData icons;
  const ToolsItemView({Key key, this.iconName, this.icons}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ToolsItemView();
  }


}

class _ToolsItemView extends State<ToolsItemView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            widget.icons,
            semanticLabel: "xx",
          ),
          Text(widget.iconName, style: TextStyle(
              fontSize: 12
          ),)
        ],
      ),
    );
  }

}