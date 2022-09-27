import 'package:flutter/material.dart';
import 'package:navigatiobar_diy_style/lastfile.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinite List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Text(index.toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LastFile()));
            },
          );
        },
        itemCount: 100,
      ),
    );
  }
}
