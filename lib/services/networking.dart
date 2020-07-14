import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper(this.url);
  final String url;
  Future getdata() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      // var longitude = jsonDecode(data)['coord'][
      //     'lon']; //to access value stored in ion we to mention parent and then lon
      // print(longitude);
      // var weatherdesc = jsonDecode(data)['weather'][0][
      //     'description']; //here the parent is weather its child is list it has one list and
      // // so its position will be 0 hence the index 0 and in that 0th list we want to access desciption hence that
      // print(weatherdesc);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
