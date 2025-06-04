import 'package:flutter/material.dart';

class EmotionalDiaryPage extends StatefulWidget {
  @override
  _EmotionalDiaryPageState createState() => _EmotionalDiaryPageState();
}

class _EmotionalDiaryPageState extends State<EmotionalDiaryPage> {
  List<String> moods = [
    'Happy',
    'Sad',
    'Angry',
    'Calm',
    'Excited',
    'Anxious',
    // Add more moods as needed
  ];

  String? selectedMood;
  String diaryEntry = '';
  List<String> recordedEntries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotional Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Your Mood:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedMood,
              hint: Text('Select a mood'),
              items: moods
                  .map((mood) => DropdownMenuItem<String>(
                        value: mood,
                        child: Text(mood),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedMood = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Write How You Feel Today:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  diaryEntry = value;
                });
              },
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your thoughts here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (selectedMood != null && diaryEntry.isNotEmpty) {
                    recordedEntries
                        .add('Mood: $selectedMood\nEntry: $diaryEntry');
                    selectedMood = null;
                    diaryEntry = '';
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Record Entry'),
            ),
            SizedBox(height: 24),
            Text(
              'Recorded Entries:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recordedEntries.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        recordedEntries[index],
                        style: TextStyle(fontSize: 16),
                      ),
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
