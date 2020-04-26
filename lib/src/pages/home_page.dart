import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shareprefs/usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static final String routeName = "home";
  static final prefs = new PreferencesUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de usuario"),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),
          Text("Genero: ${prefs.genero}"),
          Divider(),
          Text("Nombre de usuario: ${prefs.nombre}"),
          Divider(),
        ],
      ),
    );
  }
}