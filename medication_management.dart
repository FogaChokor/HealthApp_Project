import 'package:flutter/material.dart';

class MedicationManagementPage extends StatefulWidget {
  @override
  _MedicationManagementPageState createState() =>
      _MedicationManagementPageState();
}

class _MedicationManagementPageState extends State<MedicationManagementPage> {
  // List of medications (static data)
  List<String> medications = [
    'Medication 1',
    'Medication 2',
    'Medication 3',
    // Add more medications here
  ];

  // List of medications for today with schedule (static data)
  List<MedicationWithSchedule> medicationsForToday = [
    MedicationWithSchedule('Medication A', '8:00 AM'),
    MedicationWithSchedule('Medication B', '1:00 PM'),
    // Add more medications and schedules for today here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Management'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'List of Current Medications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(medications[index]),
                  // Add more details about the medication here
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'List of Medications for Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medicationsForToday.length,
              itemBuilder: (context, index) {
                final medication = medicationsForToday[index];
                return ListTile(
                  title: Text(medication.name),
                  subtitle: Text('Schedule: ${medication.schedule}'),
                  // Add more details or actions related to medication for today here
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement logic to add a new medication
          _addMedication();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Function to add a new medication
  void _addMedication() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newMedicationName = ''; // Store the new medication name
        String newMedicationSchedule = ''; // Store the new medication schedule

        return AlertDialog(
          title: Text('Add Medication'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  // Update the new medication name as the user types
                  setState(() {
                    newMedicationName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Medication Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  // Update the new medication schedule as the user types
                  setState(() {
                    newMedicationSchedule = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Schedule (e.g., 8:00 AM)',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new medication to the list for today
                setState(() {
                  medicationsForToday.add(MedicationWithSchedule(
                      newMedicationName, newMedicationSchedule));
                });

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class MedicationWithSchedule {
  final String name;
  final String schedule;

  MedicationWithSchedule(this.name, this.schedule);
}
