import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //loc name of UI
  String time; //time of tht location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime; //true or false if day or not
  WorldTime({this.location, this.flag, this.url});
  Future<void> getTime() async {
    try {
      //MAke request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      print(datetime);
      //String offset = data['utc_offset'].substring(0, 3);
      //print(offset);
      //creta date time object
      DateTime now = DateTime.parse(datetime);
      print(now);
      now = now.add(Duration(
          hours: int.parse(data['utc_offset'].substring(0, 3)),
          minutes: int.parse(data['utc_offset'].substring(4, 6))));
      //Set time property
      //time = now.toString();
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      // print(time);
    } catch (e) {
      print('caught error::$e');
      time = 'could not get time data';
    }
  }
}
