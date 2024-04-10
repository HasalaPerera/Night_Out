import 'package:final_ui/pages/events.dart';
import 'package:final_ui/pages/navbar.dart';
import 'package:final_ui/pages/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(215, 152, 250, 1),
        title: const Text(
          "Hello, Hasala !",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                color: Color.fromRGBO(215, 152, 250, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Text(
                        "Explore your night !",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list),
                      label: Text('Filter'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(237, 205, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                          side: BorderSide(
                            color: Color.fromRGBO(202, 117, 248, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Events',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Events()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                      ),
                    ),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/event_1.jpg",
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "My first event",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Time",
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Location",
                            ),
                            SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: () {
                                // Add your button functionality here
                              },
                              child: Text('View'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/event_1.jpg",
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "My first event",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Time",
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Location",
                            ),
                            SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: () {
                                // Add your button functionality here
                              },
                              child: Text('View'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/event_1.jpg",
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "My first event",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Time",
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Location",
                            ),
                            SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: () {
                                // Add your button functionality here
                              },
                              child: Text('View'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Offers',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Offers()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                      ),
                    ),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/event_1.jpg",
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "My first event",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Time",
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Location",
                            ),
                            SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: () {
                                // Add your button functionality here
                              },
                              child: Text('View'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/event_1.jpg",
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "My first event",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Time",
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Location",
                            ),
                            SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: () {
                                // Add your button functionality here
                              },
                              child: Text('View'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/event_1.jpg",
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "My first event",
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Time",
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Location",
                            ),
                            SizedBox(height: 5.0),
                            ElevatedButton(
                              onPressed: () {
                                // Add your button functionality here
                              },
                              child: Text('View'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
