import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';



class cardview extends StatelessWidget
{Map tokenlist;
String TokenNumber;
String WaitingTime;
String Name;
String time;
String am;

 cardview(
     this.tokenlist
     );
void INIT(){}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    initializeDateFormatting("hi-IN", null).then((_) => INIT());
    TokenNumber=tokenlist["TokenNumber"].round().toString();
    Name=tokenlist["user"];
    var epoch=DateTime.now().millisecondsSinceEpoch;
    print(epoch);
    print(tokenlist["TimeIndex"]);
    List epochsplit=tokenlist["TimeIndex"].toString().split(".");
    int ep=int.parse(epochsplit[0]);
    int epnow=(epoch/1000).round();
    int waitingtimeEpoch=epnow-ep;
    waitingtimeEpoch-=19800;
    waitingtimeEpoch*=1000;
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(waitingtimeEpoch);
    DateFormat format = new DateFormat("dd HH:mm:ss","en-IN");

    var dateString = format.format(date);
    List epsplit=dateString.split(" ");
    int day=int.parse(epsplit[0]);
    String edate;
    if(day==01)
      edate=epsplit[1];
    else
      {
        day--;
        edate=day.toString()+"d "+epsplit[1];

      }
    WaitingTime=edate;
    List str=tokenlist["TimeStamp"].toString().split(" ");
    time=str[0];
    am=str[1];
    print(tokenlist);
    return new Material(
      color: Colors.transparent,
    child: new Container(
        height: 170.0,
        margin: EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),


          gradient: new LinearGradient(
              colors: [const Color(0xFF9181F8),const Color(0xFFDB75F8)],
            begin:Alignment.centerLeft,
            end: Alignment.centerRight


          )),
         child:new Row(

             children: <Widget>[ new Expanded(
         flex:3,
         child:
        new Container(
            decoration: new BoxDecoration(
              border: new Border(right:new BorderSide(
                color:const Color(0xffb98af7),
                width: 2.0,
              ) )
            ),
            child:  Column(

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
    fontSize: 20.0
    ),
    )

    ),))]),

         new Row(

          children: <Widget>[new
          Container(
            margin:EdgeInsets.only(top: 40.0,left: 50.0),
              child:new
          Text("WAITING TIME",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)
          )

          ],
        ),
             new Row(

               children: <Widget>[new
               Container(
                   margin:EdgeInsets.only(top: 10.0,left: 60.0),
                   child:new
                   Text(WaitingTime,
                     style: new TextStyle(
                         color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 12.0
                     ),)
               )

               ],
             )
    ]))),new Expanded(
               flex: 1,
                 child:
             new Column(
               mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new Text(
                 time,
                 style: new TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold
             )
               ),
                 new Text(
        am,
                     style: new TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                       fontSize: 20.0
                     )
    )
      ],
    )

             )])));

  }
}











