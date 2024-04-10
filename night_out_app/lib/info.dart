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
             
            ],
          ),
        ),
      ),
    );
  }
}
