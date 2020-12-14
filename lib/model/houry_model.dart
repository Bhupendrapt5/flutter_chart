import 'package:chart_demo/model/dataValueSet.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HourlyModel {
  final List<int> h10am;
  final List<int> h12pm;
  final List<int> h2pm;
  final List<int> h4pm;
  final List<int> h6pm;
  final List<int> h8pm;

  HourlyModel({
    this.h10am,
    this.h12pm,
    this.h2pm,
    this.h4pm,
    this.h6pm,
    this.h8pm,
  });

  factory HourlyModel.fromMap(Map<String, dynamic> map) {
    return HourlyModel(
      h10am: List<int>.from(map['10am']),
      h12pm: List<int>.from(map['12am']),
      h2pm: List<int>.from(map['2pm']),
      h4pm: List<int>.from(map['4pm']),
      h6pm: List<int>.from(map['6pm']),
      h8pm: List<int>.from(map['8pm']),
    );
  }
  List<charts.Series<DataValueSet, String>> hourlySeries() {
    final busStats = [
      DataValueSet('10AM', this.h10am[2]),
      DataValueSet('12AM', this.h12pm[2]),
      DataValueSet('2PM', this.h2pm[2]),
      DataValueSet('4PM', this.h4pm[2]),
      DataValueSet('6PM', this.h6pm[2]),
      DataValueSet('8PM', this.h8pm[2]),
    ];
    final carStats = [
      DataValueSet('10AM', this.h10am[1]),
      DataValueSet('12AM', this.h12pm[1]),
      DataValueSet('2PM', this.h2pm[1]),
      DataValueSet('4PM', this.h4pm[1]),
      DataValueSet('6PM', this.h6pm[1]),
      DataValueSet('8PM', this.h8pm[1]),
    ];
    final bikeStats = [
      DataValueSet('10AM', this.h10am[0]),
      DataValueSet('12AM', this.h12pm[0]),
      DataValueSet('2PM', this.h2pm[0]),
      DataValueSet('4PM', this.h4pm[0]),
      DataValueSet('6PM', this.h6pm[0]),
      DataValueSet('8PM', this.h8pm[0]),
    ];
    return [
      charts.Series<DataValueSet, String>(
        id: 'Bus',
        domainFn: (DataValueSet sales, _) => sales.year,
        measureFn: (DataValueSet sales, _) => sales.count,
        data: busStats,
        displayName: 'Bus',
        seriesColor: charts.ColorUtil.fromDartColor(Colors.blueGrey),
        labelAccessorFn: (datum, i) => busStats[i].count.toString(),
      ),
      charts.Series<DataValueSet, String>(
        id: 'Car',
        domainFn: (DataValueSet sales, _) => sales.year,
        measureFn: (DataValueSet sales, _) => sales.count,
        data: carStats,
        labelAccessorFn: (datum, i) => carStats[i].count.toString(),
        seriesColor: charts.ColorUtil.fromDartColor(Colors.cyan),
        displayName: 'Car',
      ),
      charts.Series<DataValueSet, String>(
        id: 'Bike',
        domainFn: (DataValueSet sales, _) => sales.year,
        measureFn: (DataValueSet sales, _) => sales.count,
        data: bikeStats,
        seriesColor: charts.ColorUtil.fromDartColor(Colors.teal),
        labelAccessorFn: (datum, i) => bikeStats[i].count.toString(),
        displayName: 'Bike',
      ),
    ];
  }
}
