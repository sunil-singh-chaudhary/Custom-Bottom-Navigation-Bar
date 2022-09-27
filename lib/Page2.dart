import 'package:flutter/material.dart';
import 'package:navigatiobar_diy_style/ListViewPage.dart';
import 'package:navigatiobar_diy_style/app.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Page 2"), actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.ac_unit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => new Page2()));
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
                                  const ListViewPage()));
                    },
                    child: const Text("Switch Page - Leave a Like")))));
  }
}
