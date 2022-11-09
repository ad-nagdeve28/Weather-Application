import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/Utils/Weather.dart';

class MainScreen extends StatefulWidget{

  MainScreen({required this.weatherData});
  final WeatherData weatherData;

  @override
  MainState createState() => MainState();
}

class MainState extends State<MainScreen>{

  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;

  void updateDisplayInfo(WeatherData weatherData){
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplaysData = weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplaysData.weatherImage;
      weatherDisplayIcon = weatherDisplaysData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox( height: 85),
            Container(child: weatherDisplayIcon),
            SizedBox(height: 15.0),
            Center(
              child: Text(" $temperature°",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80.0,
                  letterSpacing: -5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}