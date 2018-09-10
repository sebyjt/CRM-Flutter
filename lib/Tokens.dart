import 'dart:async';
import 'dart:convert';
import 'package:crm_flutter/TokenExpanded.dart';
import 'package:crm_flutter/cardview.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Tokens extends StatefulWidget{

  @override
  token createState() => new token();
}
class token extends State<Tokens>
{
  List tokenlist;
  bool visibility=false;
  List SearchList;
  TextEditingController searchclr=new TextEditingController();

  @override
  void initState() {
    super.initState();
    _populateList();

  }
 Future<Null> _populateList()
  async {


      String url =
          '';


      await apiRequest(url);
      setState(() {
        SearchList;
        visibility=true;
      });
  }
  Future<Null> search() async {

   setState(() {
     visibility=false;
   });
    String url =
        '';


    await apiRequest(url);

    print("search ");
    if(searchclr.text.compareTo("")==1)
    {   print(tokenlist.length);
      SearchList.clear();
      int i = 0;
    print(tokenlist.length);

    while (i <tokenlist.length) {
      if (tokenlist[i]["user"].toString().compareTo(searchclr.text) == 0) {
        SearchList.add(tokenlist[i]);
      }
        i++;
    }
    print(SearchList);
    }
    setState(() {
      visibility=true;
      SearchList;
    });


  }
  Future updatePool(String TimeIndex)
  async {

    String url="";
    var timeinndex=
        {
          "TimeIndex":TimeIndex
        };
    String jsonString2=json.encode(timeinndex);
    await apiPost(url,jsonString2);
  }
  Future<String> apiRequest(String url) async {
    print("hi");

    var response = await http.get(
        url,
        headers:{ "Content-Type":"application/json" }
    );

    //print(response.body);

    Map map=json.decode(response.body);
    Map map2=json.decode(response.body);

    tokenlist=map["Items"];
    SearchList=map2["Items"];



    return "success";

  }
  Future<Null> apiPost(String url, String data) async {
    var response = await http.post(
        url,
        headers: { "Content-Type": "application/json"},
        body: data,
        encoding: Encoding.getByName("utf-8")
    );
    print(response.body);
  }


  Widget _buildCategoryWidgets(List<Widget> cards) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
       return new GestureDetector(
          onTap: () {  updatePool(SearchList[index]["TimeIndex"]);
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TokenExpanded(SearchList[index])),
          );},
        child:cards[index]);
      }


    );
  }

  @override
  Widget build(BuildContext context) {
    final cards = <cardview>[];

    if(visibility){for (var i = 0; i < SearchList.length; i++) {
      cards.add(cardview(SearchList[i]));
    }}

        return new Column(
      mainAxisAlignment: MainAxisAlignment.start,

        children:<Widget>[ new Container(
    height:45.0,

        margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 30.0),

        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color:const Color(0xFFE4E4E8),

        ),
        child:
        new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[new Expanded(
          flex:1,
          child: new FlatButton(onPressed: search, child:
          new Image(image: AssetImage("Assets/search.png"),
          height: 30.0,),

          ))
        ,new Expanded(
            flex:5,
            child:  TextField(
              decoration: new InputDecoration(
                hintText: "Search by token name",
                border: InputBorder.none,


              ),
              controller: searchclr,
            ))])

   ),visibility?new Expanded(
          flex: 7,
            child:new RefreshIndicator(
                color:const Color(0xFFDB75F8) ,
                onRefresh: _populateList,
                child:  Container(
              color:Colors.transparent,
        child: _buildCategoryWidgets(cards)


        ))):
        new Container(
            height: 50.0,
            margin: EdgeInsets.all(100.0),
            child:new Center(child:   CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(const Color(0xFFDB75F8))

        )))]);

  }
}