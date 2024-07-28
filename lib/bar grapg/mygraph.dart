import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:respiro_projectfltr/bar%20grapg/Bar_data.dart';

class BarChartExample extends StatelessWidget {
  final List airquality;

  const BarChartExample({
    super.key,
    required this.airquality,
  });

  @override
  Widget build(BuildContext context) {
    BarData mybardats = BarData(
        PM25: airquality[0],
        PM10: airquality[1],
        o3: airquality[2],
        co: airquality[3],
        NO2: airquality[4],
        SO3: airquality[5]);
    mybardats.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 600,
        minY: 0,
        barGroups: mybardats.barData
            .map((data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(toY: data.y),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
