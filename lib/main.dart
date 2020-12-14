import 'package:chart_demo/traffic_chart_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chart'),
        ),
        body: FutureBuilder<Response>(
          future: getHttp(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TrafficChartPage(
                response: snapshot.data,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Future<Response> getHttp() async {
    try {
      Response response =
          await Dio().get('https://eflask-app-api.herokuapp.com/');
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 404, data: e.toString());
    }
  }
}
