import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_app/rss/bod_cast_bean_entity.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
        print("Request failed with status: ${response.statusCode}.");
      });
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
          itemCount: rssItemList == null ? 0 : rssItemList.length,
          itemBuilder: (context, i) {
            return new AppleItemList(rssItemList[i]);
          },
        ),
        onRefresh: () {});
  }

  @override
  void initState() {
    // TODO: implement initState
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

  AppleItemList(this._itemBean);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _AppleItemList();
  }
}

class _AppleItemList extends State<AppleItemList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        print(widget._itemBean.url);
        new MaterialApp(
          routes: {
            "/": (_) => new WebviewScaffold(
              url: "https://www.google.com",
              appBar: new AppBar(
                title: new Text("Widget webview"),
              ),
            ),
          },
        );

        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new Scaffold(
              appBar: new AppBar(title: Text(widget._itemBean.name)),
              body: Center(
                child: new WebviewScaffold(
                  withJavascript:true,
                  withLocalStorage:true,
                  allowFileURLs: true,
                  withLocalUrl: true,
                  url: widget._itemBean.url,

                ),
              ));
        }));

      },
      title: Text(
          widget._itemBean.artistname == null ? "" : widget._itemBean.name),
      subtitle: Text(widget._itemBean.artistname == null
          ? ""
          : widget._itemBean.artistname),
      leading: new CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.grey,
        backgroundImage: NetworkImage(
          widget._itemBean.artworkurl100,
        ),
      ),
    );
  }
}
