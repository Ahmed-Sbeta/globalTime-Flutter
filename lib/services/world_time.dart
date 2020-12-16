import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;  //location name for the ui
  String time;  // time for thet location
  String flag;  // url for the flag picture
  String url;   // location url for rest API
  bool isDayTime = true; // true or false daytime or not

  WorldTime({this.location , this.flag , this.url});

  Future<void> getTime() async {

    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // get prpeties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);

      //create dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false ;
      time = DateFormat.jm().format(now);
    } catch(e){
      print('the error is $e');
      time = 'could not get time';
    }
  }
}