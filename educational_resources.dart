import 'package:flutter/material.dart';

class EducationalResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Resources'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ResourceCard(
            title: 'Understanding Sickle Cell Disease',
            description:
                'Learn about the basics of Sickle Cell Disease, its causes, and symptoms.',
          ),
          ResourceCard(
            title: 'Treatment Options',
            description:
                'Explore different treatment options available for Sickle Cell Disease.',
          ),
          ResourceCard(
            title: 'Coping Strategies',
            description:
                'Discover strategies for managing pain and improving the quality of life with Sickle Cell Disease.',
          ),
          ResourceCard(
            title: 'Support Groups',
            description:
                'Find support groups and communities for individuals with Sickle Cell Disease.',
          ),
        ],
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final String title;
  final String description;

  ResourceCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.red, // Set the primary color to red
    ),
    home: EducationalResourcesPage(),
  ));
}
