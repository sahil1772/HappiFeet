import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:happifeet/components/HappiFeetAppBar.dart';
import 'package:happifeet/model/ClientConfig.dart';
import 'package:happifeet/screen/Parks.dart';
import 'package:happifeet/utils/SessionTools.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  goToDashboard(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ));
  }

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    String appTitle = "";
    SessionTools().getAppTitle().then((value) {
      appTitle = value;
    });

    return Scaffold(
      appBar:
          HappiFeetAppBar(isDashboard: true, isThankYou: false, title: appTitle)
              .getAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            "Choose Location to\nShare Your Feedback",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          )),
          InkWell(
              onTap: () => const Parks().goToParks(context),
              child: Column(
                children: [
                  ImageGradient.linear(
                    image: Image.asset("assets/images/map.png", height: 200),
                    colors: [Theme.of(context).primaryColor,Theme.of(context).primaryColor.withAlpha(98)],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "Choose Location",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
      bottomNavigationBar: Flex(
        mainAxisSize: MainAxisSize.min,
        direction: Axis.vertical,
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: Container(
                        color: Theme.of(context).primaryColor,
                        height: 90,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home_filled,
                                color: Colors.white, size: 36),
                            Text(
                              "About Us",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        )),
                  )),
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: Container(
                        color: Theme.of(context).primaryColor,
                        height: 90,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.support_agent,
                                color: Colors.white, size: 36),
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        )),
                  )),
              Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                      color: Theme.of(context).primaryColor,
                      height: 90,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info, color: Colors.white, size: 36),
                          Text(
                            "Help",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      )))
            ],
          ),
          SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    "https://t4.ftcdn.net/jpg/04/95/28/65/360_F_495286577_rpsT2Shmr6g81hOhGXALhxWOfx1vOQBa.jpg"),
              ))
        ],
      ),
    );
  }
}
