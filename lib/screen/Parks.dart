import 'package:flutter/material.dart';
import 'package:happifeet/components/HappiFeetAppBar.dart';
import 'package:happifeet/components/LocationView.dart';
import 'package:happifeet/utils/ColorParser.dart';

class Parks extends StatefulWidget {
  goToParks(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Parks(),
        ));
  }

  const Parks({Key? key}) : super(key: key);

  @override
  State<Parks> createState() => _ParksState();
}

class _ParksState extends State<Parks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HappiFeetAppBar(IsDashboard: false, IsThankYou: false)
          .getAppBar(context),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              const Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  )),
              Flexible(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Sort Alphabetically")),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search Locations Here",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: ColorParser().hexToColor("#AEAEAE"))))),
          ),
          Flexible(
            flex: 1,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 15,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const LocationView();
              },
            ),
          )
        ],
      ),
    );
  }
}
