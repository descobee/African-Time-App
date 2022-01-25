import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:first_vs_code_app/services/fetch_data.dart';


class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setTime() async{
    FetchData instance = FetchData(flag: 'nigeria.png', location: 'Lagos', urlEndPoint: 'Africa/Lagos');
    await instance.getData();

      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'time': instance.time,
        'flag': instance.flag,
        'dayTime': instance.isDayTime,
        'location': instance.location
      });
  }
  
  @override
  void initState() {
    super.initState();
    setTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      body: const SpinKitPouringHourGlassRefined(
        size: 50.0,
        color: Colors.white,
        duration: Duration(seconds: 4),
    )
    );
  }
}