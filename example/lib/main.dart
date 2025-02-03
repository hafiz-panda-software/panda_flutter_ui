import 'package:flutter/material.dart';
import 'package:panda_flutter_ui/panda_flutter_ui.dart';
import 'package:panda_flutter_ui/panda_widgets/html/panda_html_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panda Flutter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String platformType = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panda Flutter UI"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              child: PandaImage(
                remoteImageUrl:
                    'https://estore.panda-eco.com/crmfileshare01/image/panda3/cache/product/100047_11012023171113-300x300.png',
                watermarkImageUrl:
                    'https://estore.panda-eco.com/crmfileshare01/image/panda4/logo/watermark_01022023115628.png',
                isZoomableImage: true,
                isGreyImage: true,
              ),
            ),
            PandaHtmlView(
              data: '''
Test not html
  <H1>Heading 1</H1>
  <H2>Heading 2</H2>
  <H3>Heading 3</H3>
  <H4>Heading 4</H4>
  <H5>Heading 5</H5>
  <H6>Heading 6</H6>
  <p>Lorem ipsum dolor sit amet, consectetur <a href="https://google.com/">Google!</a> adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
  <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkZfSUuIOGln-FOAW3OSoJquZXRolTjZhseQ&usqp=CAU"/>
    <br/>
    <div class=\"col-lg-12\">\r\n                    <table class=\"table table-bordered\">\r\n                        <thead>\r\n                            <tr style=\"background:#dddddd;\">\r\n                                <th>Category</th>\r\n                                <th>TIN Old Version</th>\r\n                                <th>TIN New Version*</th>\r\n                                <th>Remarks</th>\r\n                            </tr>\r\n                        </thead>\r\n                        <tbody>\r\n                            <tr>\r\n                                <td rowspan=\"3\" style=\"background:#dddddd;vertical-align:middle;\">\r\n                                    <b>Individual</b>\r\n                                </td>\r\n                                <td>SG115002000</td>\r\n                                <td>IG115002000</td>\r\n                                <td rowspan=\"3\">\r\n                                    The prefix of SG/OG have been converted to IG, while the numeric characters remain unchanged.\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>SC4040080091</td>\r\n                                <td>IG4040080091</td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>OG56003500070</td>\r\n                                <td>IG56003500070</td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td rowspan=\"4\" style=\"background:#dddddd;vertical-align:middle;\">\r\n                                    <b>Business</b>\r\n                                </td>\r\n                                <td>C2088005001</td>\r\n                                <td>C20880050010</td>\r\n                                <td rowspan=\"4\">\r\n                                    An additional \"0\" has been added to the end of the existing TIN number.\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>D480099002</td>\r\n                                <td>D4800990020</td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>E9100550006</td>\r\n                                <td>E91005500060</td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>F1023456709</td>\r\n                                <td>F10234567090</td>\r\n                            </tr>\r\n                        </tbody>\r\n                    </table>\r\n\t\t\t*Effective from 2 January 2023\r\n\t\t\t<hr>\r\n                </div>\t\t\r\n                <div class=\"col-lg-12\">\r\n                    <p>If you encounter any issues validating TIN information, you may reach out to LDHN through the following channels:</p>\r\n                    <ol type=\"a\">\r\n                        <li>Check TIN information via <a href=\"https://mytax.hasil.gov.my/ezHasil?data=e-Daftar&id=ezHasil%20sebelum\" target=\"_blank\">MyTax Portal</a> under \"e-Daftar\" menu</li>\r\n                        <li>Contact LHDN customer care at 03-8911 1000</li>\r\n                        <li>Visit the nearest LHDN office</li>\r\n                    </ol>\r\n                </div>''',
              textColor: Colors.grey[700],
              isCenterText: false,
              onLinkTap: (url) {
                print('html url: $url');
              },
            ),
          ],
        ),
      ),
    );
  }
}
