import 'package:flutter/material.dart';
import 'package:flutter_timer_demo/data/app_database.dart';
import 'package:flutter_timer_demo/timermodel.dart';

class TimerList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TimerListState();
}

class TimerListState extends State<TimerList> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: AppDatabase.db.getAllTimers(),
      builder:
          (BuildContext context, AsyncSnapshot<List<TimerModel>> snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data.length==0){
            return Center(
              child: Text(
                'No Timer Found.',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          else {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                TimerModel timerModel = snapshot.data[index];
                return Card(
                  elevation: 8.0,
                  margin:
                  new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration:
                    BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(Icons.timer, color: Colors.white),
                        ),
                        title: Text(
                          timerModel.timertime,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(
                                Icons.linear_scale, color: Colors.yellowAccent),
                          ],
                        ),
                        trailing: Icon(Icons.thumb_up,
                            color: Colors.white, size: 30.0)),
                  ),
                );
              },
            );
          }
        } else {
          return Center(
            child: Text(
              'No Timer Found.',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }
}
