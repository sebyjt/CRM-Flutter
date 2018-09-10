import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
class TokenExpanded extends StatefulWidget
{ Map list;

  TokenExpanded(
      this.list
      );

@override
  tokenexpanded createState()=> new tokenexpanded(list);

}
class tokenexpanded extends State<TokenExpanded>
{ String TokenNumber="2";
String Name="seby";
String Phone;
String device;
List <DropdownMenuItem<String>> devicytype=[];
  Map list;
TextEditingController phone,location,problem,description;
  tokenexpanded(
      this.list
      );
@override
void initState() {
    // TODO: implement initState
    super.initState();
    phone=new TextEditingController(text:list["phoneNumber"]);
    location=new TextEditingController();
    problem=new TextEditingController();
    description=new TextEditingController();
    TokenNumber=list["TokenNumber"].round().toString();
    Name=list["user"];
    List<String> devicelist=["Camera","Smart Phone","Laptop","T.V"];
    for(int i=0;i<devicelist.length;i++)
    {devicytype.add(new DropdownMenuItem(
        child:
        new Container(

          child:
      new Text(devicelist[i],
      style: new TextStyle(
        color: Colors.white

      ),)),
        value:devicelist[i]));}
  }
Future skip()
async {

  String url="";
  var timeinndex=
  {
    "TimeIndex":list["TimeIndex"]
  };
  String jsonString2=json.encode(timeinndex);
  await apiPost(url,jsonString2);
  Navigator.pop(context);

}
  Future submit()
  async {
    var sendData=
        { "TimeIndex":list["TimeIndex"],
          "Status":"InCounter",
          "user":list["user"],
          "phoneNumber":phone.text,
          "location":location.text,
          "deviceType":device,
          "problem":problem.text,
          "detailedDescription":description.text,
          "TokenNumber":list["TokenNumber"].round(),
          "TimeStamp":list["TimeStamp"],
          "email":list["email"],

        };
    print(sendData);
String url="";
String jsonString=json.encode(sendData);
print(jsonString);
await apiRequest(url,jsonString);
Navigator.pop(context);
  }
Future<Null> apiRequest(String url, String data) async {
  var response = await http.post(
      url,
      headers: { "Content-Type": "application/json"},
      body: data,
      encoding: Encoding.getByName("utf-8")
  );
  print(response.body);
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      new WillPopScope(
        onWillPop: () async => false,child:Scaffold(
      body:new Container(
          decoration: new BoxDecoration(

              gradient: new LinearGradient(
                  colors: [const Color(0xFF9181F8),const Color(0xFFDB75F8)],
                  begin:Alignment.centerLeft,
                  end: Alignment.centerRight


              )),
          child: new ListView(

            children: <Widget>[new Row(

    children: <Widget>[ new Expanded(
    flex:3,
    child:Column(

    mainAxisAlignment: MainAxisAlignment.start,

    children: <Widget>[ new Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    new  Container(
    margin: EdgeInsets.all(10.0),
    height:60.0,
    width: 60.0,
    decoration: new BoxDecoration(

    borderRadius: new BorderRadius.circular(150.0),
    border: new Border.all(
    color: Colors.white,
    width: 4.0,
    )
    ),

    child:new Center(
    child:Text(
    TokenNumber,
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20.0
    ),
    )

    )),
    new Expanded(
    flex:4,
    child: Container(
    margin: EdgeInsets.only(top: 10.0),
    child:new Center(
    child:Text(
    Name,
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30.0
    ),
    )

    ),))]),
      new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            height:50.0,
            margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 60.0,bottom: 10.0),
            padding: EdgeInsets.only(left: 10.0,top: 3.0),
            decoration:  new BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: new Border.all(
                color: Colors.white,
              )
            ),
            child: TextField(
              controller: phone,
             style: new TextStyle(
            color: Colors.white

        ),
        decoration: new InputDecoration(

                  border: InputBorder.none,
                  hintText: "Phone",
                 hintStyle: new TextStyle(
                   color: Colors.white
                 )

              ),
            ),
          ),
      new Container(
      height:50.0,
      margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
      padding: EdgeInsets.only(left: 10.0,top: 3.0),
      decoration:  new BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: new Border.all(
            color: Colors.white,
          )
      ),
      child: TextField(

       style: new TextStyle(
            color: Colors.white

        ),
        controller: location,
        decoration: new InputDecoration(

            border: InputBorder.none,
            hintText: "Location",
            hintStyle: new TextStyle(
                color: Colors.white
            )

        ),
      ),
    ),
      new Container(
      height:50.0,
      margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
      padding: EdgeInsets.only(left: 10.0,top: 3.0),
      decoration:  new BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: new Border.all(
            color: Colors.white,
          )
      ),
      child:new Theme(
          data: Theme.of(context).copyWith(
            canvasColor:const Color(0xFFDB75F8)
          ),child:  DropdownButtonHideUnderline(child:DropdownButton(items: devicytype,
          value: device,
          hint:new Text("Device Type",
          style: new TextStyle(
            color: Colors.white
          ),),
          onChanged: (value){
        device=value;
        setState(() {
          device;
        });
          })
      )))
      ,

          new Container(
            height:50.0,
            margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
            padding: EdgeInsets.only(left: 10.0,top: 3.0),
            decoration:  new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: new Border.all(
                  color: Colors.white,
                )
            ),
            child: TextField(

             style: new TextStyle(
            color: Colors.white

        ),
        controller: problem,
        decoration: new InputDecoration(

                  border: InputBorder.none,
                  hintText: "Problem",
                  hintStyle: new TextStyle(
                      color: Colors.white
                  )

              ),
            ),
          ),
          new Container(
            height:100.0,
            margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
            padding: EdgeInsets.only(left: 10.0,top: 3.0),
            decoration:  new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: new Border.all(
                  color: Colors.white,
                )
            ),
            child: TextField(

             style: new TextStyle(
            color: Colors.white

        ),
        controller: description,
        decoration: new InputDecoration(

                  border: InputBorder.none,
                  hintText: "Description",
                  hintStyle: new TextStyle(
                      color: Colors.white
                  )

              ),
            ),
          ),
          new Container(
            height: 50.0,
            width:150.0,
            margin: EdgeInsets.only(left: 80.0,right: 80.0,top: 10.0,bottom: 10.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
            color:const Color(0xFFfb8877)
              ),
            child: new FlatButton(onPressed:(){
              skip();
              Navigator.pop(context);
            },
              child: Center(
               child: new Text("Skip",
               style: new TextStyle(
                 color: Colors.white
               ),)

              ),
            ),

          ) ,
          new Container(
            height: 50.0,
            width:150.0,
            margin: EdgeInsets.only(left: 80.0,right: 80.0,top: 5.0,bottom: 10.0),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color:const Color(0xFF5edea3)
            ),
            child: new FlatButton(onPressed: submit,
              child: Center(
                  child: new Text("Submit",
                    style: new TextStyle(
                        color: Colors.white
                    ),)

              ),
            ),

          ) ],
      )
            ],
          )
      ),
    ])]))));
  }
}