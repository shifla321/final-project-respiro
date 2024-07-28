import 'package:respiro_projectfltr/bar%20grapg/individual_bar.grap.dart';

class BarData {
  final double PM25;
  final double PM10;
  final double o3;
  final double co;
  final double NO2;
  final double SO3;

  BarData({
    required this.PM25,
    required this.PM10,
    required this.o3,
    required this.co,
    required this.NO2,
    required this.SO3,
  });
  List<individualBar> barData = [];

  void initializeBarData() {
    barData = [
      individualBar(x: 0, y: PM25),
      individualBar(x: 1, y: PM10),
      individualBar(x: 2, y: o3),
      individualBar(x: 3, y: co),
      individualBar(x: 4, y: NO2),
      individualBar(x: 5, y: SO3),
    ];
  }
}
