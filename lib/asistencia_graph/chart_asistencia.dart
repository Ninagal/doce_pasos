// ignore_for_file: avoid_print

import 'package:doce_pasos/asistencia_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartAsistencia extends StatelessWidget {
  final List asistenciasuma; //suma de asistencia
  const BarChartAsistencia({
    super.key,
    required this.asistenciasuma,
  });

  @override
  Widget build(BuildContext context) {
    //* initiliaze bar data
    BarDataAsistencia misasistencia = BarDataAsistencia(
      enerosuma: asistenciasuma[0],
      febrerosuma: asistenciasuma[1],
      marzosuma: asistenciasuma[2],
      abrilsuma: asistenciasuma[3],
      mayosuma: asistenciasuma[4],
      juniosuma: asistenciasuma[5],
      juliosuma: asistenciasuma[6],
      agostosuma: asistenciasuma[7],
      septiembresuma: asistenciasuma[8],
      octubresuma: asistenciasuma[9],
      noviembresuma: asistenciasuma[10],
      diciembresuma: asistenciasuma[11],
    );

    misasistencia.initializeBarDataAsistencia();

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
        maxY: 30,
        minY: 0,
        barGroups: misasistencia.barDataAsistencia
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: const Color.fromARGB(255, 40, 73, 221),
                      width: 12,
                      borderRadius: BorderRadius.circular(2),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 30,
                          color: const Color.fromARGB(255, 221, 208, 183)))
                ]))
            .toList()));
  }
}

Widget getBottomTitle(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black87,
    fontSize: 12,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Enero',
            style: style,
            softWrap: false,
          ));
      break;
    case 1:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Febrero',
            style: style,
            softWrap: false,
          ));
      break;
    case 2:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Marzo',
            style: style,
            softWrap: false,
          ));
      break;
    case 3:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Abril',
            style: style,
            softWrap: false,
          ));
      break;
    case 4:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Mayo',
            style: style,
            softWrap: false,
          ));
      break;
    case 5:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Junio',
            style: style,
            softWrap: false,
          ));
      break;
    case 6:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Julio',
            style: style,
            softWrap: false,
          ));
      break;
    case 7:
      text = const RotatedBox(
          quarterTurns: 1, child: Text('Agosto', style: style));
      break;
    case 8:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Septiembre',
            style: style,
            softWrap: false,
          ));
      break;
    case 9:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Octubre',
            style: style,
            softWrap: false,
          ));
      break;
    case 10:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Noviembre',
            style: style,
            softWrap: false,
          ));
      break;
    case 11:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text(
            'Diciembre',
            style: style,
            softWrap: false,
          ));
      break;

    default:
      text = const RotatedBox(
        quarterTurns: 1,
        child: Text(
          '',
          style: style,
          softWrap: false,
        ),
      );
  }
  Widget;
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
