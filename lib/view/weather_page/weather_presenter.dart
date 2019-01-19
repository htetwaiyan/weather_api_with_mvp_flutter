import 'dart:convert';
import 'dart:io';
import 'package:flutter_movoie/models/weather_response.dart';
import 'package:flutter_movoie/utils/app_constants.dart';
import 'package:http/http.dart' as http;

abstract class WeatherView{
  showLoading();
  showResult(WeatherResponse wr);
  showNoInternet();
}


class WeatherPresenter{
  WeatherView wv;
  WeatherPresenter(this.wv);

  getWeather(String city)async{
    try {
      wv.showLoading();
      await http.get(BASEURL + "?q=" + city + "&appid=" + API_KEY,).then((res) {
        var wr = WeatherResponse.fromJson(json.decode(res.body));
        wv.showResult(wr);
      });
    }catch(e){
      if(e is SocketException){
        wv.showNoInternet();
      }
    }
  }
}