import 'package:flutter/material.dart';

class AppointmentManagementPage extends StatefulWidget {
  @override
  _AppointmentManagementPageState createState() =>
      _AppointmentManagementPageState();
}

class _AppointmentManagementPageState extends State<AppointmentManagementPage> {
  List<String> bookedAppointments = [
    'Appointment 1: August 20, 2023, 10:00 AM',
    'Appointment 2: September 5, 2023, 2:30 PM',
  ];

  String? selectedAppointment;
  String appointmentRequest = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booked Appointments:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: bookedAppointments.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        bookedAppointments[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            bookedAppointments.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Manage Appointments:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedAppointment,
              hint: Text('Select an appointment'),
              items: bookedAppointments
                  .map((appointment) => DropdownMenuItem<String>(
                        value: appointment,
                        child: Text(appointment),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedAppointment = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  appointmentRequest = value;
                });
              },
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your appointment request',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (appointmentRequest.isNotEmpty) {
                        bookedAppointments
                            .add('Appointment Request: $appointmentRequest');
                        selectedAppointment = null;
                        appointmentRequest = '';
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Request Appointment'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedAppointment != null) {
                        bookedAppointments.remove(selectedAppointment);
                        selectedAppointment = null;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Cancel Appointment'),
                ),
              ],
            ),
            SizedBox(height: 16), // Add this SizedBox for spacing
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedAppointment != null &&
                      appointmentRequest.isNotEmpty) {
                    bookedAppointments.remove(selectedAppointment);
                    bookedAppointments.add('Rescheduled: $appointmentRequest');
                    selectedAppointment = null;
                    appointmentRequest = '';
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Reschedule'),
            ),
          ],
        ),
      ),
    );
  }
}
