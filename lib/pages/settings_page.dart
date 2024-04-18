import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsPage extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  SettingsPage(this.onSettingsChanged);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var settings = Settings();
  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: MainDrower(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Configurações',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            //Expanded faz com que o ListView ocupe todo o espaço disponível
            Expanded(
              child: ListView(
                children: <Widget>[
                  _createSwitch(
                    'Sem glutén',
                    'Só exibe refeições sem glutén',
                    settings.isGlutenFree,
                    (newValue) => setState(() {
                      settings.isGlutenFree = newValue;
                    }),
                  ),
                  _createSwitch(
                    'Sem lactose',
                    'Só exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (newValue) => setState(() {
                      settings.isLactoseFree = newValue;
                    }),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas',
                    settings.isVegetarian,
                    (newValue) => setState(() {
                      settings.isVegetarian = newValue;
                    }),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas',
                    settings.isVegan,
                    (newValue) => setState(
                      () {
                        settings.isVegan = newValue;
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
