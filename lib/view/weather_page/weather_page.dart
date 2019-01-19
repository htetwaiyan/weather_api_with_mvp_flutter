import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movoie/models/weather_response.dart';
import 'package:flutter_movoie/utils/app_constants.dart';
import 'package:flutter_movoie/view/weather_page/weather_presenter.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  String city;

  WeatherPage(this.city);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> with WeatherView {
  WeatherPresenter wp; //null
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wp = WeatherPresenter(this);
    wp.getWeather(widget.city);
  }

  bool isLoading = true;
  bool isnoInternet=false;
  WeatherResponse wr; //null

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isnoInternet?Center(child: Text("no internet"),):isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2018/08/24/23/37/raindrop-3629132_960_720.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: 30.0,
                      bottom: 40.0,
                    ),
                    width: double.infinity,
                    color: Colors.black.withAlpha(100),
                    height: double.infinity,
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Weather is ${wr.weather[0].main}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text("Temperature is ${wr.main.temp} F",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text("Pressure is ${wr.main.pressure}",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text("Wind Speed is ${wr.wind.speed} m/s",
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
  }

  @override
  showLoading() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  showResult(WeatherResponse wr) {
    setState(() {
      isLoading = false;
      this.wr = wr;
    });
  }

  @override
  showNoInternet() {
    setState((){
      isnoInternet=true;
    });
  }
}
