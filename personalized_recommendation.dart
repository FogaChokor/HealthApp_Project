import 'package:flutter/material.dart';

void main() {
  runApp(PersonalizedRecommendationsApp());
}

class PersonalizedRecommendationsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersonalizedRecommendationsPage(),
    );
  }
}

class PersonalizedRecommendationsPage extends StatelessWidget {
  final List<Map<String, String>> recommendations = [
    {
      'text':
          'Have you taken 10,000 steps today? Try taking a short walk! 🚶‍♂️',
    },
    {
      'text': 'Consider drinking more water than usual to stay hydrated. 💧',
    },
    {
      'text':
          'Have you eaten any fruits today? Enjoy some fresh fruits as a snack. 🍏🍊🍇',
    },
    {
      'text':
          'Don\'t forget to take breaks and stretch if you\'ve been sitting for a while. 🧘‍♀️',
    },
    // Add more personalized recommendations with emojis as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lifestyle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: recommendations.length,
          itemBuilder: (context, index) {
            final recommendation = recommendations[index];
            return Card(
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  recommendation['text']!,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
