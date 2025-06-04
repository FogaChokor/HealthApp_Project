// import 'package:first_app/appointment_management.dart';
import 'package:first_app/connections.dart';
import 'package:first_app/heatlh_report.dart';
import 'package:first_app/personalized_recommendation.dart';
import 'package:flutter/material.dart';
import 'symptom_tracking.dart'; // Import the SymptomTrackingPage
import 'medication_management.dart'; // Import the MedicationManagementPage
import 'educational_resources.dart'; // Import the MedicationManagementPage
import 'emotional_diary.dart'; // Import the MedicationManagementPage
import 'appointment_management.dart'; // Import the MedicationManagementPage

void main() {
  runApp(HomePageApp());
}

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent, // Set the primary color to red
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sickle Cell Care'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            FeatureButton(
              1,
              'Symptom Tracking',
              Icons.timeline,
              'Track and record SCD symptoms over time.',
            ),
            FeatureButton(
              2,
              'Medication Management',
              Icons.medical_services,
              'Set reminders for medications and track dosage schedules.',
            ),
            FeatureButton(
              3,
              'Educational Resources',
              Icons.library_books,
              'Access evidence-based resources about SCD and treatment.',
            ),
            FeatureButton(
              4,
              'Emotional Diary',
              Icons.mood,
              'Document and track your emotional well-being.',
            ),
            FeatureButton(
              5,
              'Connections',
              Icons.chat,
              'Connect with other patients for support and sharing.',
            ),
            FeatureButton(
              6,
              'Lifestyle',
              Icons.lightbulb,
              'Receive tailored lifestyle recommendations.',
            ),
            FeatureButton(
              7,
              'Appointment Management',
              Icons.calendar_today,
              'Keep track of medical appointments and receive reminders.',
            ),
            FeatureButton(
              8,
              'Health Report',
              Icons.insert_chart,
              'Visualize weekly and monthly health data trends.',
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final int featureNumber;
  final String title;
  final IconData icon;
  final String description;

  FeatureButton(this.featureNumber, this.title, this.icon, this.description);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (featureNumber == 1) {
          // Navigate to SymptomTrackingPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SymptomTrackingPage()),
          );
        } else if (featureNumber == 2) {
          // Navigate to MedicationManagementPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicationManagementPage()),
          );
        } else if (featureNumber == 3) {
          // Navigate to MedicationManagementPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EducationalResourcesPage()),
          );
        } else if (featureNumber == 4) {
          // Navigate to MedicationManagementPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmotionalDiaryPage()),
          );
        } else if (featureNumber == 5) {
          // Navigate to MedicationManagementPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConnectionsPage()),
          );
        } else if (featureNumber == 6) {
          // Navigate to MedicationManagementPage
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PersonalizedRecommendationsPage()),
          );
        } else if (featureNumber == 7) {
          // Navigate to MedicationManagementPage
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AppointmentManagementPage()),
          );
        } else if (featureNumber == 8) {
          // Navigate to MedicationManagementPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HealthReportPage()),
          );
        } else {
          // Navigate to other feature pages
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FeaturePage(featureNumber, title)),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        elevation: 3,
        padding: EdgeInsets.all(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Theme.of(context).primaryColor),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set text color to black
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class FeaturePage extends StatelessWidget {
  final int featureNumber;
  final String title;

  FeaturePage(this.featureNumber, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('This is the $title feature page'),
      ),
    );
  }
}
