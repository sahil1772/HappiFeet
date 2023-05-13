import 'package:flutter/material.dart';
import 'package:happifeet/components/HappiFeetAppBar.dart';

class ThankYou extends StatelessWidget {
  goToThankYou(BuildContext context, String feedbackId) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ThankYou(
            feedbackId: feedbackId,
          ),
        ));
  }

  String feedbackId;

  ThankYou({Key? key, required this.feedbackId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HappiFeetAppBar(IsDashboard: false, IsThankYou: true)
          .getAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Thank You")),
          Padding(
            padding: const EdgeInsets.all(56.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("Back to Dashboard")),
          )
        ],
      ),
    );
  }
}
