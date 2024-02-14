import 'package:doce_pasos/banco_graph/individual_bar.dart';

class BarDataVirtudes {
  final double caridadsuma;
  final double castidadsuma;
  final double diligenciasuma;
  final double generosidadsuma;
  final double humildadsuma;
  final double pacienciasuma;
  final double templanzasuma;

  BarDataVirtudes({
    required this.caridadsuma,
    required this.castidadsuma,
    required this.diligenciasuma,
    required this.generosidadsuma,
    required this.humildadsuma,
    required this.pacienciasuma,
    required this.templanzasuma,
  });

  List<IndividualBarVirtudes> barDataVirtudes = [];

  void initializeBarDataVirtudes() {
    barDataVirtudes = [
      IndividualBarVirtudes(x: 0, y: caridadsuma),
      IndividualBarVirtudes(x: 1, y: castidadsuma),
      IndividualBarVirtudes(x: 2, y: diligenciasuma),
      IndividualBarVirtudes(x: 3, y: generosidadsuma),
      IndividualBarVirtudes(x: 4, y: humildadsuma),
      IndividualBarVirtudes(x: 5, y: pacienciasuma),
      IndividualBarVirtudes(x: 6, y: templanzasuma),
    ];
  }
}

class BarDataDefectos {
  final double avariciasuma;
  final double envidiasuma;
  final double gulasuma;
  final double irasuma;
  final double lujuriasuma;
  final double perezasuma;
  final double soberbiasuma;

  BarDataDefectos({
    required this.avariciasuma,
    required this.envidiasuma,
    required this.gulasuma,
    required this.irasuma,
    required this.lujuriasuma,
    required this.perezasuma,
    required this.soberbiasuma,
  });
  List<IndividualBarDefectos> barDataDefectos = [];

  void initializeBarDataDefectos() {
    barDataDefectos = [
      IndividualBarDefectos(x: 0, y: avariciasuma),
      IndividualBarDefectos(x: 1, y: envidiasuma),
      IndividualBarDefectos(x: 2, y: gulasuma),
      IndividualBarDefectos(x: 3, y: irasuma),
      IndividualBarDefectos(x: 4, y: lujuriasuma),
      IndividualBarDefectos(x: 5, y: perezasuma),
      IndividualBarDefectos(x: 6, y: soberbiasuma),
    ];
  }
}
