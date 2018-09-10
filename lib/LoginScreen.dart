
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crm_flutter/Reception.dart';
import 'Counter.dart';
class LoginScreen extends StatefulWidget{
  @override
  Login createState()=>new Login();


  }



class Login extends State<LoginScreen> {

final username=TextEditingController();
final password=TextEditingController();
bool visibility=true;
Future login()
async {
  setState(() {
    visibility=false;
  });
  String url =
      '';
  String data="username=counter"+"&password=counter";


Future<String> apiRequest(String url, String data) async {

var response = await http.post(
    url,
    headers:{ "Content-Type":"application/x-www-form-urlencoded" } ,
    body: { "username":username.text , "password":password.text},
    encoding: Encoding.getByName("utf-8")
);


List res=response.body.split("\n");
print("yoo"+res[0]);
  if(res[0].toString().compareTo("<!DOCTYPE html>")==1)
  {Map dat;
  print(response.body);

  dat = json.decode(response.body);
  print(dat["userID"]);
  setState(() {

      visibility=true;

  });
  if(dat["type"].toString().compareTo("reception")==0)
  {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Reception()),
  );}
  else if(dat["type"].toString().compareTo("counter")==0)
  {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Counter()),
  );}
  }
  else
    setState(() {

      visibility=true;

    });
return "success";

}
  print(await apiRequest(url,data));
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body:new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[new Expanded(
      flex:1,
      child:new Container(
        decoration: new BoxDecoration(
        image: new DecorationImage(
        image: new AssetImage("Assets/bg.jpg"),
    fit: BoxFit.cover,
    ),
    ),
      child: new Column(

          children: <Widget>[
            new Expanded(

          child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Container(

             height:200.0,
            width: 200.0,
            decoration: new BoxDecoration(

                borderRadius: new BorderRadius.circular(100.0),
                border: new Border.all(
            color: Colors.white,
              width: 1.0,
            )
            ),
            child:new Center(
              child:Text(
                  "Logo",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )

              ),
            ),
        new Container(

          height:45.0,
          margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 50.0),
          decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(
                  color: Colors.white,
                  width:3.0
                )
              )),
          child:new Row(


              children: <Widget>[
                new Expanded(
                  flex:1,

          child:new Container(


          margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10.0),
            padding: EdgeInsets.only(right: 10.0),
            child: Image(
              image: new AssetImage("Assets/user.png"),
              fit: BoxFit.scaleDown,
            ),
        )),
          new Expanded(
            flex:5,

          child:new Container(




              child: TextField(
                style: new TextStyle(
                  color: Colors.white
                ),
                controller: username,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "username",
                  hintStyle: new TextStyle(
                    color: Colors.white
                  )

                ),
              )

            )),




              ],

          ),
        ),
      new Container(

        height:45.0,
        margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 20.0),
        decoration: new BoxDecoration(
            border: new Border(
                bottom: new BorderSide(
                    color: Colors.white,
                    width:3.0
                )
            )),
        child:new Row(


          children: <Widget>[
            new Expanded(
                flex:1,

                child:new Container(

                  margin: EdgeInsets.only(top: 10.0,bottom: 10.0,right: 10.0),
                  padding: EdgeInsets.only(right: 10.0),
                  child: Image(
                    image: new AssetImage("Assets/pass.png"),
                    fit: BoxFit.scaleDown,
                  ),
                )),
            new Expanded(
                flex:5,

                child:new Container(




                    child: TextField(
                      style: new TextStyle(
                          color: Colors.white
                      ),
                      controller: password,
                      obscureText: true,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "password",
                          hintStyle: new TextStyle(
                              color: Colors.white
                          )

                      ),
                    )

                )),




          ],

        ),
      ),

        new Container(
              height:60.0,
              
              margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 20.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                  border: new Border.all(
                          color: Colors.white,
                          width:1.0
                      )
                  ),
              child:
                  visibility?
              new FlatButton(
                onPressed:login,
                child:new Center(
                  child:Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )

              )

          ):
        new Center(
            child:CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)

            )
    ))
    ],

    ),

            ) ])))]));


  }
}