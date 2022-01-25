import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map receivedData = {};

  void collectData() async {
      dynamic response = await Navigator.pushNamed(context, '/location');
      setState(() {
        receivedData = {
          'time': response['time'],
          'location': response['location'],
          'dayTime': response['dayTime'],
          'flag': response['flag']
        };
      });
  }
  
  @override
  Widget build(BuildContext context) {

    receivedData = receivedData.isEmpty? ModalRoute.of(context)!.settings.arguments as Map : receivedData;
    String backImage = receivedData['dayTime']? 'day.png' : 'night_2475678_1920.png';
    Color? fontColor = receivedData['dayTime']? Colors.black : Colors.lightBlue[50];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/assets/$backImage')
            )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
              children: [
                Text(
                  receivedData['location'],
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 25
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  receivedData['time'],
                  style: TextStyle(
                    fontSize: 56,
                    color: fontColor
                  )
                ),
                const SizedBox(height: 60),
                TextButton.icon(
                  onPressed: () {
                    collectData();
                    },
                  icon: Icon(
                    Icons.edit_location,
                    color: fontColor,
                  ),
                  label: Text(
                    'Select African City',
                    style: TextStyle(
                      fontSize: 10,
                      color: fontColor
                    ),
                  )
                  )
              ],
            ),
            ),
          )
      ),
    );
  }
}