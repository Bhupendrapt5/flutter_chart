import 'package:chart_demo/model/dataValueSet.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DailyModel {
  final List<int> mon;
  final List<int> tue;
  final List<int> wed;
  final List<int> thu;
  final List<int> fri;
  final List<int> sat;
  final List<int> sun;

  DailyModel({
    this.mon,
    this.tue,
    this.wed,
    this.thu,
    this.fri,
    this.sat,
    this.sun,
  });

  factory DailyModel.fromArray(Map<String, dynamic> traficData) {
    return DailyModel(
      mon: List<int>.from(traficData['Mon']),
      tue: List<int>.from(traficData['Tue']),
      wed: List<int>.from(traficData['Wed']),
      thu: List<int>.from(traficData['Thu']),
      fri: List<int>.from(traficData['Fri']),
      sat: List<int>.from(traficData['Sat']),
      sun: List<int>.from(traficData['Sun']),
    );
  }

  List<charts.Series<DataValueSet, String>> dailySeries() {
    final busStats = [
      DataValueSet('Mon', this.mon[2]),
      DataValueSet('Tue', this.tue[2]),
      DataValueSet('Wed', this.wed[2]),
      DataValueSet('Thu', this.thu[2]),
      DataValueSet('Fri', this.fri[2]),
      DataValueSet('Sat', this.sat[2]),
      DataValueSet('Sun', this.sun[2]),
    ];
    final carStats = [
      DataValueSet('Mon', this.mon[1]),
      DataValueSet('Tue', this.tue[1]),
      DataValueSet('Wed', this.wed[1]),
      DataValueSet('Thu', this.thu[1]),
      DataValueSet('Fri', this.fri[1]),
      DataValueSet('Sat', this.sat[1]),
      DataValueSet('Sun', this.sun[1]),
    ];
    final bikeStats = [
      DataValueSet('Mon', this.mon[0]),
      DataValueSet('Tue', this.tue[0]),
      DataValueSet('Wed', this.wed[0]),
      DataValueSet('Thu', this.thu[0]),
      DataValueSet('Fri', this.fri[0]),
      DataValueSet('Sat', this.sat[0]),
      DataValueSet('Sun', this.sun[0]),
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
