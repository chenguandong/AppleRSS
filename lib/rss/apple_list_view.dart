import 'dart:convert' as convert;
import 'package:flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/rss/beans/event_message.dart';
import 'package:flutter_app/rss/bod_cast_bean_entity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:event_bus/event_bus.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemBean {
  final String title;
  final String subtitle;

  ItemBean(this.title, this.subtitle);
}

class AppleListView extends StatefulWidget {
  final String title;
  final String url;

  AppleListView(this.title, this.url);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppleListView();
  }
}

class _AppleListView extends State<AppleListView> {

  List<BodCastBeanFeedResult> rssItemList = new List();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  bool isShowLoading = false;

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {});

    return null;
  }

  getHttpData() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = widget.url; //播客

    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = BodCastBean.fromJson(jsonResponse);
      print(itemCount.toJson());
      setState(() {
        rssItemList.clear();
        rssItemList.addAll(itemCount.feed.result);
        isShowLoading = true;
        print("Request failed with status: ${response.statusCode}.");
      });
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: rssItemList == null ? 0 : rssItemList.length * 2,
          itemBuilder: (context, i) {
            if (i.isOdd) return new Divider();
            final index = i ~/ 2;
            return new AppleItemList(rssItemList[index], index);
          },

        ),
        new Offstage(
            offstage: isShowLoading, //这里控制
            child: Container(
              alignment: Alignment.center,
              child: new CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            )
        )

      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    eventBus.on().listen((onData) {
      print(",,,,,,,,,,,.............");
    });
    //refreshKey.currentState.show(atTop: true);
    this.getHttpData();
    super.initState();
    print("initState");
  }

  @override
  void didUpdateWidget(AppleListView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    this.getHttpData();
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class AppleItemList extends StatefulWidget {
  final BodCastBeanFeedResult _itemBean;
  final int i;


  AppleItemList(this._itemBean, this.i);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppleItemList();
  }
}

class _AppleItemList extends State<AppleItemList> {
  goUrl() async {
    String typecode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    typecode = await prefs.getString("typecode");
    print(widget._itemBean.url);
    print(typecode);
    print(widget._itemBean.url.toString().replaceAll("cn", typecode));
//_launchURL(typecode.isNotEmpty?widget._itemBean.url.toString().replaceAll("cn", typecode):widget._itemBean.url)
    await _launchURL(widget._itemBean.url);
  }

  // String typecode = prefs.getString("typecode");
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    final index = widget.i + 1;
    return new ListTile(
        onTap: () {
          _launchURL(widget._itemBean.url);
        },
        title: Text(
            widget._itemBean.artistname == null ? "" : widget._itemBean.name),
        subtitle: Text(widget._itemBean.artistname == null
            ? ""
            : widget._itemBean.artistname),
        leading: CachedNetworkImage(
        width:40,
        imageUrl: widget._itemBean.artworkurl100,
        placeholder: (context, url) =>  SizedBox( width: 15,height: 15, child:new CircularProgressIndicator(
            strokeWidth:1,
            valueColor: AlwaysStoppedAnimation(Colors.grey)
        ) )

    ),

          /*new Image.network(
        widget._itemBean.artworkurl100,
          width: 50.0
      )*/

          /*new CircleAvatar(
        //maxRadius:25,
        backgroundColor: Colors.grey,
        foregroundColor: Colors.grey,
        backgroundImage: NetworkImage(
          widget._itemBean.artworkurl100,
        ),*/

        trailing:Text('$index', style: TextStyle(
      //fontStyle:FontStyle.italic,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      //color: Colors.black
    )));
  }


}
