import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';


class FetchData{

 String? time;
 String? flag;
 String? location;
 String? urlEndPoint;
 String errorMessage = 'Sorry, we are unable to load the time';
 bool? isDayTime;

 FetchData ({this.urlEndPoint, this.location, this.flag});

 Future<void> getData() async {
   try {
    Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$urlEndPoint"));
    Map feedback = jsonDecode(response.body);

    String dateTime = feedback['datetime'];
    String offset1 = feedback['utc_offset'].substring(1,3);
    String offset2 = feedback['utc_offset'].substring(4,6);

    int offset1Num = int.parse(offset1);
    int offset2Num = int.parse(offset2);

    DateTime dateTimeR = DateTime.parse(dateTime);
    dateTimeR = dateTimeR.add(Duration(hours: offset1Num, minutes: offset2Num));

    isDayTime = dateTimeR.hour>6 && dateTimeR.hour<20;

    time = DateFormat.jm().format(dateTimeR);
   } catch (e) {
     time = errorMessage;
   } 
 }

}