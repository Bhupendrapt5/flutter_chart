import 'package:chart_demo/model/daily_model.dart';
import 'package:chart_demo/model/houry_model.dart';
import 'package:chart_demo/stacked_bar_chart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TrafficChartPage extends StatefulWidget {
  final Response response;

  const TrafficChartPage({Key key, this.response}) : super(key: key);
  @override
  _TrafficChartPageState createState() => _TrafficChartPageState();
}

class _TrafficChartPageState extends State<TrafficChartPage> {
  HourlyModel hourlyModel;
  DailyModel dailyModel;
  List<charts.Series> seriesList;
  bool hourly = true;

  @override
  void initState() {
    hourlyModel = HourlyModel.fromMap(widget.response.data[0]['hourly'][0]);
    dailyModel = DailyModel.fromArray(widget.response.data[0]['daily'][0]);
    seriesList = hourlyModel.hourlySeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: StackedBarChart(seriesList)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: hourly ? Colors.blueGrey : Colors.white,
                textColor: hourly ? Colors.white : Colors.blueGrey,
                onPressed: () {
                  setState(() {
                    hourly = true;
                    seriesList = hourlyModel.hourlySeries();
                  });
                },
                child: Text("Hourly"),
              ),
              RaisedButton(
                color: hourly ? Colors.white : Colors.blueGrey,
                textColor: hourly ? Colors.blueGrey : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  setState(() {
                    hourly = false;
                    seriesList = dailyModel.dailySeries();
                  });
                },
                child: Text("Daily"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
