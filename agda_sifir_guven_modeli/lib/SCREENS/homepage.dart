import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:agdasifirguvenmodel/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts tts = FlutterTts(); // FlutterTTS instance
  bool isSpeaking = false; // Track if TTS is speaking
  int? speakingIndex; // Track which card is being spoken

  final List<Map<String, String>> cards = [
  {
  "title": "Ağda Sıfır Güven Modeli Nedir?",
  "content":

  """Zero Trust, işletmelerin kendi sınırları içerisinde veya dışarısında hiçbir cihaza ya da bireye otomatik olarak güvenmemesi ve erişim izni verilmeden önce her unsuru titizlikle doğrulaması gerektiği prensibine dayanan bir siber güvenlik konsepti olarak tanımlanmaktadır.

Zero Trust mimarisi, "güvene dayalı olmama" ilkesini esas alır ve güvenlik kontrolleri uygulanana kadar tüm erişim taleplerine sınırlama getirir. Bu mimari, uygun kimlik doğrulama süreçleri tamamlanmadıkça ve güven sağlanmadıkça, erişim noktalarını izole eder ve taleplerin işlenmesini engeller.

Sistem, IP adresleri, cihazlar ya da veri depolama sistemlerine erişim talebinde bulunan birey veya cihazları kapsamlı doğrulama süreçlerinden geçirir ve yalnızca doğrulama başarılı olduğunda erişim izni sağlar. Bu sayede, siber güvenlik tehditlerine karşı daha proaktif bir yaklaşım benimsenmiş olur."""

},
{
"title": "Zero Trust Temelleri",
"content": "Erişimi Kısıtlama: Olası saldırıların etkisini sınırlamak için dijital kaynaklara erişimi minimumda tutun."

"""Her Zaman Doğrulama: Ağınız içinde bile tüm erişim girişimlerinin kimliğini ve bütünlüğünü aktif olarak onaylayın. Erişimi Kısıtlama	Olası saldırıların etkisini sınırlamak için dijital kaynaklara erişimi minimumda tutun.
İhlal Varsayımı	Ağ segmentleri ve kaynaklar arasında güvenliği ihlal edilmiş gibi güvenliği sağlayın.
Her Zaman Doğrulama	Ağınız içinde bile tüm erişim girişimlerinin kimliğini ve bütünlüğünü aktif olarak onaylayın.
Her Şeyi İzleme	Riski değerlendirmek için gereken şekilde cihaz durumunu, güvenlik durumunu ve diğer ölçümleri izleyin.
Dinamik Politika	Mevcut verilere ve bilgilendirilmiş politikaya dayalı olarak erişim izni verin, reddedin veya erişimi engelleyin."""
},
    {
      "title": "Sıfır Güven Nasıl Çalışır?",
      "content":

          """Öncelikle sıfır güvenin bir tür uygulama veya belirli bir özellik olmadığını anlamanız önemlidir. Çünkü sıfır güven, çeşitli güvenlik önlemlerinden oluşan genel bir stratejidir. Zero trust güvenlik modelinin temel ilkesi, tüm kullanıcıların, cihazların ve hizmetlerin (kendi ağınızdakiler de dahil olmak üzere) potansiyel bir tehdit olarak değerlendirilmesinden geçer.

Tabi ki, güvenli kimlik doğrulamanın ilk adımı, kimlerin ağınızın bir parçası olduğunu ve bu kişilerin hangi sistemlere erişmelerine izin verildiğini bilmektir. Bu nedenle, işletmelerin kullanıcı hesap ve izinlerini takip etmesine yardımcı olan kimlik ve erişim yönetimi, sıfır güven çerçevesinin önemli bir parçasıdır.

Diyelim ki bir kullanıcı ağınızdaki bir kaynağa erişmeye çalışıyor. Cihazın arkasındaki kişinin gerçekten iddia ettiği kişi olup olmadığını kontrol etmek için önce güvenli çok faktörlü kimlik doğrulama (MFA) kullanarak kimliklerini kanıtlamaları gerekir. Bununla birlikte, sıfır güven modeli, bu tek kontrole dayalı olarak tüm ağa erişim vermek yerine kullanıcı etkinliğini izlemeye devam eder. Ek kaynaklara erişmek için arka planda gerçekleştirilen risk analizine ve belirli sistemler için tanımlanan güvenlik düzeyine bağlı olarak tekrarlanan veya artan kontrollerden geçmek zorunda kalabilirler.

Zero trust güvenliğinin ana avantajlarından biri, farklı durumlara uyum sağlama esnekliğidir. Kullanıcının konumu veya cihazın yama düzeyi gibi belirli bir bağlama bağlı olarak sistemlere erişim izni verilebilir, reddedilebilir veya kısıtlanabilir. Örneğin, şirket sunucusuna evden erişen kullanıcıların belirli dosyaları okumasına, ancak düzenlemesine izin vermeyen bir politika belirleyebilirsiniz.

Bu erişim kontrollerinin atlanamayacağından emin olmak için zero trust güvenlik modeli ayrıca uç nokta güvenliği, ağ izleme ve veri şifreleme (hem durağan hem de hareket halinde) gibi önlemleri içerir. Çoğu durumda ağ, her biri yeni nesil bir güvenlik duvarı tarafından korunan daha küçük bölümlere de bölünür. Sıfır güvenin özel uygulamasına bağlı olarak, bu güvenlik düzeyini desteklemek için farklı araç ve yazılım çözümlerine ihtiyaç vardır."""
    },

    {
      "title": "İşletmeler Neden Sıfır Güven Modeline İhtiyaç Duyar",
      "content":

          """Zero trust güvenlik modeli, içerideki her şeyin varsayılan olarak güvenli olduğuna ve yeterli güvenlik gerektiren tek şeyin ağ dışından erişim olduğuna inanır.

Pek çok işletme, çok fazla bağlantıda çok fazla şeyin çok açık bir şekilde çalışmasına izin verir; bu nedenle, her zaman minimum güvenlik katmanına sahip kurumsal ağların peşinde olan siber suçlular tarafından hedef alınır.

Ağ, işletme içindeki herkes için çok açık olduğundan, herkes her şeyi paylaşabilir ki, bu bir işletme için oldukça endişe vericidir.

Bu nedenle günümüzde işletmeler, kuruluş içindeki erişim yönetimi konusunda bilgisayar korsanları tarafından veri gizliliğinin en aza indirilmesine yardımcı olan yepyeni bir düşünce tarzına ihtiyaç duyar."""
    },
    {
      "title": "Ağda Sıfır Güven Modelinin Avantajları Nelerdir?",
      "content":

      """1. Hassas iş bilgilerini ve marka itibarını korur
Hassas iş verilerinin güvenliğini sağlamak, sadece milyonlarca dolarlık kayıpları önlemekle kalmayan, aynı zamanda marka itibarını da koruyan dijital dönüşüm yolculuğuna çıkan işletmelerin 1 numaralı önceliği olmalıdır.

Sağlam bir güvenlik mekanizmasının olmaması, finansal kayıplara neden olan tehlikeye atılmış tüketici kimliklerine yol açabileceği gibi tüketicilerin ihlal edilen bir işletme ile iş yapmayı reddetmesi, toplam gelirleri de etkiler.

Etkili bir Sıfır Güven çözümünün uygulanması, yalnızca kimliği doğrulanmış ve yetkilendirilmiş kişi ve cihazların kaynaklara ve uygulamalara erişmesini sağlamakla kalmaz, aynı zamanda veri ihlallerini azaltarak bu olumsuz sonuçların çoğunu da önler.

2. Daha fazla görünürlük
Sıfır Güven asla kimseye güvenmediğinden, güvenlik stratejinize hangi kaynakları, verileri ve etkinliği eklemeniz gerektiğine her zaman karar verebilirsiniz.

Tüm bilgi ve bilgi işlem kaynakları güvenlidir ve her kullanıcının belirli kaynaklara erişim kazanmak için sıkı bir kimlik doğrulama sürecinden geçmesi gerekir. Tüm faaliyet ve kaynaklarınızı kapsayan izlemeyi kurduktan sonra işletmenizin ağına nasıl ve kimlerin eriştiği konusunda tam bir görünürlük elde edersiniz.

Bu, her talepte yer alan zaman, konum ve uygulama ile ilgili kesin verilere sahip olduğunuz anlamına gelir.

Ayrıca, genel güvenlik sisteminiz şüpheli davranışların işaretlenmesine yardımcı olur ve meydana gelen her etkinliğin kaydını tutar.

3. Uzak iş gücünü güvence altına alma
BT kuruluşlarının bugün karşılaştığı en büyük zorluklardan biri, uzaktan çalışma ekosistemine ani geçiştir.

En son istatistiklere göre, BT profesyonellerinin C düzeyindeki yöneticilerinin yaklaşık %73’üne göre, dağıtılmış iş gücünün yeni güvenlik açıklarında ani bir artış sağlayacaktır.

Geleneksel güvenlik, güvenli bir kurumsal ağa bağlanan kullanıcılar etrafında optimize edilmiştir ve bu çevrenin dışındaki herhangi bir trafik, otomatik olarak güvenilmez olarak değerlendirilir. Bu yaklaşım, giderek daha uzak ve esnek hale gelen bir iş gücüyle bağdaşmaz. Ağlar yerine uygulama ve verilere güvenli erişim sağlayarak dağıtılmış ve mobil iş gücü düşünülerek sıfır güven oluşturulmuştur.

4. Saldırı yüzeyini azaltma
Yalnızca en büyük kuruluşların veya önemli bir çevrimiçi varlığa sahip olan şirketlerin siber saldırı riskinin en yüksek olduğu günler çoktan geride kaldı. Bugün, herhangi bir işletme bile siber suçlular için çekici bir hedef olabilir. Bu nedenle kuruluşlarının saldırı yüzeyini etkin bir şekilde azaltmak, BT yöneticileri için çok önemli bir önceliktir.

Sıfır güven çerçevesi, kullanıcıları ve uygulamaları internetten ayırma şekli nedeniyle işletmenizin saldırı yüzeyini azaltmak için üstün bir yeteneğe sahiptir. Bu ayrım, bilgisayar korsanlarının altyapınıza yetkisiz erişim elde etmek için sahip oldukları fırsatların azalmasına neden olur.

5. Veri ihlali ve diğer tehdit risklerini azaltma
Hiçbir siber savunma mükemmel değildir ve sıfır güven modelinden bile taviz verilebilir. Bununla birlikte, geleneksel bir güvenlik modeli ile sıfır güven arasındaki fark, bir ihlalden kaynaklanan potansiyel zararın, sıfır güven için önemli ölçüde azaltılmış olmasıdır. Sıfır güven, başarılı güvenlik ve veri ihlalleri riskini azaltır. Bu noktada bir davetsiz misafir bir güvenlik açığından yararlanarak yetkisiz erişim elde etmeyi başarsa bile, ağda yanal olarak hareket etme güveninden yoksun kalır, yani gidecek hiçbir yerleri olmaz. Zero trust güvenliği, ciddi siber saldırılara ve ihlallere karşı olağanüstü koruma sağladığından, bir ihlalden kurtulmak için harcanan zaman ve para da önemli ölçüde azaltılacaktır.

6. Bulut ortamları ve iş yükleri için bile daha ayrıntılı kontrol ve görünürlük sağlayın
Bulut ortam ve iş yüklerinizin güvenliği, BT’niz ile bulut satıcınız arasında paylaşılan bir sorumluluktur, ancak bulut iş ortağının platformunda yapabileceğiniz çok şey vardır. Sıfır güven, ister şirket içi bir uygulamayla ister bir bulut iş yüküyle iletişim kurmaya çalışsın, tüm trafiği doğrulayarak bu zorluğun üstesinden gelmeye yardımcı olur. Bu doğrulama ilkeleri iş yüklerinin kendileriyle ilişkilendirildiğinden, ağ hususlarından etkilenmezler. Tüm bunlar, BT’nizi daha ayrıntılı bir görünürlük ve tüm trafik üzerinde kontrol ile güçlendirerek daha kapsamlı bir güvenlik duruşu oluşturmalarını sağlar.

7. BT’nizdeki idari yükü azaltma
Büyük geleneksel ağlar ve güvenlik altyapısının yönetilmesi külfetli ve karmaşıktır ve bunları destekleyen teknoloji hızla eski haline gelmektedir. Yukarıda belirtilen daha fazla görünürlük ve kontrol, kimlik doğrulamaya yönelik basitleştirilmiş yaklaşımla birleştiğinde, BT’nizin üzerindeki idari yükü önemli ölçüde azaltır ve BT’nizin daha önemli görevlere odaklanmasını sağlar.

8. Daha fazla güvenlik ve gizlilik uyumluluğunu destekleme
Sıfır güven, işletmelerin güvenlik ve gizlilik yönetmeliğiyle daha fazla uyumluluğa sahip bir güvenlik altyapısı oluşturmasına olanak tanır. Bunun nedeni, sıfır güvenin, kullanıcıları, verileri ve uygulamaları internetten gizleme konusunda doğuştan gelen bir yeteneğe sahip olmasıdır. Bu da, bu kullanıcıların ve bağlantıların açığa çıkma veya istismar edilme riskini en başından azaltır."""
    },
    {
      "title": "Sıfır Güven Modelini Kullanmanın Zorlukları",
      "content":

      """1. Kurulum için zaman ve çaba
Geçiş sırasında hala çalışması gerektiğinden, mevcut bir ağ içindeki ilkeleri yeniden düzenlemek zor olabilir. Genellikle sıfırdan yeni bir ağ oluşturmak ve sonra geçiş yapmak aslında daha kolaydır. Eski sistemler Sıfır Güven çerçevesiyle uyumsuzsa sıfırdan başlamak gerekli olur.

2. Çeşitli kullanıcıların artan yönetimi
Çalışan kullanıcıların, sadece gerektiğinde verilen erişimle daha yakından izlenmesi gerekir ve kullanıcılar çalışanların ötesine geçebilir. Müşteriler, alıcılar ve üçüncü taraf satıcılar da şirketin web sitesini kullanabilir veya verilere erişebilir. Bu, çok çeşitli erişim noktaları olduğu ve Sıfır Güven çerçevesinin her grup türü için özel politikalar gerektirdiği anlamına gelir.

3. Yönetilecek daha fazla cihaz
Günümüzün çalışma ortamı yalnızca farklı türde kullanıcıları değil, her biri için çeşitli türde aygıtları içerir. Farklı cihazların, türlerine göre izlenmesi ve güvenliğinin sağlanması gereken kendi özellikleri ve iletişim protokolleri olabilir.

4. Daha karmaşık uygulama yönetimi
Uygulamalar genellikle bulut tabanlıdır ve birden çok platformda kullanılır ve üçüncü taraflarla paylaşılabilir. Sıfır Güven anlayışı doğrultusunda, uygulama kullanımı planlanmalı, izlenmeli ve kullanıcı ihtiyacına göre uyarlanmalıdır.

5. Daha dikkatli veri güvenliği
Bugünlerde birden fazla konum verisi saklanır, bu da korunması gereken daha fazla site olduğu anlamına gelir. Bu noktada veri yapılandırmasının en yüksek güvenlik standartlarıyla sorumlu bir şekilde yapılması gerekir."""
    },
    {
      "title": "Sıfır Güven Nasıl Uygulanır?",
      "content":

      """Sıfır güven, belirli bir üründen ziyade ağ güvenliğine yönelik genel bir yaklaşımı ifade eder, bu nedenle satın alabileceğiniz ve kurabileceğiniz herkese uyan tek bir çözüm yoktur. Bunun yerine, sıfır güven, çeşitli farklı güvenlik önlem ve en iyi uygulamaları kapsar. Ağınızın temel yapısı bile hassas kaynaklara erişimin yönetilmesinde büyük rol oynar. Bu nedenle kavram, sıfır güven mimarisi (ZTA) veya sıfır güven ağ mimarisi (ZTNA) olarak da bilinir.

Her ağ farklı olduğundan, sıfır güven erişiminin kuruluşunuzun özel yapısına ve ihtiyaçlarına göre uyarlanması gerekir. Sıfır güvene geçişinizi hazırlamak için kullanıcı ve veri akışları, hassas kaynakların konumu ve internete açık sistemler gibi potansiyel zayıflıklar gibi faktörleri hesaba katmanız önemlidir. Sıfır güven, belirli bir üründen ziyade ağ güvenliğine yönelik genel bir yaklaşımı ifade eder, bu nedenle satın alabileceğiniz ve kurabileceğiniz herkese uyan tek bir çözüm yoktur. Bunun yerine, sıfır güven, çeşitli farklı güvenlik önlem ve en iyi uygulamaları kapsar. Ağınızın temel yapısı bile hassas kaynaklara erişimin yönetilmesinde büyük rol oynar. Bu nedenle kavram, sıfır güven mimarisi (ZTA) veya sıfır güven ağ mimarisi (ZTNA) olarak da bilinir.

Her ağ farklı olduğundan, sıfır güven erişiminin kuruluşunuzun özel yapısına ve ihtiyaçlarına göre uyarlanması gerekir. Sıfır güvene geçişinizi hazırlamak için kullanıcı ve veri akışları, hassas kaynakların konumu ve internete açık sistemler gibi potansiyel zayıflıklar gibi faktörleri hesaba katmanız önemlidir. 

1. Ağınızın Haritasını Çıkarma
Zero trust, güvenliğini uygulamanın ilk adımı, dijital altyapınızın parçası olan tüm kullanıcıların, cihazların ve hizmetlerin bir envanterini çıkarmaktır. Çoğu zaman haritalama yöntemi, sahipsiz hesaplar veya kullanılmayan arayüzler gibi hemen ortadan kaldırılması gereken güvenlik açıklarını ortaya çıkarır.

Ağınızdaki tüm kullanıcı ve kaynakların doğru bir listesine sahip olduğunuzda, bir sonraki adım kimin hangi sistemlere erişmesi gerektiğini belirlemek ve en az ayrıcalıklı erişime dayalı bir güvenlik politikası tasarlamaktır. 

2. Planlama ve Öncelikler
Kullanıcı ve kaynakların haritasını çıkarmak, size yalnızca ağınızın mevcut durumunun daha net bir resmini vermekle kalmaz, aynı zamanda yeni güvenlik politikanızı eyleme geçirmede sonraki adımları belirlemenize de yardımcı olur. 

Sıfır güven mimarisini uygulamanın en kolay yolu, sıfırdan başlamak ve tüm ağı sıfır güveni göz önünde bulundurarak yeniden tasarlamaktır. Ancak, sürekli erişim, sürekli hizmet ve sürekli operasyon gibi süreklilik başka bir önemli faktör olduğundan, bu tür köklü bir değişiklik çoğu işletme için pratik bir çözüm değildir. Bu nedenle çoğu işletme, zero trust güvenliğine kademeli geçişi seçer.

Tüm planınızı bir anda eyleme geçiremeyeceğiniz için öncelikle hangi sistem ve kaynakların güvenliğinin sağlanması gerektiğine dair net öncelikler belirlemeniz gerekir. Bu noktada kendinizi olası bir bilgisayar korsanının yerine koymanız ve ağınızın hangi alanlarının yüksek değerli hedefler veya olası giriş noktaları olduğunu düşünmeniz gerekir.

3. Planı Eyleme Geçirme
Zero trust güvenliğine giden yolda son adım, planınızı eyleme geçirmektir. Fakat tüm yöneticiler, bunun gibi büyük değişikliklerin bazı sorunlara ve gerilimlere neden olabileceğini bilir. Sorunsuz bir geçiş sağlamak için uzmanlar, simülasyonla başlamayı önerir. Bu test aşamasında, kaynaklara tüm erişimler yeni güvenlik ilkesine göre kontrol edilir ve sonuçlar ileride gözden geçirilmek üzere günlüğe kaydedilir. Ancak, bu ek denetimleri geçemeyen kullanıcı ve hizmetlere normal erişim izni verilir.

Bu yaklaşım, herhangi bir karışıklığı ortadan kaldırmanıza ve önemli bir uygulamanın ağa erişememesi gibi önemli bir şeyi kaçırıp kaçırmadığınızı görmenize izin veren bir tür deneme çalıştırması olarak düşünebilirsiniz. Ayrıca personelinize güvenlik önlemlerine ve ek kontrollere alışmanız için biraz zaman tanır.

Genel olarak, zero trust güvenliğinin uygulanması tek seferlik bir görev değildir, yeniden değerlendirme ve düzenli revizyonlar gerektiren sürekli bir süreçtir. Güvenlik politikanız yürürlüğe girdikten sonra bile ağınızı genişlettikçe veya yapıda değişiklikler yaptıkça onu güncellemeye devam etmeniz gerekir."""
    },
    {
      "title": "İşletmeler Neden Sıfır Güven Modeline İhtiyaç Duyar",
      "content":

      """Zero trust güvenlik modeli, içerideki her şeyin varsayılan olarak güvenli olduğuna ve yeterli güvenlik gerektiren tek şeyin ağ dışından erişim olduğuna inanır.

Pek çok işletme, çok fazla bağlantıda çok fazla şeyin çok açık bir şekilde çalışmasına izin verir; bu nedenle, her zaman minimum güvenlik katmanına sahip kurumsal ağların peşinde olan siber suçlular tarafından hedef alınır.

Ağ, işletme içindeki herkes için çok açık olduğundan, herkes her şeyi paylaşabilir ki, bu bir işletme için oldukça endişe vericidir.

Bu nedenle günümüzde işletmeler, kuruluş içindeki erişim yönetimi konusunda bilgisayar korsanları tarafından veri gizliliğinin en aza indirilmesine yardımcı olan yepyeni bir düşünce tarzına ihtiyaç duyar."""
    },
// Add more cards as needed...
];

Future<void> _speak(String text, int index) async {
  await tts.setLanguage("tr-TR"); // Set language
  await tts.setSpeechRate(1.0); // Set speech rate
  await tts.speak(text);
  setState(() {
    isSpeaking = true;
    speakingIndex = index;
  });
}

Future<void> _stop() async {
  await tts.stop();
  setState(() {
    isSpeaking = false;
    speakingIndex = null;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: acikRenk,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
            final card = cards[index];
            return GestureDetector(
              onTap: () => _speak(card['content']!, index),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: anaRenk2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card['title']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: acikRenkBeyaz,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final span = TextSpan(
                              text: card['content']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            );
                            final tp = TextPainter(
                              text: span,
                              maxLines: 10,
                              textDirection: TextDirection.ltr,
                            );
                            tp.layout(maxWidth: constraints.maxWidth);

                            if (tp.didExceedMaxLines) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card['content']!.substring(0, 400) + '...',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            title: card['title']!,
                                            content: card['content']!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text('Devamını Gör',style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                card['content']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(
                            speakingIndex == index ? Icons.volume_off : Icons.volume_up,
                            color: speakingIndex == index ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            if (speakingIndex == index) {
                              _stop();
                            } else {
                              _speak(card['content']!, index);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String content;

  const DetailPage({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              background: Container(color: acikRenk2),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                content,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
