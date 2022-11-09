import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/Constant.dart';
import 'package:weather/Screens/MainScreen.dart';
import 'package:weather/Utils/Location.dart';
import 'package:weather/Utils/Weather.dart';

class LoadingScreen extends StatefulWidget{
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<LoadingScreen>{

  late LocationHelper locationData;
  Future<void> getLocationData() async{
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if (locationData.latitude == null || locationData.longitude == null){

    }
  }

  void getWeatherData() async{
    await getLocationData();

    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if(weatherData.currentTemperature == null || weatherData.currentCondition == null){

    }
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
          return MainScreen(weatherData: weatherData);
           }
        )
     );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kLinearGradient),
        child: Center(
          child: SpinKitRipple(
            color: Colors.white,
            size: 150.0,
            duration: Duration(milliseconds: 1200),
          ),
        ),
      ),
    );
  }
}