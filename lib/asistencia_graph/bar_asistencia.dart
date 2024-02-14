// ignore_for_file: avoid_print, duplicate_ignore

import "package:doce_pasos/data/database.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";

import 'chart_asistencia.dart';

class AsistenciaChart extends StatelessWidget {
  const AsistenciaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const BarAsistencia();
  }
}

class BarAsistencia extends StatefulWidget {
  const BarAsistencia({super.key});

  @override
  State<BarAsistencia> createState() => _BarAsistenciaState();
}

class _BarAsistenciaState extends State<BarAsistencia> {
  @override
  void initState() {
    if (_asistenciabox.get("ASISTENCIA") == null) {
      dbasistencia.createInitialasistencia();
    } else {
      dbasistencia.loadasistencia();
    }

    super.initState();
  }

  final _asistenciabox = Hive.box('asistenciabox');
  AsistenciaDataBase dbasistencia = AsistenciaDataBase();

  late List<double> asistenciasuma = lista(dbasistencia.asistencia);

  //* largo de la lista de defectos o asistencia
  var largodedata = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  List<double> lista(List listasum) {
    List<double> listasuma = [];

    for (int i in largodedata) {
      listasuma.add(listasum[i][1].toDouble());
    }
    return listasuma;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          //* boton para imprimir en consola
          //child: FloatingActionButton(onPressed: () => showConsoleUsingPrint())
          children: [
            Container(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                height: 400,
                child: BarChartAsistencia(
                  asistenciasuma: asistenciasuma,
                )),
          ]),
    );
  }
}
