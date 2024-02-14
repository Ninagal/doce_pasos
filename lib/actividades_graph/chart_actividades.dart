// ignore_for_file: avoid_print

import 'package:doce_pasos/actividades_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartActividades extends StatelessWidget {
  final List actividadessuma; //suma de actividades
  const BarChartActividades({
    super.key,
    required this.actividadessuma,
  });

  @override
  Widget build(BuildContext context) {
    //* initiliaze bar data
    BarDataActividades misactividades = BarDataActividades(
      tribunasuma: actividadessuma[0],
      literaturasuma: actividadessuma[1],
      padrinosuma: actividadessuma[2],
      septimosuma: actividadessuma[3],
      serviciossuma: actividadessuma[4],
      doceavosuma: actividadessuma[5],
      testimoniosuma: actividadessuma[6],
    );

    misactividades.initializeBarDataActividades();

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
        barGroups: misactividades.barDataActividades
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: const Color.fromARGB(255, 40, 73, 221),
                      width: 20,
                      borderRadius: BorderRadius.circular(2),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 50,
                          color: const Color.fromARGB(255, 221, 208, 183)))
                ]))
            .toList()));
    //BarChart(BarChartData(maxY: 50, minY: 0)),
  }
}

Widget getBottomTitle(double value, TitleMeta meta) {
  const style = TextStyle(color: Colors.black87, fontSize: 15);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'tribuna',
            style: style,
            softWrap: false,
          ));
      break;
    case 1:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('literatura', style: style, softWrap: false));
      break;
    case 2:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('apadrinar', style: style, softWrap: false));
      break;
    case 3:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('séptima', style: style, softWrap: false));
      break;
    case 4:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('servicios', style: style, softWrap: false));
      break;
    case 5:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('doceavo', style: style, softWrap: false));
      break;
    case 6:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'testimonio',
            style: style,
            softWrap: false,
          ));
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
