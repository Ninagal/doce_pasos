// ignore_for_file: sized_box_for_whitespace
import 'package:doce_pasos/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../banco_graph/bar_banco.dart';
import 'homewidget.dart';

class MiBancoEspiritual extends StatelessWidget {
  const MiBancoEspiritual({super.key});

  @override
  Widget build(BuildContext context) {
    return const BancoEspiritual();
  }
}

class BancoEspiritual extends StatefulWidget {
  const BancoEspiritual({super.key});
  @override
  State<BancoEspiritual> createState() => _BancoEspiritualState();
}

class _BancoEspiritualState extends State<BancoEspiritual> {
  @override
  void initState() {
    if (_savedyearbox.get("SAVEDYEAR") == null) {
      dbsavedyear.createInitialsavedyear();
    } else {
      dbsavedyear.loadsavedyear();
    }
    if (_virtudesbox.get("VIRTUDES") == null) {
      dbvirtudes.createInitialvirtudes();
    } else if (DateTime.now().year != dbsavedyear.savedyear[0]) {
      dbvirtudes.loadvirtudes();
      setState(() {
        dbvirtudes.virtudes[0][2] = 0;
        dbvirtudes.virtudes[1][2] = 0;
        dbvirtudes.virtudes[2][2] = 0;
        dbvirtudes.virtudes[3][2] = 0;
        dbvirtudes.virtudes[4][2] = 0;
        dbvirtudes.virtudes[5][2] = 0;
        dbvirtudes.virtudes[6][2] = 0;
      });
      dbvirtudes.updatevirtudes();
    } else {
      dbvirtudes.loadvirtudes();
    }
    if (_defectosbox.get("DEFECTOS") == null) {
      dbdefectos.createInitialdefectos();
    } else if (DateTime.now().year != dbsavedyear.savedyear[0]) {
      dbdefectos.loaddefectos();
      setState(() {
        dbdefectos.defectos[0][2] = 0;
        dbdefectos.defectos[1][2] = 0;
        dbdefectos.defectos[2][2] = 0;
        dbdefectos.defectos[3][2] = 0;
        dbdefectos.defectos[4][2] = 0;
        dbdefectos.defectos[5][2] = 0;
        dbdefectos.defectos[6][2] = 0;
      });
      dbdefectos.updatedefectos();
    } else {
      dbdefectos.loaddefectos();
    }
    super.initState();
  }

  final _virtudesbox = Hive.box('virtudesbox');
  VirtudesDataBase dbvirtudes = VirtudesDataBase();
  final _defectosbox = Hive.box('defectosbox');
  DefectosDataBase dbdefectos = DefectosDataBase();
  final _savedyearbox = Hive.box('savedyearbox');
  SavedYearDataBase dbsavedyear = SavedYearDataBase();

  //* funcion para incrementar virtudes dentro del dialogo de virtudes
  void _incrementvirtudesCounter(int index) {
    setState(() {
      dbvirtudes.virtudes[index][2]++;
      Navigator.of(context).pop();
    });
    dbvirtudes.updatevirtudes();
  }

  //* funcion para incrementar defectos dentro del dialogo de defectos
  void _incrementDefectosCounter(int index) {
    setState(() {
      dbdefectos.defectos[index][2]++;
      Navigator.of(context).pop();
    });
    dbdefectos.updatedefectos();
  }

  void _savedyear() {
    setState(() {
      dbsavedyear.savedyear[0] = DateTime.now().year;
    });
    dbsavedyear.updatesavedyear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text('Banco Espiritual')),
          actions: const <Widget>[MiCasa()],
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicatorWeight: 4.0,
            tabs: <Widget>[
              Tab(
                text: 'Resumen',
              ),
              Tab(
                text: 'Virtudes',
              ),
              Tab(
                text: 'Defectos',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: TabBarView(
            children: <Widget>[
              //const BancoEspiritualChart(),
              const BancoChart(),
              virtudesmethod(),
              defectosmethod(),
            ],
          ),
        ),
      ),
    );
  }

  //* Pantalla de virtudes
  Center virtudesmethod() {
    return Center(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: .7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: dbvirtudes.virtudes.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: -2.0,
                      blurRadius: 7.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dbvirtudes.virtudes[index][0],
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Image.asset(
                      'assets/images/iconos/virtudes/${dbvirtudes.virtudes[index][1]}',
                      scale: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dbvirtudes.virtudes[index][2]}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            height: 45.0,
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                _savedyear();
                                alertavirtudes(index);
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 241, 161, 12),
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  //* dialogo para sumar virtudes
  Future alertavirtudes(int index) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          alignment: Alignment.topCenter,
          backgroundColor: const Color.fromARGB(255, 236, 232, 164),
          shadowColor: Colors.black38,
          content: Container(
            padding: const EdgeInsets.all(8.0),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirma que vas a Sumar ${dbvirtudes.virtudes[index][0]}',
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 200,
                  child: FloatingActionButton(
                    onPressed: () => _incrementvirtudesCounter(index),
                    backgroundColor: const Color.fromARGB(255, 241, 161, 12),
                    child:
                        const Text('CONFIRMAR', style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          )));

  //* Pantalla de Defectos
  Center defectosmethod() {
    return Center(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: .7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: dbdefectos.defectos.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              height: 300.0,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: -2.0,
                      blurRadius: 7.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dbdefectos.defectos[index][0],
                      style: const TextStyle(fontSize: 15.0),
                    ),
                    Image.asset(
                      'assets/images/iconos/defectos/${dbdefectos.defectos[index][1]}',
                      scale: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dbdefectos.defectos[index][2]}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            height: 45.0,
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                _savedyear();
                                alertadefectos(index);
                              },
                              backgroundColor:
                                  const Color.fromARGB(255, 241, 161, 12),
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  //* dialogo para sumar defectos
  Future alertadefectos(int index) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          alignment: Alignment.topCenter,
          backgroundColor: const Color.fromARGB(255, 236, 232, 164),
          shadowColor: Colors.black38,
          content: Container(
            padding: const EdgeInsets.all(8.0),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirma que vas a Sumar ${dbdefectos.defectos[index][0]}',
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 200,
                  child: FloatingActionButton(
                    onPressed: () => _incrementDefectosCounter(index),
                    backgroundColor: const Color.fromARGB(255, 241, 161, 12),
                    child:
                        const Text('CONFIRMAR', style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          )));
}
