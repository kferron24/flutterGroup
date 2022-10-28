import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, bool?> lightSwitches = {
    'Living Room': true,
    'Bedroom': false,
    'Dining Room': true,
    'Kitchen': true,
    'Entrance': true,
  };

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text('Light Switches',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black54)),
          ),
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: lightSwitches.keys
                      .map((roomName) => CheckboxListTile(
                            title: Text(roomName),
                            value: lightSwitches[roomName],
                            onChanged: (bool? value) {
                              setState(() {
                                lightSwitches[roomName] = value;
                              });
                            },
                          ))
                      .toList(),
                ),
              )),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text('Light Icons',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black54)),
          ),
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: lightSwitches.keys
                      .map((roomName) => LightBulbCard(
                            room: roomName,
                            on: lightSwitches[roomName],
                          ))
                      .toList(),
                ),
              )),
        ]));
  }
}

class LightBulbCard extends StatelessWidget {
  const LightBulbCard({super.key, 
    this.on = true,
    this.room = 'Room Name',
  });

  final bool? on;
  final String room;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffeeeeee), width: 2.0),
        color: Colors.white38,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(8),
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.lightbulb,
            size: 100.0,
            color: on! ? Colors.yellow : Colors.grey,
          )),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            room,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}