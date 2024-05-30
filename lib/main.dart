import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:peanut_app/socket/socket_service.dart';
import 'package:peanut_app/socket/web_socket.dart';
import 'package:peanut_app/utils/size.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'AppBinding.dart';
import 'di_container.dart' as di;
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'utils/app_constants.dart';
import 'utils/color_peanut.dart';

SocketService socketService = SocketService();
WebSocketService socketService02 = WebSocketService();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SUPERBASE_URL,
    anonKey: SUPERBASE_ANON_KEY,
  );
  await di.init();
  await PSize.device;

  // Initialize the SocketService
  SocketService();
  // socketService02.initializeSocket();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const <Locale>[Locale('vi', 'VI')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorPeanut.BASE_BACKGROUND,
      ),
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.list,
      initialBinding: AppBinding(),
      transitionDuration: const Duration(),
      builder: EasyLoading.init(
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
              boldText: false,
            ),
            child: widget!,
          );
        },
      ),
    );
  }
}
