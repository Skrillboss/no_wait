import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        SettingsGroup(
          title: 'Aplicación',
          children: <Widget>[
            ExpandableSettingsTile(
              title: 'Configuraciones avanzadas',
              children: <Widget>[
                SwitchSettingsTile(
                  settingKey: 'key-material-design',
                  title: 'Material Design',
                  enabledLabel: 'Enabled',
                  disabledLabel: 'Disabled',
                  leading: Icon(Icons.font_download),
                ),
                SwitchSettingsTile(
                  settingKey: 'key-flat-design',
                  title: 'Flat Design',
                  enabledLabel: 'Enabled',
                  disabledLabel: 'Disabled',
                  leading: Icon(Icons.font_download),
                ),
                SwitchSettingsTile(
                  settingKey: 'key-neumorphism',
                  title: 'Neumorphism',
                  enabledLabel: 'Enabled',
                  disabledLabel: 'Disabled',
                  leading: Icon(Icons.font_download),
                ),
              ],
            ),
            SwitchSettingsTile(
              settingKey: 'key-dark-mode',
              title: 'Notificaciones',
              enabledLabel: 'Enabled',
              disabledLabel: 'Disabled',
              leading: Icon(Icons.notifications_active),
            ),
          ],
        ),
        SettingsGroup(
          title: 'Apariencia',
          children: <Widget>[
            ExpandableSettingsTile(
              title: 'Estilo de Fuente',
              subtitle: 'Tipografía',
              children: <Widget>[
                SwitchSettingsTile(
                  settingKey: 'key-material-design',
                  title: 'Material Design',
                  enabledLabel: 'Enabled',
                  disabledLabel: 'Disabled',
                  leading: Icon(Icons.font_download),
                ),
                SwitchSettingsTile(
                  settingKey: 'key-flat-design',
                  title: 'Flat Design',
                  enabledLabel: 'Enabled',
                  disabledLabel: 'Disabled',
                  leading: Icon(Icons.font_download),
                ),
                SwitchSettingsTile(
                  settingKey: 'key-neumorphism',
                  title: 'Neumorphism',
                  enabledLabel: 'Enabled',
                  disabledLabel: 'Disabled',
                  leading: Icon(Icons.font_download),
                ),
              ],
            ),
            SwitchSettingsTile(
              settingKey: 'key-dark-mode',
              title: 'Modo oscuro',
              enabledLabel: 'Enabled',
              disabledLabel: 'Disabled',
              leading: Icon(Icons.palette),
            ),
          ],
        ),
        SettingsGroup(
          title: 'Usuario',
          children: <Widget>[
            TextInputSettingsTile(
              title: 'Nombre',
              settingKey: 'key-user-name',
              initialValue: 'user.name',
              borderColor: Colors.blueAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'Apodo',
              settingKey: 'key-user-name',
              initialValue: 'user.nickName',
              borderColor: Colors.blueAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'Correo Electrónico',
              settingKey: 'key-user-name',
              initialValue: 'user.email',
              borderColor: Colors.blueAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'Numero telefónico',
              settingKey: 'key-user-name',
              initialValue: 'user.phone',
              borderColor: Colors.blueAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ],
    );
  }
}
