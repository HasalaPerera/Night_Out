import 'package:final_ui/pages/add_event.dart';
import 'package:final_ui/pages/make_event.dart';
import 'package:final_ui/pages/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int points = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Profile',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                fontSize: 25,
              ),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileSettingsPage()),
                );
                // Add functionality to navigate to settings screen
              },
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profile.png"),
                      radius: 60.0,
                    ),
                    SizedBox(height: 10), // Adjust the height as needed
                    Text(
                      'Hasala Perera',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                        height:
                            10), // Add some space between the text and the button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddEvent()),
                        );
                        // Add functionality for "Become an Event Planner" button
                      },
                      child: Text('Become a Event Planner'),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Book marks',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 244, 74, 247),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/event_1.jpg",
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20.0),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "My first scroll list ",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Time",
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Location",
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your button functionality here
                                  },
                                  child: Text('View'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      right: 5.0,
                      child: IconButton(
                        icon: Icon(Icons.highlight_remove_rounded),
                        onPressed: () {
                          // Add functionality to remove the container here
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
