import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'model/app_details.dart';

class MainScreen extends StatelessWidget {
  AppStore place = appList[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IF Playstore"),
      ),
      body: ListView.builder(
        itemCount: appList.length,
        itemBuilder: (context, index) {
          final AppStore place = appList[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailScreen(place: place,);
                }));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _AppList(place.imageLogo),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.developer),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              place.genre+" - "+place.rating,
                              style: TextStyle(fontSize: 10.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _AppList(String imageLogo){
    return Container(
      width: 50.0,
      height: 50.0,
      child: Expanded(
        flex: 1,
        child: Image.asset(imageLogo),
      ),
    );
  }
}
