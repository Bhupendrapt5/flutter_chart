import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;

  StackedBarChart(
    this.seriesList,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: charts.BarChart(
        seriesList,
        animate: true,
        // defaultInteractions: false,
        animationDuration: Duration(seconds: 1),
        barGroupingType: charts.BarGroupingType.stacked,
        behaviors: [
          charts.SeriesLegend(
            showMeasures: true,
          )
        ],
      ),
    );
  }
}
