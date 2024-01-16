import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:parking_ticketer/services/locationservices.dart';
import 'package:parking_ticketer/services/notificationServices.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? lat;
  String? long;
  double? spped;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<Position>(
          stream: LocationServices().getSpeed(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              double speedinKM = snapshot.data!.speed * 3.6;
              if (speedinKM > 0.01) {
                NotificationServices().shownotfication();
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // TextButton(
                    //     onPressed: () async {
                    //       // LocationServices().getCurrentLocation().then((value) {
                    //       //   lat = '${value.latitude}';
                    //       //   long = '${value.longitude}';
                    //       // });
                    //       // spped = LocationServices().getSpeed();
                    //     },
                    //     child: const Text(
                    //       'Get Speed',
                    //     )),
                    // Text(
                    //   'Your latitude :$lat Your longitude :$long',
                    // ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        onPressed: () async {
                          NotificationServices().shownotfication();

                          // LocationServices().getCurrentLocation().then((value) {
                          //   lat = '${value.latitude}';
                          //   long = '${value.longitude}';
                          // });
                          // spped = LocationServices().getSpeed();
                        },
                        child: const Text(
                          'Show Notifcation',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(height: 50),

                    Text(
                      'Your Current speed :${speedinKM.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              log("Error ${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
