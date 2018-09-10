
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Reception extends StatefulWidget{
  @override
  reception createState()=>new reception();


}



class reception extends State<Reception> {

  final username=TextEditingController();
  final phone=TextEditingController();
  final mail=TextEditingController();

  bool visibility=true;
  Future counterSend()
  async {
   setState(() {
      visibility=false;
    });
    String url =
        '';
    var tokenGetter=
    {
      "user":username.text,
      "phoneNumber":phone.text,
      "email":mail.text
    };
String jsonString=json.encode(tokenGetter);

    Future<String> apiRequest(String url, String data) async {

      var response = await http.post(
          url,
          headers:{ "Content-Type":"application/json" } ,
          body: data,
          encoding: Encoding.getByName("utf-8")
      );

print(response.body);
      Map dat;
      dat = json.decode(response.body);
      String tokenNumber=dat["TokenNumber"].toString();
      print(dat["TokenNumber"].toString());
      setState(() {

        visibility=true;

      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GetToken(tokenNumber=dat["TokenNumber"].toString())),
      );
      return "success";

    }
   await apiRequest(url,jsonString);


  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body:new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: new ListView(

                children: <Widget>[
                  Column(

                    children: <Widget>[
                      new Container(
                      margin: EdgeInsets.only(top: 100.0,left: 50.0,right: 50.0),
                        child: Text(
                          "Reception",

                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0
                          ),
                        )
            ),
                    new Container(

                      height:45.0,
                      margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 100.0),
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
                                        hintText: "Name",
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
                                  image: new AssetImage("Assets/phone.png"),
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
                                    controller: phone,

                                    decoration: new InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phone",
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
                                    image: new AssetImage("Assets/mail.png"),
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
                                      controller: mail,

                                      decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Mail",
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
                        height:125.0,

                        margin: EdgeInsets.only(left: 50.0,right: 50.0,top: 20.0),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue,
                            border: new Border.all(
                                color: Colors.white,
                                width:3.0
                            )
                        ),
                        child:
                        visibility?
                        new FlatButton(
                            onPressed:counterSend,
                            child:new Center(
                                child:new Column(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget>[new Text(
                                  "Get  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    fontSize: 50.0
                                  ),
                                ),


                              new Text(
                              "  Token  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0
                              ),
                            )
                        ]
                    )

                        )):
                        new Center(
                            child:CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
                            )
                        ))
                    ],

                  ),

                ])));


  }
}
class GetToken extends StatefulWidget{
@override
gettoken createState()=>new gettoken(TokenNumber);

  final String TokenNumber;
  GetToken(

      this.TokenNumber);
}



class gettoken extends State<GetToken> {

  final String TokenNumber;
gettoken(

  this.TokenNumber);


  bool visibility = true;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("Assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: new ListView(

                children: <Widget>[
                  Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                    children: <Widget>[
                      Container(
                        height:50.0,
                          width: 70.0,
                          padding: EdgeInsets.only(left: 10.0),
                          margin: EdgeInsets.only(bottom: 70.0),
                          child: new FlatButton(

                            child: Image(image: new AssetImage("Assets/back.png")),
                            onPressed:(){ Navigator.pop(context,true);}
                          )
                      ),
                       ]),
            new Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[new Container(
                height:50.0,
                  child:Text(
            "Your  ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),
            )),

            new Container(
                height:50.0,

                child: new Text(
              "  Token Number  ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),
            )),
                     new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
          margin: EdgeInsets.only(top: 10.0),
          height:250.0,
          width: 250.0,
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
                  fontSize: 50.0
                ),
              )

          ),
        ),])])])));
  }
}