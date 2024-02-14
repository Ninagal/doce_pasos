// ignore_for_file: avoid_print, duplicate_ignore

import "package:doce_pasos/banco_graph/chart_banco_defectos.dart";
import "package:doce_pasos/data/database.dart";
import "package:flutter/material.dart";
import "package:hive/hive.dart";

import 'chart_banco_virtudes.dart';

class BancoChart extends StatelessWidget {
  const BancoChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const BarBanco();
  }
}

class BarBanco extends StatefulWidget {
  const BarBanco({super.key});

  @override
  State<BarBanco> createState() => _BarBancoState();
}

class _BarBancoState extends State<BarBanco> {
  @override
  void initState() {
    if (_virtudesbox.get("VIRTUDES") == null) {
      dbvirtudes.createInitialvirtudes();
    } else {
      dbvirtudes.loadvirtudes();
    }
    if (_defectosbox.get("DEFECTOS") == null) {
      dbdefectos.createInitialdefectos();
    } else {
      dbdefectos.loaddefectos();
    }
    super.initState();
  }

  final _virtudesbox = Hive.box('virtudesbox');
  VirtudesDataBase dbvirtudes = VirtudesDataBase();
  final _defectosbox = Hive.box('defectosbox');
  DefectosDataBase dbdefectos = DefectosDataBase();

  late List<double> virtudessuma = lista(dbvirtudes.virtudes);
  late List<double> defectossuma = lista(dbdefectos.defectos);

  //* largo de la lista de defectos o virtudes
  var largodedata = [0, 1, 2, 3, 4, 5, 6];

  List<double> lista(List listasum) {
    List<double> listasuma = [];
    //final List<double> defectossuma = [];
    for (int i in largodedata) {
      listasuma.add(listasum[i][2].toDouble());
      //defectossuma.add(dbdefectos.defectos[i][2].toDouble());
    }
    return listasuma;
  }

  //* funcion para imprimir en consola
  // ignore: duplicate_ignore, duplicate_ignore
  /*void showConsoleUsingPrint() {
    // ignore: avoid_print, non_constant_identifier_names
    print(virtudessuma);
  }*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          //* boton para imprimir en consola
          //child: FloatingActionButton(onPressed: () => showConsoleUsingPrint())
          children: [
            const SizedBox(
              height: 2.0,
            ),
            const Text(
              'VIRTUDES',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 2.0,
            ),
            SizedBox(
                height: 300,
                child: BarChartBancoVirtudes(
                  virtudessuma: virtudessuma,
                )),
            const SizedBox(
              height: 2.0,
            ),
            const Text(
              'DEFECTOS',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 2.0,
            ),
            SizedBox(
                height: 300,
                child: BarChartBancoDefectos(
                  defectossuma: defectossuma,
                )),
          ]),
    );
  }
}
