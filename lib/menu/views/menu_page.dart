
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infitest/menu/bloc/menu_bloc.dart';
import 'package:infitest/menu/bloc/menu_event.dart';
import 'package:infitest/menu/bloc/menu_state.dart';
import 'package:infitest/menu/models/menu.dart';

/* Main menu page   */
class MenuPage extends StatefulWidget {
  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> with TickerProviderStateMixin {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Call the bloc provider here
      body: BlocProvider(
        create: (_) => MenuBloc(InitialState())..add(GetAllMenu()),
        child: menuList(),
      ),
    );
  }
//Display menu List
  menuList() {
    return BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
      if (state is LoadedState) {
        //loaded state active
        return scaffoldItem(state.menu.categories, context);
      } else {
        //todo Handle various states apart from LoadedState
        if(state is ErrorState){
          return Container(
            child: Center(child: Text("${state.message}"),));
        }
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

//Build Scaffold for tab bar and tab content
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
                //loop through categories
                for (Categories i in categories)
                  Tab(
                    text: i.name,
                  ),
              ],
            ),
          ),
          body: TabBarView( //implement tab bar view
            children: [
              for (Categories i in categories) itemGrid(i.items, i.name),
            ],
          )),
    );
  }
//Display each item as a grid box
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
            //use wrap for safe grid alignment
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
//Display individual items inside category
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
//check for differences in price .and display appropriate currency,
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
