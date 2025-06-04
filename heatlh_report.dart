import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(HealthReportApp());
}

class HealthReportApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealthReportPage(),
    );
  }
}

class HealthReportPage extends StatelessWidget {
  final List<double> waterData = [
    80,
    70,
    90,
    85,
    95,
    100,
    92,
    88,
    78,
    82,
    75,
    60
  ]; // Replace with your water intake data
  final List<double> stepsData = [
    8000,
    9000,
    7500,
    8500,
    9500,
    10000,
    9200,
    8800,
    7800,
    8200,
    7500,
    6000
  ]; // Replace with your steps data
  final List<double> sleepData = [
    7.5,
    8.0,
    7.8,
    8.2,
    7.2,
    8.5,
    9.0,
    7.5,
    8.3,
    8.8,
    7.0,
    7.5
  ]; // Replace with your sleep data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Report'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WaterIntakeChart(waterData: waterData),
              SizedBox(height: 24.0),
              StepsTakenChart(stepsData: stepsData),
              SizedBox(height: 24.0),
              SleepChart(sleepData: sleepData),
            ],
          ),
        ),
      ),
    );
  }
}

class WaterIntakeChart extends StatelessWidget {
  final List<double> waterData;

  WaterIntakeChart({required this.waterData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Water Intake',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: true),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Jan';
                      case 1:
                        return 'Feb';
                      case 2:
                        return 'Mar';
                      case 3:
                        return 'Apr';
                      case 4:
                        return 'May';
                      case 5:
                        return 'Jun';
                      case 6:
                        return 'Jul';
                      case 7:
                        return 'Aug';
                      case 8:
                        return 'Sep';
                      case 9:
                        return 'Oct';
                      case 10:
                        return 'Nov';
                      case 11:
                        return 'Dec';
                      default:
                        return '';
                    }
                  },
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: const Color(0xff37434d),
                  width: 1,
                ),
              ),
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 120,
              lineBarsData: [
                LineChartBarData(
                  spots: waterData.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value);
                  }).toList(),
                  isCurved: true,
                  colors: [Colors.blue],
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'Water Intake (in oz)',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class StepsTakenChart extends StatelessWidget {
  final List<double> stepsData;

  StepsTakenChart({required this.stepsData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Steps Taken',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: true),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Jan';
                      case 1:
                        return 'Feb';
                      case 2:
                        return 'Mar';
                      case 3:
                        return 'Apr';
                      case 4:
                        return 'May';
                      case 5:
                        return 'Jun';
                      case 6:
                        return 'Jul';
                      case 7:
                        return 'Aug';
                      case 8:
                        return 'Sep';
                      case 9:
                        return 'Oct';
                      case 10:
                        return 'Nov';
                      case 11:
                        return 'Dec';
                      default:
                        return '';
                    }
                  },
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: const Color(0xff37434d),
                  width: 1,
                ),
              ),
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 12000, // Adjust the maximum value based on your data
              lineBarsData: [
                LineChartBarData(
                  spots: stepsData.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value);
                  }).toList(),
                  isCurved: true,
                  colors: [Colors.green],
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'Steps Taken',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SleepChart extends StatelessWidget {
  final List<double> sleepData;

  SleepChart({required this.sleepData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sleep Duration',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: true),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Jan';
                      case 1:
                        return 'Feb';
                      case 2:
                        return 'Mar';
                      case 3:
                        return 'Apr';
                      case 4:
                        return 'May';
                      case 5:
                        return 'Jun';
                      case 6:
                        return 'Jul';
                      case 7:
                        return 'Aug';
                      case 8:
                        return 'Sep';
                      case 9:
                        return 'Oct';
                      case 10:
                        return 'Nov';
                      case 11:
                        return 'Dec';
                      default:
                        return '';
                    }
                  },
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: const Color(0xff37434d),
                  width: 1,
                ),
              ),
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 10, // Adjust the maximum value based on your data
              lineBarsData: [
                LineChartBarData(
                  spots: sleepData.asMap().entries.map((entry) {
                    return FlSpot(entry.key.toDouble(), entry.value);
                  }).toList(),
                  isCurved: true,
                  colors: [Colors.purple],
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'Sleep Duration (in hours)',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
