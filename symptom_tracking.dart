import 'package:flutter/material.dart';

class SymptomTrackingPage extends StatefulWidget {
  @override
  _SymptomTrackingPageState createState() => _SymptomTrackingPageState();
}

class _SymptomTrackingPageState extends State<SymptomTrackingPage> {
  List<String> predefinedSymptoms = [
    'Pain',
    'Fatigue',
    'Shortness of breath',
    'Dizziness',
    'Fever',
    // Add more predefined symptoms as needed
  ];

  String? selectedSymptom;
  String customSymptom = '';
  double symptomSeverity = 0; // Initial severity value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptom Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select or Add Symptoms:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedSymptom,
              hint: Text('Select a symptom'),
              items: predefinedSymptoms
                  .map((symptom) => DropdownMenuItem<String>(
                        value: symptom,
                        child: Text(symptom),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSymptom = value;
                  customSymptom = ''; // Clear custom symptom input
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  customSymptom = value;
                  selectedSymptom = null; // Clear selected symptom
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter a custom symptom',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (customSymptom.isNotEmpty &&
                      !predefinedSymptoms.contains(customSymptom)) {
                    predefinedSymptoms.add(customSymptom);
                    selectedSymptom = customSymptom;
                    customSymptom = '';
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Add Custom Symptom'),
            ),
            SizedBox(height: 24),
            Text(
              'Rate the severity of your symptom:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Slider(
              value: symptomSeverity,
              onChanged: (value) {
                setState(() {
                  symptomSeverity = value;
                });
              },
              min: 0,
              max: 10, // You can adjust the range as needed
              divisions: 10, // Number of divisions or steps
              label: '$symptomSeverity', // Display the current value
            ),
            SizedBox(height: 16),
            Text(
              'Symptom Severity: ${symptomSeverity.toStringAsFixed(1)}', // Display the severity with one decimal place
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Recorded Symptoms:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: predefinedSymptoms.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      predefinedSymptoms[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
