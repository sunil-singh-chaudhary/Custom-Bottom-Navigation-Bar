import 'package:flutter/material.dart';
import 'package:navigatiobar_diy_style/ListViewPage.dart';
import 'package:navigatiobar_diy_style/app.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Page 1"), actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.ac_unit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ListViewPage()));
                  })
            ]),
            body: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ListViewPage()));
                    },
                    child: Text("Switch Page - Subscribe")))));
  }

  @override
  bool get wantKeepAlive => true;
}
