// ignore_for_file: sized_box_for_whitespace

import 'package:doce_pasos/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

import 'homewidget.dart';

class MiPracticaPrograma extends StatelessWidget {
  const MiPracticaPrograma({super.key});

  @override
  Widget build(BuildContext context) {
    return const PracticaPrograma();
  }
}

class PracticaPrograma extends StatefulWidget {
  const PracticaPrograma({super.key});
  @override
  State<PracticaPrograma> createState() => _PracticaProgramaState();
}

class _PracticaProgramaState extends State<PracticaPrograma>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  late TabController _tabController;

  @override
  void initState() {
    if (_saveddatebox.get("SAVEDDATE") == null) {
      dbsaveddate.createInitialsaveddate();
    } else {
      dbsaveddate.loadsaveddate();
    }
    if (_paso10box.get("PASO10") == null) {
      dbpaso10.createInitialpaso10();
    } else if (DateTime.now().day != dbsaveddate.saveddate[0]) {
      dbpaso10.loadpaso10();
      setState(() {
        dbpaso10.paso10[0][2] = false;
        dbpaso10.paso10[1][2] = false;
        dbpaso10.paso10[2][2] = false;
      });
      dbpaso10.updatepaso10();
    } else {
      dbpaso10.loadpaso10();
    }
    if (_paso11box.get("PASO11") == null) {
      dbpaso11.createInitialpaso11();
    } else if (DateTime.now().day != dbsaveddate.saveddate[0]) {
      dbpaso11.loadpaso11();
      setState(() {
        dbpaso11.paso11[0][2] = false;
        dbpaso11.paso11[1][2] = false;
        dbpaso11.paso11[2][2] = false;
        dbpaso11.paso11[3][2] = false;
        dbpaso11.paso11[4][2] = false;
        dbpaso11.paso11[5][2] = false;
        dbpaso11.paso11[6][2] = false;
        dbpaso11.paso11[7][2] = false;
        dbpaso11.paso11[8][2] = false;
        dbpaso11.paso11[9][2] = false;
        dbpaso11.paso11[10][2] = false;
        dbpaso11.paso11[11][2] = false;
        dbpaso11.paso11[12][2] = false;
      });
      dbpaso11.updatepaso11();
    } else {
      dbpaso11.loadpaso11();
    }
    if (_silenciobox.get("SILENCIO") == null) {
      dbsilencio.createInitialsilencio();
    } else if (DateTime.now().day != dbsaveddate.saveddate[0]) {
      dbsilencio.loadsilencio();
      setState(() {
        dbsilencio.silencio[0][2] = false;
        dbsilencio.silencio[1][2] = false;
        dbsilencio.silencio[2][2] = false;
        dbsilencio.silencio[3][2] = false;
      });
      dbsilencio.updatesilencio();
    } else {
      dbsilencio.loadsilencio();
    }
    if (_paso12box.get("PASO12") == null) {
      dbpaso12.createInitialpaso12();
    } else if (DateTime.now().day != dbsaveddate.saveddate[0]) {
      dbpaso12.loadpaso12();
      setState(() {
        dbpaso12.paso12[0][2] = false;
        dbpaso12.paso12[1][2] = false;
        dbpaso12.paso12[2][2] = false;
        dbpaso12.paso12[3][2] = false;
        dbpaso12.paso12[4][2] = false;
        dbpaso12.paso12[5][2] = false;
        dbpaso12.paso12[6][2] = false;
        dbpaso12.paso12[7][2] = false;
        dbpaso12.paso12[8][2] = false;
      });
      dbpaso12.updatepaso12();
    } else {
      dbpaso12.loadpaso12();
    }
    super.initState();

    _nestedTabController = TabController(length: 3, vsync: this);
    _tabController = TabController(length: 2, vsync: this);
  }

  final _saveddatebox = Hive.box('saveddatebox');
  SavedDateDataBase dbsaveddate = SavedDateDataBase();

  final _paso10box = Hive.box('paso10box');
  Paso10DataBase dbpaso10 = Paso10DataBase();

  final _paso11box = Hive.box('paso11box');
  Paso11DataBase dbpaso11 = Paso11DataBase();

  final _silenciobox = Hive.box('silenciobox');
  SilencioDataBase dbsilencio = SilencioDataBase();

  final _paso12box = Hive.box('paso12box');
  Paso12DataBase dbpaso12 = Paso12DataBase();

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
    _tabController.dispose();
  }

  void _saveddate() {
    setState(() {
      dbsaveddate.saveddate[0] = DateTime.now().day;
    });
    dbsaveddate.updatesaveddate();
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
              child: Text('Pasos de Mantenimiento')),
          actions: const <Widget>[MiCasa()],
          bottom: TabBar(
            controller: _nestedTabController,
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            indicatorWeight: 4.0,
            tabs: const <Widget>[
              Tab(
                text: 'PASO 10',
              ),
              Tab(
                text: 'PASO 11',
              ),
              Tab(
                text: 'PASO 12',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _nestedTabController,
          children: <Widget>[
            paso10method(),
            paso11method(),
            paso12method(),
          ],
        ),
      ),
    );
  }

  Column paso10method() {
    return Column(
      children: [
        if (dbpaso10.paso10[0][2] == true &&
            dbpaso10.paso10[1][2] == true &&
            dbpaso10.paso10[2][2] == true)
          Expanded(
            child: SizedBox(
              height: 700,
              child: Lottie.asset(
                'assets/images/animations/prayinghands.json',
              ),
            ),
          ),
        Expanded(
            child: SizedBox(
          height: double.infinity,
          child: Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 2.7 / 2),
                itemCount: dbpaso10.paso10.length,
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
                          Text(dbpaso10.paso10[index][0],
                              style: const TextStyle(fontSize: 19.0),
                              textAlign: TextAlign.center),
                          const SizedBox(
                            height: 3,
                          ),
                          Image.asset(
                            'assets/images/iconos/paso_10/${dbpaso10.paso10[index][1]}',
                            scale: 4,
                          ),
                          Transform.scale(
                            scale: 2,
                            child: Checkbox(
                              value: dbpaso10.paso10[index][2],
                              onChanged: (bool? value) {
                                // This is where we update the state when the checkbox is tapped
                                setState(() {
                                  _saveddate();
                                  dbpaso10.paso10[index][2] = value!;
                                });
                                dbpaso10.updatepaso10();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ))
      ],
    );
  }

  paso11method() {
    return Column(children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 40, 73, 221)),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: const Color.fromARGB(255, 188, 39, 207),
            borderRadius: BorderRadius.circular(20),
          ),
          labelColor: Colors.white70,
          dividerColor: Colors.white70,
          // ignore: prefer_const_literals_to_create_immutables
          tabs: const <Widget>[
            Tab(
              text: 'SILENCIO',
            ),
            Tab(
              text: 'ORACION',
            ),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 2.7 / 2),
                  itemCount: dbsilencio.silencio.length,
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
                            Text(dbsilencio.silencio[index][0],
                                style: const TextStyle(fontSize: 19.0),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 3,
                            ),
                            Image.asset(
                              'assets/images/iconos/silencio/${dbsilencio.silencio[index][1]}',
                              scale: 4,
                            ),
                            Transform.scale(
                              scale: 2,
                              child: Checkbox(
                                value: dbsilencio.silencio[index][2],
                                onChanged: (bool? value) {
                                  // This is where we update the state when the checkbox is tapped
                                  setState(() {
                                    _saveddate();
                                    dbsilencio.silencio[index][2] = value!;
                                  });
                                  dbsilencio.updatesilencio();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Center(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 2.7 / 2),
                  itemCount: dbpaso11.paso11.length,
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
                            Text(dbpaso11.paso11[index][0],
                                style: const TextStyle(fontSize: 19.0),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Image.asset(
                              'assets/images/iconos/paso_11/${dbpaso11.paso11[index][1]}',
                              scale: 4,
                            ),
                            Transform.scale(
                              scale: 2,
                              child: Checkbox(
                                value: dbpaso11.paso11[index][2],
                                onChanged: (bool? value) {
                                  // This is where we update the state when the checkbox is tapped
                                  setState(() {
                                    _saveddate();
                                    dbpaso11.paso11[index][2] = value!;
                                  });
                                  dbpaso11.updatepaso11();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )
    ]);
  }

  paso12method() {
    return Center(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 2.7 / 2),
          itemCount: dbpaso12.paso12.length,
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
                    Text(dbpaso12.paso12[index][0],
                        style: const TextStyle(fontSize: 19.0),
                        textAlign: TextAlign.center),
                    Image.asset(
                      'assets/images/iconos/paso_12/${dbpaso12.paso12[index][1]}',
                      scale: 4,
                    ),
                    Transform.scale(
                      scale: 2,
                      child: Checkbox(
                        value: dbpaso12.paso12[index][2],
                        onChanged: (bool? value) {
                          // This is where we update the state when the checkbox is tapped
                          setState(() {
                            _saveddate();
                            dbpaso12.paso12[index][2] = value!;
                          });
                          dbpaso12.updatepaso12();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
