// ignore_for_file: avoid_print, duplicate_ignore

import "package:doce_pasos/data/database.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";

import 'chart_actividades.dart';

class ActividadesChart extends StatelessWidget {
  const ActividadesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const BarActividades();
  }
}

class BarActividades extends StatefulWidget {
  const BarActividades({super.key});

  @override
  State<BarActividades> createState() => _BarActividadesState();
}

class _BarActividadesState extends State<BarActividades> {
  @override
  void initState() {
    if (_actividadesbox.get("ACTIVIDADES") == null) {
      dbactividades.createInitialactividades();
    } else {
      dbactividades.loadactividades();
    }

    super.initState();
  }

  final _actividadesbox = Hive.box('actividadesbox');
  ActividadesDataBase dbactividades = ActividadesDataBase();

  late List<double> actividadessuma = lista(dbactividades.actividades);

  //* largo de la lista de defectos o actividades
  var largodedata = [0, 1, 2, 3, 4, 5, 6];

  List<double> lista(List listasum) {
    List<double> listasuma = [];

    for (int i in largodedata) {
      listasuma.add(listasum[i][2].toDouble());
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
                height: 450,
                child: BarChartActividades(
                  actividadessuma: actividadessuma,
                )),
          ]),
    );
  }
}
