import 'package:flutter/material.dart';
import 'Tokens.dart';
import 'Search.dart';
import 'Jobs.dart';
class Counter extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<Counter> with SingleTickerProviderStateMixin {


  TabController controller;
  int index;
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
    index=0;
    controller.addListener(_focus);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
void _focus()
{
  setState(() {
    index=controller.index;
  });
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        bottomNavigationBar: new Material(
            color: const Color(0xFFFFFFFF),
            child: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon:index==0? new Image(
                      image:AssetImage("Assets/ticketactive.png"),
                      height: 30.0,
            fit: BoxFit.scaleDown):
                  new Image(
                      image:AssetImage("Assets/ticket.png"),
                      height: 30.0,
                      fit: BoxFit.scaleDown)),
                  new Tab(icon:index==1? new Image(
                      image:AssetImage("Assets/suitcaseactive.png"),
                      height: 30.0,
                      fit: BoxFit.scaleDown):
                  new Image(
                      image:AssetImage("Assets/suitcase.png"),
                      height: 30.0,
                      fit: BoxFit.scaleDown)),
                  new Tab(icon:index==2? new Image(
                      image:AssetImage("Assets/searchactive.png"),
                      height: 30.0,
                      fit: BoxFit.scaleDown):
                  new Image(
                      image:AssetImage("Assets/search.png"),
                      height: 30.0,
                      fit: BoxFit.scaleDown)),
                ]
            )
        ),
        backgroundColor: const Color(0xFFf5f7f8),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new Tokens(),
              new Jobs(),
              new Search()
            ]
        )
    );
  }
}
