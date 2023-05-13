import 'package:flutter/material.dart';
import 'package:happifeet/main.dart';

class HappiFeetAppBar {
  bool IsDashboard;

  HappiFeetAppBar({required this.IsDashboard});

  getAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: IsDashboard,
      actions: [
        IsDashboard
            ? TextButton(
                onPressed: () {
                  MyApp().gotoHome(context);
                },
                child: Text(
                  "Change City",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ))
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Back")),
              )
      ],
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      title: SizedBox(
          width: 56,
          height: 56,
          child:
              Image.network("https://www.keephappifeet.com/images/logo.png")),
    );
  }
}
