import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:happifeet/model/AboutUs.dart';
import 'package:happifeet/model/ClientConfig.dart';
import 'package:happifeet/model/Contact.dart';
import 'package:happifeet/model/HelpData.dart';
import 'package:happifeet/screen/Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

StreamController<ClientConfig> clientConfig = StreamController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List<ClientConfig> clients = [];

  @override
  void initState() {
    super.initState();

    getClients();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ClientConfig>(
        initialData: getClient1(),
        stream: clientConfig.stream,
        builder: (context, snapshot) {
          ClientConfig client = snapshot.data!;

          log("CLIENT SWITCHED : ", name: "SWITCHER", error: client.toJson());

          saveClient(client);

          return MaterialApp(
              theme: client.getAppTheme(),
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  appBar: AppBar(title: Text(client.getAppTitle)),
                  body: PickerPage(
                    clients: clients,
                  )));
        });
  }

  ClientConfig getClient1() {
    ClientConfig client = ClientConfig(
        appTitle: "HappiFeet - Atlanta Parks",
        clientId: 101.toString(),
        appDescription:
            "HappiFeet Atlanta Parks is a sub app of HappiFeet app. It contains parks based in city of Atlanta.",
        appLogo: "",
        appContact: Contact(
            appContactURL: "https://www.keephappifeet.com/#contact",
            appContactAddress: "appContactAddress",
            appContactDescription: "appContactDescription"),
        appAboutUs: AboutUs(
            appAboutUsDescription:
                "HAPPiFEET empowers parks and recreation agencies to address customer issues in real-time so they can KEEP HAPPiFEET...\nbecause unhappy customers vote with their feet.\n\n\nUsers share via text, pictures or videos their experiences from any custom location. Agency staff receives and can respond to guests in real-time.\nApp dashboards allow agencies to track user feedback daily, weekly, annually or by any individual site in the system and use real-time data to meet and exceed community expectations."),
        appHelpData:
            HelpData(id: 101.toString(), imageLink: "imageLink", imagePos: 0),
        canScanQR: false);

    client.appPrimaryColor = "#ff0000";
    client.appAccentColor = "#ff0000";
    client.appSecondaryColor = "#ff0000";
    return client;
  }

  ClientConfig getClient2() {
    ClientConfig client = ClientConfig(
        appTitle: "HappiFeet - Oregon City Parks",
        clientId: 102.toString(),
        appDescription:
            "HappiFeet Oregon City Parks is a sub app of HappiFeet app. It contains parks based in city of Atlanta.",
        appLogo: "",
        appContact: Contact(
            appContactURL: "https://www.keephappifeet.com/#contact",
            appContactAddress: "appContactAddress",
            appContactDescription: "appContactDescription"),
        appAboutUs: AboutUs(
            appAboutUsDescription:
                "HAPPiFEET empowers parks and recreation agencies to address customer issues in real-time so they can KEEP HAPPiFEET...\nbecause unhappy customers vote with their feet.\n\n\nUsers share via text, pictures or videos their experiences from any custom location. Agency staff receives and can respond to guests in real-time.\nApp dashboards allow agencies to track user feedback daily, weekly, annually or by any individual site in the system and use real-time data to meet and exceed community expectations."),
        appHelpData:
            HelpData(id: 102.toString(), imageLink: "imageLink", imagePos: 0),
        canScanQR: false);

    client.appPrimaryColor = "#00ff00";
    client.appAccentColor = "#00ff00";
    client.appSecondaryColor = "#00ff00";
    return client;
  }

  ClientConfig getClient3() {
    ClientConfig client = ClientConfig(
        appTitle: "HappiFeet - Sandy Springs Parks",
        clientId: 101.toString(),
        appDescription:
            "HappiFeet Sandy Springs Parks is a sub app of HappiFeet app. It contains parks based in city of Atlanta.",
        appLogo: "",
        appContact: Contact(
            appContactURL: "https://www.keephappifeet.com/#contact",
            appContactAddress: "appContactAddress",
            appContactDescription: "appContactDescription"),
        appAboutUs: AboutUs(
            appAboutUsDescription:
                "HAPPiFEET empowers parks and recreation agencies to address customer issues in real-time so they can KEEP HAPPiFEET...\nbecause unhappy customers vote with their feet.\n\n\nUsers share via text, pictures or videos their experiences from any custom location. Agency staff receives and can respond to guests in real-time.\nApp dashboards allow agencies to track user feedback daily, weekly, annually or by any individual site in the system and use real-time data to meet and exceed community expectations."),
        appHelpData:
            HelpData(id: 101.toString(), imageLink: "imageLink", imagePos: 0),
        canScanQR: false);

    client.appPrimaryColor = "#0000ff";
    client.appAccentColor = "#0000ff";
    client.appSecondaryColor = "#0000ff";
    return client;
  }

  void getClients() {
    clients.add(getClient1());
    clients.add(getClient2());
    clients.add(getClient3());
  }

  Future<void> saveClient(ClientConfig client) async {
    debugPrint(JsonEncoder().convert(client.toJson()));
    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool result = await prefs.setString('client', jsonEncode(client));

    log("CLIENT UPDATED?? ", name: "SWITCHER", error: result);
  }
}

class PickerPage extends StatefulWidget {
  List<ClientConfig> clients = [];

  PickerPage({Key? key, required this.clients}) : super(key: key);

  @override
  State<PickerPage> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        for (int i = 0; i < widget.clients.length; i++)
          InkWell(
            onTap: () {
              clientConfig.add(widget.clients[i]);
              Future.delayed(const Duration(milliseconds: 500), () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ));
                });
              });
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 64,
              child: Center(child: Text(widget.clients[i].getAppTitle)),
            ),
          )
      ],
    );
  }
}
