import 'package:flutter/material.dart';
import 'package:first_vs_code_app/services/fetch_data.dart';

class Locations extends StatefulWidget {
  const Locations({ Key? key }) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

  List<FetchData> locations = [
	    FetchData(urlEndPoint: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
	    FetchData(urlEndPoint: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'southafrica.png'),
	    FetchData(urlEndPoint: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
	    FetchData(urlEndPoint: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
	    FetchData(urlEndPoint: 'Africa/Tripoli', location: 'Tripoli', flag: 'libya.png'),
	    FetchData(urlEndPoint: 'Africa/Casablanca', location: 'Casablanca', flag: 'casablanca.png'),
	    FetchData(urlEndPoint: 'Africa/Abidjan', location: 'Abidjan', flag: 'ivorycoast.png'),
	    FetchData(urlEndPoint: 'Africa/Tunis', location: 'Tunis', flag: 'tunisia.png'),
	  ];

    void updateTime(locationIndex) async {
      FetchData instance = locations[locationIndex];
      await instance.getData();
      Navigator.pop(context, {
        'time': instance.time,
        'location': instance.location,
        'dayTime': instance.isDayTime,
        'flag': instance.flag
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text(
          'Select Location',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true
      ),

      
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(
                  locations[index].location!,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${locations[index].flag}'
                  ),
                ),
                onTap: () {
                  updateTime(index);
                }
              ),
            ),
          );
        } 
        ),
    );
  }
}