import 'dart:convert';
import 'dart:developer';

import 'package:happifeet/model/ClientConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionTools{
  Future<String> getAppTitle() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String jsonClient = sharedPreferences.getString("client")!;

    var encodedString = jsonEncode(jsonClient);


    Map<String, dynamic> valueMap = json.decode(jsonClient);

    ClientConfig config = ClientConfig.fromJson(valueMap);

    log(config.appTitle);

    return config.appTitle;
  }
}