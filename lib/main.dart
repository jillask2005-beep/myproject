import 'package:amazon/Calculator.dart';
import 'package:amazon/dashboard.dart';
import 'package:amazon/insta.dart';
import 'package:amazon/instagram.dart' hide Insta;
import 'package:amazon/pagess121.dart';
import 'package:amazon/provider.dart';
import 'package:amazon/splash%20screen.dart';
import 'package:amazon/splashscreen%202.0.dart';
import 'package:amazon/spot.dart';
import 'package:amazon/sristore.dart';
import 'package:amazon/stacksample.dart';
import 'package:amazon/videoplayer.dart';
import 'package:amazon/youtube.dart';
import 'package:amazon/youtuberi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'AMAZON2.0.dart';
import 'Amazon/mainflip.dart';
import 'CommonBottomnavigation.dart';
import 'app ui.dart';
import 'applered.dart';
import 'calculatorsri.dart';
import 'convas.dart';
import 'counterpage.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



import 'friday task.dart';
import 'gst calculator.dart';
import 'imagepicker.dart';
import 'instagrampagesri.dart';
import 'listandgridview.dart';
import 'listoffruits.dart';
import 'package:provider/provider.dart' as p;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: p.ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:splashsri(),
      debugShowCheckedModeBanner: false,
    );
  }
}
