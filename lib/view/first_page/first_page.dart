import 'package:flutter/material.dart';
import 'package:flutter_movoie/view/weather_page/weather_page.dart';


class FirstPage extends StatelessWidget {
  var tec=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Find Weather",style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter City",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: "e.g, Yagon,London,..",
                  ),
                  controller: tec,
                )),
                IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return WeatherPage(tec.text);
                  }));

                },
                icon: Icon(Icons.search,color: Colors.white,),),
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
//https://api.openweathermap.org/data/2.5/weather?q=Yangon&appid=b6907d289e10d714a6e88b30761fae22
