import 'package:flutter/material.dart';
import 'package:navigatiobar_diy_style/ListViewPage.dart';
import 'package:navigatiobar_diy_style/Page2.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("Page 3")),
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
                    child: const Text("Switch Page - Comment")))));
  }
}
