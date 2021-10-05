import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          bottom: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(40), // Creates border
                color: Colors.greenAccent),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.green,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: "Salads",
              ),
              Tab(
                text: "Salads",
              ),
              Tab(
                text: "Salads",
              ),
              Tab(
                text: "Salads",
              ),
              Tab(
                text: "Salads",
              ),
              Tab(
                text: "Teas",
              ),
              Tab(
                text: "Beverages",
              ),
            ],
          ),
        ),
        body: categoryBuilder());
  }
}

Widget pageBody() {
  return Column(
    children: [
      Flexible(
          flex: 1,
          child: Container(color: Colors.red, child: categoryBuilder())),
      Flexible(
          flex: 9,
          child: Container(color: Colors.blue, child: categoryBuilder())),
    ],
  );
}

Widget categoryBuilder() {
  return GridView.count(
    padding: EdgeInsets.all(10),
    crossAxisCount: 3,
    children: [
      categoryItem(),
      Text("this is a grid"),
      Text("this is a grid"),
      Text("this is a grid"),
      Text("this is a grid")
    ],
    // itemCount: 10, //serviceProviderList.length,
    // itemBuilder: (BuildContext context, int index) {
    //   return TextButton(onPressed: () {}, child: Text(" thi is $index"));
    // },
  );
}

Widget categoryItem(){
  return Container(
    child: Column(
      children: [
        Image.network(
          "https://firebasestorage.googleapis.com/v0/b/infishare-client-test.appspot.com/o/Business%2F9hEyRjsiwXh3afRpeAnn9A2VuTH2%2Fimages%2Fdishes%2FPeach%20Ice%20Jelly%E8%9C%9C%E6%A1%83%E7%BA%96%E6%9E%9C%E8%8C%B6.jpeg?alt=media&token=cb95b20b-cbc5-4663-a241-bc316264c957",
          width: 100,
          height:100,
        ),
      ],
    ),
  );
}
