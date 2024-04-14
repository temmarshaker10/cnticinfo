import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// z = ax + by ---> y = (-a/b) x + (z/b)
class MyLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart Example'),
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 500,
            child: Card(
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 25,
                  minY: 0,
                  maxY: 25,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, f(a: 2, x: 0, b: 3, z: 4)),
                        FlSpot(100, f(a: 2, x: 100, b: 3, z: 4)),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(0, f(a: 2, x: 0, b: 1, z: 18)),
                        FlSpot(100, f(a: 2, x: 100, b: 1, z: 18)),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(0, f(a: 1, x: 0, b: 1, z: 2)),
                        FlSpot(100, f(a: 1, x: 100, b: 1, z: 2)),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        //getTitlesWidget: leftTitleWidgets,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        //getTitlesWidget: leftTitleWidgets,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey),
                  ),
                  gridData: FlGridData(show: true),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double f({
    required double a,
    required double x,
    required double z,
    required double b,
  }) {
    print(-a / b * x + z / b);
    return -a / b * x + z / b;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyLineChart(),
    );
  }
}
