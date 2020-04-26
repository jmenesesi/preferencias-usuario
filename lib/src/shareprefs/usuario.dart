import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUsuario {
  
  static final PreferencesUsuario _instancia = new PreferencesUsuario._internal();

  factory PreferencesUsuario() {
    return _instancia;
  }

  PreferencesUsuario._internal();

  SharedPreferences _prefs;
  
  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt("genero") ?? 1;  
  }

  set genero(int value) {
    _prefs.setInt("genero", value);
  }

  get colorSecundario {
    return _prefs.getBool("color_secundario") ?? false;  
  }

  set colorSecundario(bool value) {
    _prefs.setBool("color_secundario", value);
  }

  get nombre {
    return _prefs.getString("nombre_usuario") ?? "";  
  }

  set nombre(String value) {
    _prefs.setString("nombre_usuario", value);
  }

  get lastPage {
    return _prefs.getString("last_page") ?? HomePage.routeName;  
  }

  set lastPage(String value) {
    _prefs.setString("last_page", value);
  }
}