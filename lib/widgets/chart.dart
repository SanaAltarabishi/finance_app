import 'package:finance_app/data/model/add_data.dart';
import 'package:finance_app/data/utilty.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final int index;
  const Chart({super.key, required this.index});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<AddData>? a;
  bool b = true;
  bool j = true;

  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();
        j = false;
        break;
    }
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              ...List.generate(time(a!, b ? true : false).length, (index) {
                if (index < a!.length && index < time(a!, false).length) {
                  // Skip or return a default value if the index is out of bounds

                  return SalesData(
                      j
                          ? b
                              ? a![index].dateTime.hour.toString()
                              : a![index].dateTime.day.toString()
                          : a![index].dateTime.month.toString(),
                      b
                          ? index > 0
                              ? time(a!, false)[index] +
                                  time(a!, false)[index - 1]
                              : time(a!, false)[index]
                          : index > 0
                              ? time(a!, false)[index] +
                                  time(a!, false)[index - 1]
                              : time(a!, false)[index]);
                } else {
                  return SalesData("Invalid", 0);
                }
              }),
              // SalesData(100, 'mon'),
              // SalesData(20, 'Tue'),
              // SalesData(40, 'wen'),
              // SalesData(15, 'Sat'),
              // SalesData(5, 'Sun'),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
