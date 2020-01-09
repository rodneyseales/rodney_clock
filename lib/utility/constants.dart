import 'package:flutter/material.dart';


const int kDeg = 0x00B0;

//Enumeration for Theme types.
enum kElement {
  background,
  text,
  shadow,
}

//Light Theme for light theme users
const kLightTheme = {
  kElement.background: Colors.blueAccent,
  kElement.text: Colors.white,
  kElement.shadow: Colors.black,
};

//Dark Theme for dark theme users
const kDarkTheme = {
  kElement.background: Colors.black,
  kElement.text: Colors.white,
  kElement.shadow: Color(0xFFFF00FF),
};



//TextStyles
var kClockTextStyle = TextStyle(
  fontSize: 115,
  letterSpacing: 4,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontFamily: 'Rubik',
  shadows: <Shadow> [
    Shadow(
      offset: Offset(1, 1),
      blurRadius: 3.0,
      color: kLightTheme[kElement.shadow],
    )
  ]
);

var kDateTextStyle = TextStyle(
  fontSize: 22,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  letterSpacing: 2.5,
  fontFamily: 'Rubik',
    shadows: <Shadow> [
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 3.0,
        color: kLightTheme[kElement.shadow],
      )
    ]
);

var kLocationTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  fontFamily: 'Rubik',
  color: Colors.white,
    shadows: <Shadow> [
      Shadow(
        offset: Offset(0.5, 0.5),
        blurRadius: 10.0,
        color: kLightTheme[kElement.shadow],
      )
    ]
);

var kWeatherTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontFamily: 'Rubik',
  fontWeight: FontWeight.w500,
    shadows: <Shadow> [
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 3.0,
        color: kLightTheme[kElement.shadow],
      )
    ]
);
