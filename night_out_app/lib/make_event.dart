import 'package:final_ui/pages/my_events.dart';
import 'package:flutter/material.dart';

class EventPlannerPage extends StatefulWidget {
  @override
  _EventPlannerPageState createState() => _EventPlannerPageState();
}

class _EventPlannerPageState extends State<EventPlannerPage> {
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _ticketPriceController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Creare Event',
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text(
              'Upload Event Banner',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Widget for uploading event banner
            Placeholder(
              fallbackHeight: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Event Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _eventNameController,
              decoration: InputDecoration(
                hintText: 'Enter event name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ticket Price (LKR)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ticketPriceController,
              decoration: InputDecoration(
                hintText: 'Enter ticket price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                hintText: 'Enter event time',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Location',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Enter event location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to save event details
                // For example, you can use the controllers to get the values entered by the user
                //String eventName = _eventNameController.text;
                //String ticketPrice = _ticketPriceController.text;
                //String time = _timeController.text;
                //String location = _locationController.text;

                // Now you can use these values as needed, like sending them to a database or processing them further.
              },
              child: Text('Save Event'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => My_events()),
                );
              },
              child: Text('My Events'),
            ),
          ],
        ),
      ),
    );
  }
}
