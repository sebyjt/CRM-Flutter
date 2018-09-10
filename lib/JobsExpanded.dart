import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
class JobsExpanded extends StatefulWidget
{ Map list;

JobsExpanded(
    this.list
    );

@override
jobexpanded createState()=> new jobexpanded(list);

}
class jobexpanded extends State<JobsExpanded>
{
Map list;
jobexpanded(
    this.list
    );

void skip(){

}
/*Future submit()
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
//Navigator.pop(context);
}
Future<Null> apiRequest(String url, String data) async {
  var response = await http.post(
      url,
      headers: { "Content-Type": "application/json"},
      body: data,
      encoding: Encoding.getByName("utf-8")
  );
  print(response.body);
}*/
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
                                          list["TokenNumber"].round().toString(),
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
                                            list["user"],
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
                                child: Text(
                                  list["phoneNumber"],
                                  style: new TextStyle(
                                      color: Colors.white

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

                                  child: Text(
                                    list["location"],
                                    style: new TextStyle(
                                        color: Colors.white

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
                                  child: Text(
                                list["deviceType"],
                                style: new TextStyle(
                                    color: Colors.white

                                ),
                              ),)
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
                                child: Text(
                                  list["problem"],
                                  style: new TextStyle(
                                      color: Colors.white

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
                                child: Text(
                                  list["detailedDescription"],
                                  style: new TextStyle(
                                      color: Colors.white

                                  ),
                                ),
                              ),
                              new Container(
                                height: 50.0,
                                width:150.0,
                                margin: EdgeInsets.only(left: 80.0,right: 80.0,top: 10.0,bottom: 10.0),
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color:const Color(0xFF5edea3)
                                ),
                                child: new FlatButton(onPressed:(){
                                  skip();
                                  Navigator.pop(context);
                                },
                                  child: Center(
                                      child: new Text("Accept",
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
                                    color:const Color(0xFFfb8877)
                                ),
                                child: new FlatButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                  child: Center(
                                      child: new Text("Decline",
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