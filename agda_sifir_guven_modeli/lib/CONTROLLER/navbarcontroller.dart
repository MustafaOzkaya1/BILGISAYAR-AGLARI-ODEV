import 'package:agdasifirguvenmodel/SCREENS/homepage.dart';
import 'package:agdasifirguvenmodel/SCREENS/settings.dart';
import 'package:agdasifirguvenmodel/SCREENS/videos.dart';
import 'package:agdasifirguvenmodel/colors.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_tts/flutter_tts.dart'; // flutter_tts paketini ekleyin

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final FlutterTts tts = FlutterTts(); // FlutterTTS örneği oluştur
  int _currentIndex = 0; // CircleNavBar için aktif tab index'i
  bool isSpeaking = false; // Konuşma durumu kontrolü

  // Farklı sayfaları tanımlıyoruz
  final List<Widget> _pages = [
    HomePage(),   // Ana sayfa
    VideosPage(),  // Videolar sayfası
    SettingsPage(),  // Ayarlar sayfası
  ];

  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await tts.setLanguage("tr-TR"); // Türkçe dil ayarı
    await tts.setSpeechRate(1.0); // Konuşma hızı ayarı
    await tts.speak(text);
    setState(() {
      isSpeaking = true;
    });
  }

  Future<void> _stop() async {
    await tts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: anaRenk2,
        title: Text(
          "Ağda Sıfır Güven Modeli",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: deviceWidth * 0.050,
          ),
        ),
        actions: [

        ],
      ),
      backgroundColor: acikRenk,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.video_library_outlined, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
        inactiveIcons: [
          Icon(Icons.home_outlined, color: acikRenk2),
          Icon(Icons.video_library_outlined, color: acikRenk2),
          Icon(Icons.settings, color: acikRenk2),
        ],
        color: anaRenk2,
        circleColor: acikRenk2,
        height: 60,
        circleWidth: 60,
        activeIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        cornerRadius: const BorderRadius.all(Radius.circular(24)),
      ),
    );
  }
}