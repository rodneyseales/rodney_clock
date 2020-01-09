// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'utility/constants.dart'; //Constants for quick style updates
import 'utility/utility_methods.dart';
import 'widgets/date_container.dart';
import 'widgets/clock_container.dart';
import 'widgets/spacing_widget.dart';
import 'widgets/weather_container.dart';
import 'widgets/location_container.dart';

/// A basic digital clock.
///
/// You can do better than this!
class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  bool first = true;
  String weatherCondition = '';
  var count = 0;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
    weatherCondition = getWeatherCondition();
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();

      if(_dateTime.minute % 5 == 0) {
        first = !first;
      }
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      // _timer = Timer(
      //   Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
    });
  }

  String getLocation() {
    return widget.model.location;
  }

  String getTemperature() {
    return widget.model.temperatureString;
  }

  String getWeatherCondition() {
    return widget.model.weatherString;
  }




  @override
  Widget build(BuildContext context) {
    final colors = Theme
        .of(context)
        .brightness == Brightness.light
        ? kLightTheme
        : kDarkTheme;


    final hour =
    DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);
    final dateStr = dateString(_dateTime);
    final location = getLocation();
    final temp = getTemperature();


    return ClockWidget(colors: colors,
        location: location,
        hour: hour,
        minute: minute,
        dateStr: dateStr,
        first: first,
        temperature: temp,
        weather: weatherCondition);
  }
}

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    Key key,
    @required this.colors,
    @required this.location,
    @required this.hour,
    @required this.minute,
    @required this.dateStr,
    @required this.first,
    @required this.temperature,
    @required this.weather,
  }) : super(key: key);

  final Map<kElement, Color> colors;
  final String location;
  final String hour;
  final String minute;
  final String dateStr;
  final bool first;
  final String temperature;
  final String weather;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: colors[kElement.background],
        child: Row(
          children: <Widget>[
            SpacingContainer(),
            Expanded(
              child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            width: 25,
                          ),
                          WeatherWidget(temp: temperature, first: first, weather: weather,),
                          LocationWidget(location: location),
                        ],
                      ),
                      ClockFace(hour: hour, minute: minute),
                      Row(
                        children: <Widget>[
                          DateCard(date: dateStr),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
            ),
            SpacingContainer(),
          ],
        ));
  }
}


