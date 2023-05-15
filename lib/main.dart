import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gdsc_flutter_camp_2023_app_tres/presentation/screens/home_page.dart';
import 'package:gdsc_flutter_camp_2023_app_tres/presentation/services/morty_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MortyServices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomePage(),
        },
        theme: ThemeData(
          useMaterial3: true,
        ),
      ),
    );
  }
}
