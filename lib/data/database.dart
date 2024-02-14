import 'package:hive/hive.dart';

class SavedDateDataBase {
  List saveddate = [];

  final _saveddatebox = Hive.box('saveddatebox');

  void createInitialsaveddate() {
    saveddate = [
      [0]
    ];
  }

  void loadsaveddate() {
    saveddate = _saveddatebox.get("SAVEDDATE");
  }

  void updatesaveddate() {
    _saveddatebox.put("SAVEDDATE", saveddate);
  }
}

class SavedYearDataBase {
  List savedyear = [];

  final _savedyearbox = Hive.box('savedyearbox');

  void createInitialsavedyear() {
    savedyear = [
      [0]
    ];
  }

  void loadsavedyear() {
    savedyear = _savedyearbox.get("SAVEDYEAR");
  }

  void updatesavedyear() {
    _savedyearbox.put("SAVEDYEAR", savedyear);
  }
}

class DefectosDataBase {
  List defectos = [];

  final _defectosbox = Hive.box('defectosbox');

  void createInitialdefectos() {
    defectos = [
      ['Soberbia', 'soberbia.png', 0],
      ['Lujuria', 'lujuria.png', 0],
      ['Avaricia', 'avaricia.png', 0],
      ['Envidia', 'envidia.png', 0],
      ['Pereza', 'pereza.png', 0],
      ['Gula', 'gula.png', 0],
      ['Ira', 'ira.png', 0],
    ];
  }

  void loaddefectos() {
    defectos = _defectosbox.get("DEFECTOS");
  }

  void updatedefectos() {
    _defectosbox.put("DEFECTOS", defectos);
  }
}

class VirtudesDataBase {
  List virtudes = [];

  final _virtudesbox = Hive.box('virtudesbox');

  void createInitialvirtudes() {
    virtudes = [
      ['Humildad', 'humildad.png', 0],
      ['Castidad', 'castidad.png', 0],
      ['Generosidad', 'generosidad.png', 0],
      ['Caridad', 'caridad.png', 0],
      ['Diligencia', 'diligencia.png', 0],
      ['Templanza', 'templanza.png', 0],
      ['Tolerancia', 'paciencia.png', 0],
    ];
  }

  void loadvirtudes() {
    virtudes = _virtudesbox.get("VIRTUDES");
  }

  void updatevirtudes() {
    _virtudesbox.put("VIRTUDES", virtudes);
  }
}

class EmocionesDataBase {
  List emociones = [];

  final _emocionesbox = Hive.box('emocionesbox');

  void createInitialemociones() {
    emociones = [
      ['Enojada(o)', '1.png', 0],
      ['Desconfiada(o)', '2.png', 0],
      ['Aburrida(o)', '3.png', 0],
      ['Romántica(o)', '4.png', 0],
      ['Triste', '5.png', 0],
      ['No me Defino', '6.png', 0],
      ['Con Frío', '7.png', 0],
      ['Bipolar', '8.png', 0],
      ['Ansiosa(o)', '9.png', 0],
      ['Feliz', '10.png', 0],
      ['Enferma(o)', '11.png', 0],
      ['Miedosa(o)', '12.png', 0],
      ['No me Hablen', '13.png', 0],
      ['Intelectual', '14.png', 0],
      ['Calmada(o)', '15.png', 0],
      ['Simpática(o)', '16.png', 0],
      ['Empática(o)', '17.png', 0],
      ['Divertida(o)', '18.png', 0],
      ['Obsesiva(o) Compulsiva(o)', '19.png', 0],
      ['Asqueda(o)', '20.png', 0],
      ['Culpable', '21.png', 0],
      ['Avergonzada(o)', '22.png', 0],
      ['Sorprendida(o)', '23.png', 0],
      ['Miserable', '24.png', 0],
      ['Mentirosa(o)', '25.png', 0],
      ['Tacaña(o)', '26.png', 0],
      ['Pensamiento Apestoso', '27.png', 0],
      ['Deshonesto', '28.png', 0],
      ['Robar', '29.png', 0],
      ['Resentida(o)', '30.png', 0],
    ];
  }

  void loademociones() {
    emociones = _emocionesbox.get("EMOCIONES");
  }

  void updateemociones() {
    _emocionesbox.put("EMOCIONES", emociones);
  }
}

class SobriometroDataBase {
  List sobriometro = [];

  final _sobriometrobox = Hive.box('sobriometrobox');

  void createInitialsobriometro() {
    sobriometro = [
      ['Instinto Económico', 'instinto_economico.png', 0],
      ['Instinto Sexual', 'instinto_sexual.png', 0],
      ['Instinto Social', 'instinto_social.png', 0],
      ['Inteligencia Emocional', 'inteligencia_emocional.png', 0],
    ];
  }

  void loadsobriometro() {
    sobriometro = _sobriometrobox.get("SOBRIOMETRO");
  }

  void updatesobriometro() {
    _sobriometrobox.put("SOBRIOMETRO", sobriometro);
  }
}

class Paso10DataBase {
  List paso10 = [];

  final _paso10box = Hive.box('paso10box');

  void createInitialpaso10() {
    paso10 = [
      ['Admito mis Faltas', 'admito.png', false],
      ['Perdono lo que me Hicieron', 'perdono.png', false],
      ['Me voy a Dormir Tranquilo/a', 'duermo.png', false],
    ];
  }

  void loadpaso10() {
    paso10 = _paso10box.get("PASO10");
  }

  void updatepaso10() {
    _paso10box.put("PASO10", paso10);
  }
}

class Paso11DataBase {
  List paso11 = [];

  final _paso11box = Hive.box('paso11box');

  void createInitialpaso11() {
    paso11 = [
      ['De Bendición', 'accion.png', false],
      ['Personal', 'personal.png', false],
      ['Petición por los Demás', 'peticion_demas.png', false],
      ['Adoración', 'adoracion.png', false],
      ['Acción de Gracia', 'accion.png', false],
      ['De Petición', 'peticion.png', false],
      ['Holística', 'holistica.png', false],
      ['De Confesión', 'confesion.png', false],
      ['De Súplica', 'suplica.png', false],
      ['De Alabanza', 'alabanza.png', false],
      ['Oración Contemplativa', 'contemplativa.png', false],
      ['Ecuménica', 'ecumenica.png', false],
      ['De Gratitud', 'gratitud.png', false],
    ];
  }

  void loadpaso11() {
    paso11 = _paso11box.get("PASO11");
  }

  void updatepaso11() {
    _paso11box.put("PASO11", paso11);
  }
}

class SilencioDataBase {
  List silencio = [];

  final _silenciobox = Hive.box('silenciobox');

  void createInitialsilencio() {
    silencio = [
      ['Meditación Constructiva', 'constructiva.png', false],
      ['Meditación con Mantra', 'mantra.png', false],
      ['Meditación Atención a la Respiración  ', 'respiracion.png', false],
      ['Solo Estar', 'estar.png', false],
    ];
  }

  void loadsilencio() {
    silencio = _silenciobox.get("SILENCIO");
  }

  void updatesilencio() {
    _silenciobox.put("SILENCIO", silencio);
  }
}

class Paso12DataBase {
  List paso12 = [];

  final _paso12box = Hive.box('paso12box');

  void createInitialpaso12() {
    paso12 = [
      ['Trasmitir el Mensaje ', 'transmitir.png', false],
      ['Llevar Doceavo al Grupo', 'dociavo.png', false],
      ['Sentirte en Armonía', 'armonia.png', false],
      ['El Universo Fluye', 'universo.png', false],
      ['Despertar Espiritual', 'despertar.png', false],
      ['Armonía Conmigo Mismo', 'conmigo.png', false],
      ['Experiencia Extraterrestre', 'alien.png', false],
      ['Sentir el Espíritu Santo', 'santo.png', false],
      ['Experiencia Mística', 'mistica.png', false],
    ];
  }

  void loadpaso12() {
    paso12 = _paso12box.get("PASO12");
  }

  void updatepaso12() {
    _paso12box.put("PASO12", paso12);
  }
}

class ActividadesDataBase {
  List actividades = [];

  final _actividadesbox = Hive.box('actividadesbox');

  void createInitialactividades() {
    actividades = [
      ['Subí a Tribuna ', '1.png', 0],
      ['Leí Literatura de AA', '2.png', 0],
      ['Me apadriné', '3.png', 0],
      ['Di Séptima', '4.png', 0],
      ['Di Servicios', '5.png', 0],
      ['Llevé a un Doceavo', '6.png', 0],
      ['Di Testimonio de Aniversario', '7.png', 0],
    ];
  }

  void loadactividades() {
    actividades = _actividadesbox.get("ACTIVIDADES");
  }

  void updateactividades() {
    _actividadesbox.put("ACTIVIDADES", actividades);
  }
}

class ServiciosDataBase {
  List servicios = [];

  final _serviciosbox = Hive.box('serviciosbox');

  void createInitialservicios() {
    servicios = [
      ['Secretaria(o)', '1.png', false],
      ['Tesorera(o)', '2.png', false],
      ['Despensa', '3.png', false],
      ['Literatura', '4.png', false],
      ['R.S.G', '5.png', false],
      ['Junta de Principiantes', '6.png', false],
      ['Junta de Estudio', '7.png', false],
      ['Pasteles', '8.png', false],
      ['Guardia', '9.png', false],
      ['Boletín', '10.png', false],
      ['Junta de Onceavo Paso', '11.png', false],
      ['R.O.I', '12.png', false],
      ['Junta de Información', '13.png', false],
      ['Pensamiento del Día', '14.png', false],
      ['Facebook', '15.png', false],
      ['Ficha de Contacto', '16.png', false],
      ['Cafetera(o)', '17.png', false],
      ['Junta por Zoom', '18.png', false]
    ];
  }

  void loadservicios() {
    servicios = _serviciosbox.get("SERVICIOS");
  }

  void updateservicios() {
    _serviciosbox.put("SERVICIOS", servicios);
  }
}

class AsistenciaDataBase {
  List asistencia = [];

  final _asistenciabox = Hive.box('asistenciabox');

  void createInitialasistencia() {
    asistencia = [
      ['Enero', 0],
      ['Febrero', 0],
      ['Marzo', 0],
      ['Abril', 0],
      ['Mayo', 0],
      ['Junio', 0],
      ['Julio', 0],
      ['Agosto', 0],
      ['Septiembre', 0],
      ['Octubre', 0],
      ['Noviembre', 0],
      ['Diciembre', 0],
    ];
  }

  void loadasistencia() {
    asistencia = _asistenciabox.get("ASISTENCIA");
  }

  void updateasistencia() {
    _asistenciabox.put("ASISTENCIA", asistencia);
  }
}
