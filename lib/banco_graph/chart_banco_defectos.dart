// ignore_for_file: avoid_print

import 'package:doce_pasos/banco_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartBancoDefectos extends StatelessWidget {
  final List defectossuma; //suma de virtudes
  //final List defectossuma; // suma de defectos
  const BarChartBancoDefectos({
    super.key,
    required this.defectossuma,
  });

  @override
  Widget build(BuildContext context) {
    //* initiliaze bar data

    BarDataDefectos misdefectos = BarDataDefectos(
      avariciasuma: defectossuma[0],
      envidiasuma: defectossuma[1],
      gulasuma: defectossuma[2],
      irasuma: defectossuma[3],
      lujuriasuma: defectossuma[4],
      perezasuma: defectossuma[5],
      soberbiasuma: defectossuma[6],
    );

    misdefectos.initializeBarDataDefectos();

    // ignore: duplicate_ignore
    /*void showConsoleUsingPrint() {
      print(misvirtudes.barDataVirtudes.map((virtud) => virtud.y).toList());
      // ignore: non_constant_identifier_names
    }*/

    return BarChart(BarChartData(
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  reservedSize: 90,
                  showTitles: true,
                  getTitlesWidget: getBottomTitle),
            )),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        maxY: 50,
        minY: 0,
        barGroups: misdefectos.barDataDefectos
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: const Color.fromARGB(255, 40, 73, 221),
                      width: 15,
                      borderRadius: BorderRadius.circular(2),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 50,
                          color: const Color.fromARGB(255, 221, 208, 183)))
                ]))
            .toList()));
  }
}

Widget getBottomTitle(double value, TitleMeta meta) {
  const style = TextStyle(color: Colors.black87, fontSize: 11);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('orgullo', style: style, softWrap: false));
      break;
    case 1:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('lujuria', style: style, softWrap: false));
      break;
    case 2:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('avaricia', style: style, softWrap: false));
      break;
    case 3:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('envidia', style: style, softWrap: false));
      break;
    case 4:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('pereza', style: style, softWrap: false));
      break;
    case 5:
      text = const RotatedBox(
          quarterTurns: 1, child: Text('gula', style: style, softWrap: false));
      break;
    case 6:
      text = const RotatedBox(
          quarterTurns: 1, child: Text('ira', style: style, softWrap: false));
      break;
    default:
      text = const RotatedBox(
        quarterTurns: 1,
        child: Text('', style: style, softWrap: false),
      );
  }
  Widget;
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
