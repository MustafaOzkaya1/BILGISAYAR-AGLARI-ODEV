import 'package:agdasifirguvenmodel/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;



class VideosPage extends StatelessWidget {
  final Map<String, String> videoData = {
    'babana bile güvenme! - ZERO TRUST TEKNOLOJISI': 'https://www.youtube.com/watch?v=wcI4f2WaMp4',
    'WEBINAR : SİBER GÜVENLİKTE KURALLARI DEĞİŞTİREN MİMARİ - SIFIR GÜVEN AĞ ERİŞİMİ': 'https://www.youtube.com/watch?v=DhJix-85lOY',
    'Uzaktan Erişimde Sıfır Güven (Zero Trust) Yaklaşımı ile, Maksimum Koruma': 'https://www.youtube.com/watch?v=P9VmExyuh5U',
    'VPN mi ZTNA mi? Asla Güvenme, Her Zaman Doğrula!': 'https://www.youtube.com/watch?v=auL1D7CYlx4',
    'Fortinet ile ZTNA - Sıfır Güven Ağ Erişimi (Webinar Videosu)': 'https://www.youtube.com/watch?v=HBb07b9ZRXU&t=865s',
    'Şirketler İçin Yeni Ağ Güvenliği Modeli: Sıfır Güven Yaklaşımı': 'https://www.youtube.com/watch?v=ZBUAc592lNE&t=12s'
  };

  // YouTube URL'yi doğrudan başlatan fonksiyon
  Future<void> _launchURL(String url) async {
    await launch(url); // YouTube uygulamasında ya da tarayıcıda aç
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: acikRenk,

      body: ListView.builder(
        itemCount: videoData.length,
        itemBuilder: (context, index) {
          String title = videoData.keys.elementAt(index);
          String videoUrl = videoData.values.elementAt(index);

          // Use local assets for the images
          String assetImagePath = 'images/${index + 1}.jpg';

          return GestureDetector(
            onTap: () {
              _launchURL(videoUrl); // Tıklandığında URL'yi başlat
            },
            child: Card(
              color: Colors.black,
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    assetImagePath,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
