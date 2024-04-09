import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Offers for you',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          _buildTopNavigationBar(),
          Expanded(
            child: _buildEventSection(),
          ),
        ],
      ),
    );
  }

    Widget _buildTopNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _currentIndex == 0 ? Colors.purple : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Today Offers',
                style: TextStyle(
                  color: _currentIndex == 0 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _currentIndex == 1 ? Colors.purple : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Upcoming',
                style: TextStyle(
                  color: _currentIndex == 1 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventSection() {
    if (_currentIndex == 0) {
      // Today Events
      return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 162, 2, 255),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Material(
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
          ),
        ],
      );
    } else {
      // Upcoming Events
      return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 162, 2, 255),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Material(
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
          ),
        ],
      );
    }
  }
}
