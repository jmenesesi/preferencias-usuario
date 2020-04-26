import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shareprefs/usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = "Juan";

  TextEditingController _nombreController;

  PreferencesUsuario prefs;
  @override
  void initState() {
    super.initState();
    _nombreController = new TextEditingController(text: _nombre);
    _nombreController.addListener(() {
      _nombreController.value.copyWith(text: _nombre);
    });
    this.loadPrefs();
  }

  loadPrefs() async {
    prefs = new PreferencesUsuario();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombreController = new TextEditingController(text: prefs.nombre);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = SettingsPage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de usuario"),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text("Color secundario"),
            onChanged: (value) {
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {
              });
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile(
                  value: 1,
                  title: Text("Masculino"),
                  groupValue: _genero,
                  onChanged: _setSelectedRadio,
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: 2,
                  title: Text("Femenino"),
                  groupValue: _genero,
                  onChanged: _setSelectedRadio,
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                  labelText: "Nombre",
                  helperText: "Nombre de la persona usando el teléfono"),
              onChanged: (value) {
                prefs.nombre = value;
                setState(() {
                  _nombre = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) async {
    prefs.genero = value;
    _genero = value;
    setState(() {
    });
  }
}
