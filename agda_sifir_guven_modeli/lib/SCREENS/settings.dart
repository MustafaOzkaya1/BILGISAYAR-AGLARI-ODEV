import 'package:agdasifirguvenmodel/colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _autoPlayEnabled = false; // Otomatik video oynatma ayarı
  String _selectedLanguage = 'Türkçe'; // Dil ayarı varsayılan olarak Türkçe
  String _selectedTheme = 'Açık'; // Tema ayarı varsayılan olarak Açık

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: acikRenk,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dil Ayarları


          // Otomatik Video Oynatma Ayarı
          SwitchListTile(
            activeColor:anaRenk,
            title: const Text('Bildirimler',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: const Text('Uygulama bildirimlerini aç/kapat'),
            value: _autoPlayEnabled,
            onChanged: (bool value) {
              setState(() {
                _autoPlayEnabled = value;
              });
            },
          ),
          Divider(color: anaRenk),

          // Tema Ayarları


          // Bildirim Ayarları


          // Hakkında
          const ListTile(
            title: Text('Hakkında', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              'Bu uygulama, güvenlik bilinciyle geliştirilmiş sıfır güven modeline dayalı bir projedir. '
                  'Kullanıcının gizliliğini ön planda tutan bir güvenlik sistemi ile geliştirilmiştir.',
            ),
          ),
          Divider(color: anaRenk),

          // İletişim
          const ListTile(
            title: Text('İletişim', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('mustafaozkaya4221@gmail.com'),
            leading: Icon(Icons.email),
          ),
        ],
      ),
    );
  }
}