import 'package:flutter/material.dart';
import 'package:happifeet/components/HappiFeetAppBar.dart';
import 'package:happifeet/components/LocationView.dart';
import 'package:happifeet/utils/ColorParser.dart';

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
    return Scaffold(
      appBar: HappiFeetAppBar(IsDashboard: false).getAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationView(),
            getRadioFields(),
            getTextFields(),
            getAttachmentFields(),
            Container(
                margin: EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: ElevatedButton(onPressed: () {}, child: Text("Submit")))
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
                    Flexible(
                      child: Radio(
                        value: Anonymous.Yes,
                        groupValue: IsAnonymous,
                        onChanged: (value) {
                          setState(() {
                            IsAnonymous = value as Anonymous;
                          });
                        },
                      ),
                    ),
                    const Text("Yes"),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Flexible(
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
                    Flexible(
                      child: Radio(
                        value: Location.Yes,
                        groupValue: AllowLocation,
                        onChanged: (value) {
                          setState(() {
                            AllowLocation = value;
                          });
                        },
                      ),
                    ),
                    const Text("Yes"),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Flexible(
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
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: TextButton(
                  onPressed: () {}, child: Text("Attach Images/Videos")),
            ),
            Flexible(
              flex: 0,
              fit: FlexFit.tight,
              child: Text("0/3"),
            ),
          ]),
    );
  }
}
