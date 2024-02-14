import 'package:doce_pasos/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MiIconosInicio extends StatelessWidget {
  const MiIconosInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconosInicio();
  }
}

class IconosInicio extends StatefulWidget {
  const IconosInicio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IconosInicioState createState() => _IconosInicioState();
}

class _IconosInicioState extends State<IconosInicio> {
  //* state y controller para traer el nombre al main page del dialogbox
  late TextEditingController? controller;

  String _name = '';

  @override
  void initState() {
    _loadname();
    super.initState();
    controller = TextEditingController();
  }

  Future<void> _loadname() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = (prefs.getString('nombre') ?? 'Coloca tu Nombre');
    });
  }

  Future<void> _abrirDialogo() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _name = await openDialog();
    final prefs = await SharedPreferences.getInstance();
    if (_name == null || _name.isEmpty) return;
    setState(() => prefs.setString('nombre', _name));
  }

  @override
  Widget build(BuildContext context) {
    //* Vista en Homepage de logo y nombre
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          'assets/images/12_pasos.png',
          scale: 6,
        ),
        Expanded(
            child: TextButton(
                onPressed: _abrirDialogo,
                child: Text(
                  textAlign: TextAlign.center,
                  softWrap: true,
                  _name,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 211, 228, 208),
                    fontSize: 20.00,
                  ),
                )))
      ],
    );
  }

  //* Dialogo que se abre para llenar la informacion para cambiar el nombre
  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => Dialog(
          alignment: Alignment.topCenter,
          backgroundColor: const Color.fromARGB(255, 236, 232, 164),
          shadowColor: Colors.black38,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 161, 12),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          spreadRadius: -1.0,
                          blurRadius: 7.0,
                        )
                      ]),
                  child: Column(
                    children: [
                      const Text(
                        'Ingresa tu Nombre',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          maxLength: 18,
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                          controller: controller,
                          autofocus: true,
                          decoration: const InputDecoration(
                              hintText: 'Escribe tu Nombre',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)))),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black, elevation: 20),
                    onPressed: cambiar,
                    child: const Text('Cerrar',
                        style: TextStyle(fontSize: 15.0, color: Colors.black))),
              ],
            ),
          ))));

  void cambiar() {
    Navigator.of(context).pop(controller?.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    //Navigator.of(context).pop();
  }
}
