import 'package:flutter/material.dart';
import 'package:happifeet/main.dart';

class HappiFeetAppBar {
  bool isDashboard;
  bool isThankYou;
  String title;

  HappiFeetAppBar(
      {required this.isDashboard,
      required this.isThankYou,
      required this.title});

  getAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isDashboard,
      actions: [
        isDashboard
            ? TextButton(
                onPressed: () {
                  const MyApp().gotoHome(context);
                },
                child: Text(
                  "Change City",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ))
            : !isThankYou
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Back")),
                  )
                : const SizedBox()
      ],
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      // leading:  Text(title) ,
      title: SizedBox(
          width: 56,
          height: 56,
          child:
              Image.network("https://www.keephappifeet.com/images/logo.png")),
    );
  }
}
