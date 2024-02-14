// ignore_for_file: avoid_print

import 'package:doce_pasos/banco_graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartBancoVirtudes extends StatelessWidget {
  final List virtudessuma; //suma de virtudes
  //final List defectossuma; // suma de defectos
  const BarChartBancoVirtudes({
    super.key,
    required this.virtudessuma,
  });

  @override
  Widget build(BuildContext context) {
    //* initiliaze bar data
    BarDataVirtudes misvirtudes = BarDataVirtudes(
      caridadsuma: virtudessuma[0],
      castidadsuma: virtudessuma[1],
      diligenciasuma: virtudessuma[2],
      generosidadsuma: virtudessuma[3],
      humildadsuma: virtudessuma[4],
      pacienciasuma: virtudessuma[5],
      templanzasuma: virtudessuma[6],
    );
    /*BarDataDefectos misdefectos = BarDataDefectos(
      avariciasuma: defectossuma[0],
      envidiasuma: defectossuma[1],
      gulasuma: defectossuma[2],
      irasuma: defectossuma[3],
      lujuriasuma: defectossuma[4],
      perezasuma: defectossuma[5],
      soberbiasuma: defectossuma[6],
    );*/

    misvirtudes.initializeBarDataVirtudes();
    //misdefectos.initializeBarDataDefectos();

    // ignore: duplicate_ignore
    /*void showConsoleUsingPrint() {
      print(misvirtudes.barDataVirtudes.map((virtud) => virtud.y).toList());
      // ignore: non_constant_identifier_names
    }*/

    return
        //FloatingActionButton(onPressed: () => showConsoleUsingPrint())

        BarChart(BarChartData(
            titlesData: FlTitlesData(
                show: true,
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
            barGroups: misvirtudes.barDataVirtudes
                .map((data) => BarChartGroupData(x: data.x, barRods: [
                      BarChartRodData(
                          toY: data.y,
                          color: const Color.fromARGB(255, 188, 39, 207),
                          width: 15,
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
  const style = TextStyle(color: Colors.black87, fontSize: 11);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('humildad', style: style, softWrap: false));
      break;
    case 1:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('castidad', style: style, softWrap: false));
      break;
    case 2:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('generosidad', style: style, softWrap: false));
      break;
    case 3:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('caridad', style: style, softWrap: false));
      break;
    case 4:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('diligencia', style: style, softWrap: false));
      break;
    case 5:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('templanza', style: style, softWrap: false));
      break;
    case 6:
      text = const RotatedBox(
          quarterTurns: 1,
          child: Text('tolerancia', style: style, softWrap: false));
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
