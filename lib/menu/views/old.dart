// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:infitest/menu/bloc/menu_bloc.dart';
// import 'package:infitest/menu/bloc/menu_event.dart';
// import 'package:infitest/menu/bloc/menu_state.dart';
// import 'package:infitest/menu/models/menu.dart';
//
// class MenuPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MenuPage();
// }
//
// class _MenuPage extends State<MenuPage> with TickerProviderStateMixin {
//   final _menuBloc = MenuBloc(InitialState());
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _menuBloc.add(GetAllMenu());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
//
//   Widget buildMenu(Menu menu) {
//     _tabController = TabController(
//         vsync: this, initialIndex: 0, length: menu.categories!.length);
//     return Scaffold(
//       body: Container(color: Colors.red,),
//       appBar: AppBar(
//         bottom: TabBar(
//             controller: new TabController(length: 4, vsync: this),
//             indicatorColor: Colors.yellow,
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white,
//             //indicatorSize: TabBarIndicatorSize.,
//             isScrollable: true,
//             tabs: buildMenuTabs(menu.categories)),
//       ),
//     );
//   }
// }
//
// // void gp(){
// // return  BlocProvider(
// // create: (_) => _menuBloc,
// // child: BlocBuilder<MenuBloc, MenuState>(
// // builder: (context, state) {
// // if (state is InitialState) {
// // _buildLoading();
// // print("initial state");
// // } else if (state is LoadingState) {
// // _buildLoading();
// // print("loading");
// // } else if (state is LoadedState) {
// // buildMenu(state.menu);
// // print(state.menu.categories!.length);
// // } else if (state is ErrorState) {
// // _buildLoading();
// // print(state.message);
// // }
// // return Container();
// // },
// // ),
// // );
// // }
//
// List<Widget> buildMenuTabs(List<Categories>? categories) {
//   List<Widget> l = [];
//   categories!.map((e) => {
//     l.add(Tab(
//       text: e.name,
//     ))
//   });
//   return l;
// }
//
// Widget pageBody() {
//   return Column(
//     children: [
//       Flexible(
//           flex: 1,
//           child: Container(color: Colors.red, child: categoryBuilder())),
//       Flexible(
//           flex: 9,
//           child: Container(color: Colors.blue, child: categoryBuilder())),
//     ],
//   );
// }
//
// Widget _buildLoading() => Container(
//     width: 300,
//     height: 300,
//     color: Colors.green,
//     child: Center(child: CircularProgressIndicator()));
//
// Widget categoryBuilder() {
//   return GridView.count(
//     padding: EdgeInsets.all(10),
//     crossAxisCount: 3,
//     children: [
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//       categoryItem(),
//     ],
//     // itemCount: 10, //serviceProviderList.length,
//     // itemBuilder: (BuildContext context, int index) {
//     //   return TextButton(onPressed: () {}, child: Text(" thi is $index"));
//     // },
//   );
// }
//
// Widget categoryItem() {
//   return Container(
//     child: Column(
//       children: [
//         Image.network(
//           "https://firebasestorage.googleapis.com/v0/b/infishare-client-test.appspot.com/o/Business%2F9hEyRjsiwXh3afRpeAnn9A2VuTH2%2Fimages%2Fdishes%2FPeach%20Ice%20Jelly%E8%9C%9C%E6%A1%83%E7%BA%96%E6%9E%9C%E8%8C%B6.jpeg?alt=media&token=cb95b20b-cbc5-4663-a241-bc316264c957",
//           width: 60,
//           height: 60,
//         ),
//         Text("Rice Cripsies"),
//         Text("Description"),
//         Text("sold out"),
//       ],
//     ),
//   );
// }
