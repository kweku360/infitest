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
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Colors.greenAccent),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,

          //indicatorSize: TabBarIndicatorSize.,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Salads",
            ),Tab(
              text: "Salads",
            ),Tab(
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
      body: Container(),
    );
  }
}
