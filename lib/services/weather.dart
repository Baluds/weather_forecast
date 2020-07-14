import 'package:Climatee/apikEy.dart';
import 'package:Climatee/services/location.dart';
import 'package:Climatee/services/networking.dart';

const openWheatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcity(String cityName) async {
    var url = '$openWheatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    Networkhelper nethelper = Networkhelper(url);
    var weatherData = await nethelper.getdata();
    return weatherData;
  }

  Future<dynamic> getlocationWheather() async {
    Location loc = Location();
    await loc.getcurrentloc();
    Networkhelper nethelper = Networkhelper(
        '$openWheatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');

    var weatherdata = await nethelper.getdata();

    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
