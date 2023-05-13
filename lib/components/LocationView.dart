import 'package:flutter/material.dart';
import 'package:happifeet/screen/Feedback.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FeedbackPage(
          locationId: "1",
        ).goToFeedback(context, "1");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Card(
              color: Theme.of(context).primaryColor,
              child: const SizedBox(
                width: 80,
                height: 80,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Park Name",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.0),
                      child: Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 24,
                            margin: EdgeInsets.only(right: 10),
                            width: 24,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            height: 24,
                            margin: EdgeInsets.only(right: 10),
                            width: 24,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            height: 24,
                            margin: EdgeInsets.only(right: 10),
                            width: 24,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            height: 24,
                            margin: EdgeInsets.only(right: 10),
                            width: 24,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
