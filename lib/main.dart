import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';

void main() async {
  //* init hive
  await Hive.initFlutter();

  //* open box
  var defectosbox = await Hive.openBox('defectosbox');
  var virtudesbox = await Hive.openBox('virtudesbox');
  var sobriometrobox = await Hive.openBox('sobriometrobox');
  var paso10box = await Hive.openBox('paso10box');
  var paso11box = await Hive.openBox('paso11box');
  var silenciobox = await Hive.openBox('silenciobox');
  var paso12box = await Hive.openBox('paso12box');
  var serviciosbox = await Hive.openBox('serviciosbox');
  var actividadesbox = await Hive.openBox('actividadesbox');
  var emocionesbox = await Hive.openBox('emocionesbox');
  var asistenciabox = await Hive.openBox('asistenciabox');
  var saveddatebox = await Hive.openBox('saveddatebox');
  var savedyearbox = await Hive.openBox('savedyearbox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 101, 148, 47)),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 101, 148, 47),
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 19.00,
                color: Color.fromARGB(255, 211, 228, 208),
                fontWeight: FontWeight.w600),
            iconTheme: IconThemeData(color: Color.fromARGB(255, 211, 228, 208)),
          ),
          tabBarTheme: const TabBarTheme(
            unselectedLabelColor: Color.fromARGB(255, 211, 228, 208),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            labelStyle: TextStyle(fontSize: 16),
            labelColor: Color.fromARGB(255, 241, 161, 12),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color.fromARGB(255, 40, 73, 221),
          ),
          checkboxTheme: const CheckboxThemeData(
            checkColor: MaterialStatePropertyAll(Colors.white),
            fillColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 241, 161, 12)),
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
          fontFamily: 'futura',
          timePickerTheme: const TimePickerThemeData(
              backgroundColor: Color.fromARGB(255, 101, 148, 47),
              elevation: 2.0),
          useMaterial3: true),
      home: const MiHomePage(),
    );
  }
}
