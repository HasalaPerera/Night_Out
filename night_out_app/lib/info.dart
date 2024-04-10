import 'package:flutter/material.dart';

class AboutEmergencyPage extends StatefulWidget {
  @override
  _AboutEmergencyPageState createState() => _AboutEmergencyPageState();
}

class _AboutEmergencyPageState extends State<AboutEmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Info',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 159, 0, 133),
      ),
      backgroundColor: const Color.fromARGB(255, 159, 0, 133),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'About Night Out',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // Set text color to white
              ),
              SizedBox(height: 20.0),
              Text(
                'Night Out is a mobile app that is dedicated to providing you with necessary information regarding the nightlife of Sri Lanka such as events, concerts, shows, restaurant offers, etc. Our main objective is to provide you with reliable and accurate information so you can have a good time out there without having to worry. Night Out can be considered as the first proper digital footprint in mobile apps that gives you up-to-date information about the nightlife. And also we are glad to help out business entities that are specialized in nighttime activities.',
                textAlign: TextAlign.justify,
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
              SizedBox(height: 40.0),
              Text(
                'Emergency Contacts',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // Set text color to white
              ),
              SizedBox(height: 20.0),
              Text(
                'Police: 118 / 119\nFire Department: 110\nAmbulance: 1990\nGovernment Information Center: 1919',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white), // Set text color to white
              ),
            ],
          ),
        ),
      ),
    );
  }
}
