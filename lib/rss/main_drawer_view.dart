import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/rss/beans/event_message.dart';
import 'package:flutter_app/rss/beans/menu_item_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyDrawer extends StatefulWidget{
  List<DrawerBean>countrysList = [

    DrawerBean("中国", "", "cn"),
    DrawerBean("丹麦", "", "dk"),
    DrawerBean("乌克兰", "", "ua"),
    DrawerBean("乌兹别克斯坦", "", "uz"),
    DrawerBean("乌干达", "", "ug"),
    DrawerBean("乌拉圭", "", "uy"),
    DrawerBean("乍得", "", "td"),
    DrawerBean("也门", "", "ye"),
    DrawerBean("亚美尼亚", "", "am"),
    DrawerBean("以色列", "", "il"),
    DrawerBean("伯利兹", "", "bz"),
    DrawerBean("佛得角", "", "cv"),
    DrawerBean("俄罗斯", "", "ru"),
    DrawerBean("保加利亚", "", "bg"),
    DrawerBean("克罗地亚", "", "hr"),
    DrawerBean("冈比亚", "", "gm"),
    DrawerBean("冰岛", "", "is"),
    DrawerBean("几内亚比绍", "", "gw"),
    DrawerBean("刚果共和国", "", "cg"),
    DrawerBean("利比里亚", "", "lr"),
    DrawerBean("加拿大", "", "ca"),
    DrawerBean("加纳", "", "gh"),
    DrawerBean("匈牙利", "", "hu"),
    DrawerBean("南非", "", "za"),
    DrawerBean("博茨瓦纳", "", "bw"),
    DrawerBean("卡塔尔", "", "qa"),
    DrawerBean("卢森堡", "", "lu"),
    DrawerBean("印度", "", "in"),
    DrawerBean("印度尼西亚", "", "id"),
    DrawerBean("危地马拉", "", "gt"),
    DrawerBean("厄瓜多尔", "", "ec"),
    DrawerBean("台湾", "", "tw"),
    DrawerBean("吉尔吉兹斯坦", "", "kg"),
    DrawerBean("哈萨克斯坦", "", "kz"),
    DrawerBean("哥伦比亚", "", "co"),
    DrawerBean("哥斯达黎加", "", "cr"),
    DrawerBean("土库曼斯坦", "", "tm"),
    DrawerBean("土耳其", "", "tr"),
    DrawerBean("圣卢西亚", "", "lc"),

  ];
  @override
  State<StatefulWidget> createState() {

    return _MyDrawer();
  }

}

class _MyDrawer extends State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(

      child: ListView.builder(
        itemCount: widget.countrysList.length,
        itemBuilder: (context, i) {
          //if (i.isOdd) return new Divider();
          return _buildRow(widget.countrysList[i]);
        },
      ),
    );
  }
  Widget _buildRow(DrawerBean menuBean) {

    _incrementCounter() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('typecode', menuBean.typeCode);
    }

    return new ListTile(
      title: new Text(
          menuBean.title
      ),

      onTap: () {
        setState(() {

          _incrementCounter();
          eventBus.fire(EventMessageEvent("xxxxx"));
          // 打开抽屉菜单
          Scaffold.of(context).openEndDrawer();

        });
      },
      onLongPress: () {
        /*Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new Scaffold(
              appBar: new AppBar(title: Text('跳转测试')),
              body: Center(
                child: new Text('666'),
              ));
        }));*/
      },
    );
  }
}

