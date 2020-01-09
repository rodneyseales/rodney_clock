import 'package:digital_clock/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utility/constants.dart';

class WeatherWidget extends StatelessWidget {
  final bool first;
  final String temp;
  final String weather;

  WeatherWidget({ @required this.first, @required this.temp, @required this.weather });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 50,
      height: 50,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Center(
          child: AnimatedCrossFade(
            firstChild: AnimatedOpacity(
              opacity: (first) ? 1 : 0,
              duration: Duration(milliseconds: 1),
              child: WeatherIcon(temp: getWeatherIcon(weather),
              ),
            ),
            secondChild: AnimatedOpacity(
              opacity: (!first) ? 1 : 0,
              duration: Duration(milliseconds: 1),
              child: Text(
                '$temp',
                style: kWeatherTextStyle,
              ),
            ),
            duration: Duration(seconds: 1),
            crossFadeState: first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstCurve: Curves.easeInOutQuint,
            secondCurve: Curves.easeInOutQuint,
          ),
        ),
      ),
    );
  }

  IconData getWeatherIcon(String temp) {
    switch(temp) {
      case 'cloudy':
        return FontAwesomeIcons.cloudSun;
      case 'foggy':
        return FontAwesomeIcons.cloudversify;
      case 'rainy':
        return FontAwesomeIcons.cloudRain;
      case 'snowy':
        return FontAwesomeIcons.snowman;
      case 'sunny':
        return FontAwesomeIcons.sun;
      case 'thunderstorm':
        return FontAwesomeIcons.cloudMoonRain;
      case 'windy':
        return FontAwesomeIcons.wind;
    }
    return FontAwesomeIcons.sun;
  }

}


class WeatherIcon extends StatelessWidget {
  final IconData temp;

  WeatherIcon({this.temp});
  @override
  Widget build(BuildContext context) {
    return Icon(
      temp,
      color: Colors.white,
    );
  }
}
