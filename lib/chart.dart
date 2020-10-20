import 'package:Chart/model/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatelessWidget {
  List<ChartData> present = [
    ChartData(month: "Jan", day: 10),
    ChartData(month: "Feb", day: 20),
    ChartData(month: "Mar", day: 30),
    ChartData(month: "April", day: 56),
    ChartData(month: "May", day: 89),
    ChartData(month: "June", day: 20),
    ChartData(month: "July", day: 39),
    ChartData(month: "Aug", day: 59),
    ChartData(month: "Sept", day: 79),
    ChartData(month: "Oct", day: 39),
    ChartData(month: "Nov", day: 19),
    ChartData(month: "Dec", day: 49),
  ];

  List<ChartData> absent = [
    ChartData(month: "Jan", day: 15),
    ChartData(month: "Feb", day: 25),
    ChartData(month: "Mar", day: 34),
    ChartData(month: "April", day: 62),
    ChartData(month: "May", day: 90),
    ChartData(month: "June", day: 29),
    ChartData(month: "July", day: 49),
    ChartData(month: "Aug", day: 19),
    ChartData(month: "Sept", day: 72),
    ChartData(month: "Oct", day: 59),
    ChartData(month: "Nov", day: 49),
    ChartData(month: "Dec", day: 39),
  ];

  List<ChartData> holiday = [
    ChartData(month: "Jan", day: 20),
    ChartData(month: "Feb", day: 30),
    ChartData(month: "Mar", day: 40),
    ChartData(month: "April", day: 45),
    ChartData(month: "May", day: 95),
    ChartData(month: "June", day: 99),
    ChartData(month: "July", day: 19),
    ChartData(month: "Aug", day: 109),
    ChartData(month: "Sept", day: 100),
    ChartData(month: "Oct", day: 34),
    ChartData(month: "Nov", day: 43),
    ChartData(month: "Dec", day: 82),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
          id: "Holiday",
          data: holiday,
          domainFn: (ChartData cm, _) => cm.month,
          measureFn: (ChartData cm, _) => cm.day,
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.grey),
          fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.grey)),
      charts.Series(
          id: "Abesent",
          data: absent,
          domainFn: (ChartData cm, _) => cm.month,
          measureFn: (ChartData cm, _) => cm.day,
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
          fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red)),
      charts.Series(
          id: "Present",
          data: present,
          domainFn: (ChartData cm, _) => cm.month,
          measureFn: (ChartData cm, _) => cm.day,
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.black),
          fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.black)),
    ];

    return Container(
        margin: EdgeInsets.only(top: 20.0),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: charts.BarChart(
            series,
            animate: true,
            defaultRenderer: new charts.BarRendererConfig(
              groupingType: charts.BarGroupingType.stacked,
              strokeWidthPx: 2.0,
            ),
            behaviors: [
              new charts.SeriesLegend(
                position: charts.BehaviorPosition.end,
                horizontalFirst: false,
                cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                showMeasures: true,
                measureFormatter: (num value) {
                  return value == null ? '-' : '${value}k';
                },
              ),
            ],
          ),
        ));
  }
}
