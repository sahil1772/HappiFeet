import 'package:flutter/material.dart';
import 'package:happifeet/components/ExpandedSection.dart';
import 'package:happifeet/components/HappiFeetAppBar.dart';
import 'package:happifeet/components/LocationView.dart';
import 'package:happifeet/screen/Thankyou.dart';
import 'package:happifeet/utils/ColorParser.dart';
import 'package:happifeet/utils/SessionTools.dart';

class FeedbackPage extends StatefulWidget {
  goToFeedback(BuildContext context, String locationId) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeedbackPage(
            locationId: locationId,
          ),
        ));
  }

  bool expand = false;

  String locationId;

  FeedbackPage({Key? key, required this.locationId}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

enum Anonymous { Yes, No }

enum Location { Yes, No }

class _FeedbackPageState extends State<FeedbackPage> {
  Anonymous? IsAnonymous = Anonymous.Yes;
  Location? AllowLocation = Location.Yes;

  @override
  Widget build(BuildContext context) {
    String appTitle = "";
    SessionTools().getAppTitle().then((value) {
      appTitle = value;
    });
    return Scaffold(
      appBar: HappiFeetAppBar(
              isDashboard: false, isThankYou: false, title: appTitle)
          .getAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationView(),
            getRadioFields(),
            getTextFields(),
            getAttachmentFields(),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withAlpha(98),
                        ])),
                margin: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(
                    onPressed: () {
                      ThankYou(feedbackId: "1").goToThankYou(context, "1");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text("Submit")))
          ],
        ),
      ),
    );
  }

  getRadioFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Do you want to keep your feedback anonymous ?"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: Anonymous.Yes,
                      groupValue: IsAnonymous,
                      onChanged: (value) {
                        setState(() {
                          IsAnonymous = value as Anonymous;
                        });
                      },
                    ),
                    const Text("Yes"),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Radio(
                        value: Anonymous.No,
                        groupValue: IsAnonymous,
                        onChanged: (value) {
                          setState(() {
                            IsAnonymous = value;
                          });
                        },
                      ),
                    ),
                    const Text("No"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Do you want to share your location ?"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: Location.Yes,
                      groupValue: AllowLocation,
                      onChanged: (value) {
                        setState(() {
                          AllowLocation = value;
                        });
                      },
                    ),
                    const Text("Yes"),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Radio(
                        value: Location.No,
                        groupValue: AllowLocation,
                        onChanged: (value) {
                          setState(() {
                            AllowLocation = value;
                          });
                        },
                      ),
                    ),
                    const Text("No"),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  getTextFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
              decoration: InputDecoration(
                  labelText: "Name (Optional)",
                  hintText: "Please provide your name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: ColorParser().hexToColor("#AEAEAE"))))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: TextField(
              decoration: InputDecoration(
                  labelText: "Email (Optional)",
                  hintText: "Please provide a email we can reach out to",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: ColorParser().hexToColor("#AEAEAE"))))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                  labelText: "Description (Optional)",
                  hintMaxLines: 2,
                  hintText:
                      "Please provide us your valuable feedback so that we can improve our service.",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: ColorParser().hexToColor("#AEAEAE"))))),
        )
      ],
    );
  }

  getAttachmentFields() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          widget.expand = !widget.expand;
                        });
                      },
                      child: const Text("Attach Images/Videos")),
                ),
                const Flexible(
                  flex: 0,
                  fit: FlexFit.tight,
                  child: Text("0/3"),
                ),
              ]),
          ExpandedSection(
              expand: widget.expand,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Capture\nImage",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_search,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Pick from\nGallery",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.video_call,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Capture\nVideo",
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
