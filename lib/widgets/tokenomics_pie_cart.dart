import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TokenomicsPieChart extends StatelessWidget {
  const TokenomicsPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 90,
                  title: 'PUBLIC',
                  color: Colors.blueAccent,
                  radius: 75,
                  titleStyle:
                      const TextStyle(color: Colors.white, fontSize: 12),
                ),
                PieChartSectionData(
                  value: 3,
                  title: 'DEV',
                  color: Colors.orange,
                  radius: 75,
                  titleStyle:
                      const TextStyle(color: Colors.white, fontSize: 12),
                ),
                PieChartSectionData(
                  value: 2,
                  color: Colors.purple,
                  radius: 75,
                  showTitle: false,
                  titleStyle:
                      const TextStyle(color: Colors.white, fontSize: 12),
                ),
                PieChartSectionData(
                  value: 3,
                  color: Colors.green,
                  radius: 75,
                  showTitle: false,
                  titleStyle:
                      const TextStyle(color: Colors.white, fontSize: 12),
                ),
                PieChartSectionData(
                  value: 2,
                  color: Colors.red,
                  radius: 75,
                  showTitle: false,
                  titleStyle:
                      const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
              sectionsSpace: 0,
              centerSpaceRadius: 50,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 4,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.blueAccent,
                ),
                const Text('Public Sale 92%',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.orange,
                ),
                const Text('Dev 3%', style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.purple,
                ),
                const Text('Marketing 2%',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.green,
                ),
                const Text('Rewards 3%', style: TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              spacing: 4,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.red,
                ),
                const Text('Ecosystem 2%',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
