// ignore_for_file: sized_box_for_whitespace

import 'package:doce_pasos/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'homewidget.dart';

class MiSobriometro extends StatelessWidget {
  const MiSobriometro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Sobriometro();
  }
}

class Sobriometro extends StatefulWidget {
  const Sobriometro({super.key});
  @override
  State<Sobriometro> createState() => _SobriometroState();
}

class _SobriometroState extends State<Sobriometro> {
  @override
  void initState() {
    if (_sobriometrobox.get("SOBRIOMETRO") == null) {
      dbsobriometro.createInitialsobriometro();
    } else {
      dbsobriometro.loadsobriometro();
    }
    super.initState();
  }

  final _sobriometrobox = Hive.box('sobriometrobox');
  SobriometroDataBase dbsobriometro = SobriometroDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //* linea abajo de titulo
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: Container(
                height: 5.0,
                color: Colors.black87,
              )),
          title: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                'Sobriometro',
              )),
          actions: const <Widget>[MiCasa()],
        ),
        body: Center(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2.3 / 2),
              itemCount: dbsobriometro.sobriometro.length,
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
                        Text(dbsobriometro.sobriometro[index][0],
                            style: const TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 3,
                        ),
                        Image.asset(
                          'assets/images/iconos/sobriometro/${dbsobriometro.sobriometro[index][1]}',
                          scale: 4,
                        ),
                        slidermethod(index),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  Column slidermethod(index) {
    var value = dbsobriometro.sobriometro[index][2].toDouble();
    return Column(
      children: [
        if (value <= 4)
          Slider(
              activeColor: Colors.green,
              value: value,
              min: 0,
              max: 10,
              divisions: 10,
              label: value.round().toString(),
              onChanged: (value) => [
                    setState(
                      () => dbsobriometro.sobriometro[index][2] = value,
                    ),
                    dbsobriometro.updatesobriometro()
                  ])
        else if (value > 4 && value < 8)
          Slider(
              activeColor: const Color.fromARGB(255, 241, 161, 12),
              value: value,
              min: 0,
              max: 10,
              divisions: 10,
              label: value.round().toString(),
              onChanged: (value) => [
                    setState(
                      () => dbsobriometro.sobriometro[index][2] = value,
                    ),
                    dbsobriometro.updatesobriometro()
                  ])
        else
          (Column(
            children: [
              Slider(
                  activeColor: Colors.red,
                  value: value,
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: value.round().toString(),
                  onChanged: (value) => [
                        setState(
                          () => dbsobriometro.sobriometro[index][2] = value,
                        ),
                        dbsobriometro.updatesobriometro()
                      ]),
              Container(
                color: Colors.red,
                child: const Text(
                  'Estás llegando al Límite.\n Habla con tu Padrino',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ))
      ],
    );
  }
}
