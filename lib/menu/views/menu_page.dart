import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infitest/menu/bloc/menu_bloc.dart';
import 'package:infitest/menu/bloc/menu_event.dart';
import 'package:infitest/menu/bloc/menu_state.dart';
import 'package:infitest/menu/models/menu.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => MenuBloc(InitialState())..add(GetAllMenu()),
        child: menuList(),
      ),
    );
  }

  menuList() {
    return BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
      if (state is LoadedState) {
        print("loaded");
        return scaffoldItem(state.menu.categories, context);
      } else {
        print("not loaded");
        return Container(
          child: Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          )),
          color: Colors.white,
        );
      }
    });
  }

  @override
  void initState() {}

  Widget scaffoldItem(List<Categories>? categories, BuildContext context) {
    return DefaultTabController(
      length: categories!.length,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Creates border
                  color: Colors.greenAccent),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.green,
              tabs: [
                for (Categories i in categories)
                  Tab(
                    text: i.name,
                  ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              for (Categories i in categories) itemGrid(i.items, i.name),
            ],
          )),
    );
  }

  Widget itemGrid(List<Items>? items, String? name) {
    return items!.length !=0 ?
     SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$name",style: TextStyle(color: Colors.green, fontSize: 15)),
            SizedBox(
              height: 20,
            ),
            new Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 5,
              runSpacing: 5,
              children: [
                for (Items i in items) categoryItem(i),
              ],
            )
          ],
        ),
      ),
    ):Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(child: Text("$name - No items available",style: TextStyle(color: Colors.green, fontSize: 15)),),
    );
  }

  Widget categoryItem(Items item) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.greenAccent)
      ),
      width: MediaQuery.of(context).size.width / 3.5,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item.images!.length == 1?
          Image.network(
            item.images!.first,
             width: 70,
            height: 70,
            fit: BoxFit.fill,
          ):Container(),
          Text(
            "${item.name}",
            style: TextStyle(fontSize: 15),
          ),
          // Text("${item.description}"),
          item.soldOut == true
              ? Text("Sold Out")
              : priceChecker(item.priceMin!.amount, item.priceMax!.amount,
                  item.priceMax!.currency)
        ],
      ),
    );
  }

  Widget priceChecker(minAmt, maxAmt, currency) {
    if(currency == "USD") currency = "\$";
    if (maxAmt > minAmt) {
      return Text("$currency$minAmt-$currency$maxAmt",
          style: TextStyle(fontSize: 15));
    } else {
      return Text("$currency$maxAmt", style: TextStyle(fontSize: 15));
    }
  }
}
