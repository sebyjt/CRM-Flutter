import 'dart:async';
import 'dart:convert';
import 'package:crm_flutter/JobsExpanded.dart';
import 'package:crm_flutter/TokenExpanded.dart';
import 'package:crm_flutter/cardview.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
class Search extends StatefulWidget{

  @override
  search createState() => new search();
}
class search extends State<Search> {
  List tokenlist;
  bool visibility = true;
  bool searched=false;
  List SearchList;
  TextEditingController TokenNumber = new TextEditingController();
  TextEditingController TokenName = new TextEditingController();
  TextEditingController Phone = new TextEditingController();


  @override
  void initState() {
    super.initState();
    visibility=true;
  }

  Future Search() async {
    setState(() {
      visibility = false;
    });
    Map data={};
    String url =
        '';
    if(TokenNumber.text.compareTo("")==0&&TokenName.text.compareTo("")==0&&Phone.text.compareTo("")==0)
    {searched=false;visibility=true;}
    if(TokenNumber.text.compareTo("")==1)
      {data["TokenNumber"]=int.parse(TokenNumber.text);searched=true;}
    if(TokenName.text.compareTo("")==1)
      {data["user"]=TokenName.text;searched=true;}
    if(Phone.text.compareTo("")==1)
      {data["phoneNumber"]=Phone.text;searched=true;}

      print(json.encode(data));
      if(searched)
   { String jsonString2=json.encode(data);
     await apiRequest(url,jsonString2);

    print("search "+jsonString2);

    setState(() {
     if(SearchList==null)
    {  visibility = true;
      searched=false;}
      else
        {
          visibility=true;
          searched=true;
        }
      SearchList;

    });}
  }
  Future updatePool(String TimeIndex)
  async {
   searched=false;
    String url="";
    var timeinndex=
    {
      "TimeIndex":TimeIndex
    };
    String jsonString2=json.encode(timeinndex);
    await apiRequest(url,jsonString2);
  }
  Future<Null> apiRequest(String url,String data) async {
    print("hi");
    var response = await http.post(
        url,
        headers: { "Content-Type": "application/json"},
        body: data,
        encoding: Encoding.getByName("utf-8")
    );

    print(response.body);
    if(searched)
   { Map map = json.decode(response.body);
    Map map2 = json.decode(response.body);

    tokenlist = map["Items"];
    SearchList = map2["Items"];
  }
}


  Widget _buildCategoryWidgets(List<Widget> cards) {
    return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
              onTap: () {
                if(SearchList[index]["Status"].compareTo("WaitingInPool")==0)
                {updatePool(SearchList[index]["TimeIndex"]);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TokenExpanded(SearchList[index])));}
                else
                  Navigator.push(context, MaterialPageRoute(builder: (context) => JobsExpanded(SearchList[index])));},

              child:cards[index]);
        }


    );
  }

  @override
  Widget build(BuildContext context) {
    final cards = <cardview>[];

    if (visibility&&searched) {
      for (var i = 0; i < SearchList.length; i++) {
        cards.add(cardview(SearchList[i]));
      }
    }

    return new Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[new Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
              height: 60.0,
              margin: EdgeInsets.only(top: 30.0,left: 10.0,right: 10.0,bottom: 10.0),
              padding: EdgeInsets.only(left: 10.0 ,top: 5.0),
              decoration: new BoxDecoration(
                  color: const Color(0xFFDDDCE2),

                  borderRadius: BorderRadius.circular(10.0)

              ),
              child: new TextField(
                controller: TokenNumber,
                style: new TextStyle(
                    fontSize: 21.0,
                    color: Colors.black

                ),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "Token Number"

                ),
              ),
            )
          ],

    ),  new Container(
          height: 60.0,
          margin: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0,bottom: 10.0),
          padding: EdgeInsets.only(left: 10.0 ,top: 5.0),
          decoration: new BoxDecoration(
              color: const Color(0xFFDDDCE2),

              borderRadius: BorderRadius.circular(10.0)

          ),
          child: new TextField(
            controller: TokenName,
            style: new TextStyle(
              fontSize: 21.0,
                color: Colors.black

            ),
            decoration: new InputDecoration(
                border: InputBorder.none,
                hintText: "Name"


            ),
          ),
        ),
        new Container(
          height: 60.0,
          margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0,bottom: 10.0),
          padding: EdgeInsets.only(left: 10.0 ,top: 5.0),
          decoration: new BoxDecoration(
              color: const Color(0xFFDDDCE2),

              borderRadius: BorderRadius.circular(10.0)

          ),
          child: new TextField(
            controller: Phone,
            style: new TextStyle(

                fontSize: 21.0,
              color: Colors.black
            ),
            decoration: new InputDecoration(

                border: InputBorder.none,
                hintText: "Phone"

            ),
          ),
        ),
        new Container(
          height: 50.0,
          margin: EdgeInsets.only(top: 10.0,left: 50.0,right: 50.0,bottom: 10.0),
          padding: EdgeInsets.only(left: 10.0),
          decoration: new BoxDecoration(

    gradient: new LinearGradient(
    colors: [const Color(0xFF9181F8),const Color(0xFFDB75F8)],
    begin:Alignment.centerLeft,
    end: Alignment.centerRight),
    borderRadius: BorderRadius.circular(100.0)

          ),
          child:new FlatButton(onPressed: Search, child: new Center(
            child: new Text(
            "Search",
    style: new TextStyle(
    color: Colors.white,
    fontSize: 25.0,
      fontWeight: FontWeight.bold

    ),

    )

            )),
          ),

        visibility ? new Expanded(
            flex: 7,
            child: Container(
                child: _buildCategoryWidgets(cards)


            )) :
        new Container(
            height: 50.0,
            margin: EdgeInsets.all(100.0),
            child: new Center(
             child:CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    const Color(0xFFDB75F8))

            ))
        )]);
  }
}