import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shape_up/screens/landing/landing_page.dart';
import 'package:shape_up/screens/landing/welcome_view.dart';
import 'screens/auth/auth_view.dart';
import 'screens/programs/programs_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shape_up/screens/programs/programs_screen.dart';
import 'package:camera/camera.dart';
import 'package:shape_up/screens/progress_picture/camera_screen.dart';


List<CameraDescription> cameras = [];
//AIzaSyBcJad2G_dU8nruib9IB1DmkI1vKs4PRlg
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDNDYHSkDd6ssRTcn_EyJMp26ivtUP0PdQ",
      appId: "1:686027089814:android:1e90842d9e4eae7fb1dfb7",
      messagingSenderId: "686027089814",
      projectId: "glossy-protocol-396914",
    ),
  );


  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/auth': (context) => AuthView(),
        '/programs': (context) => ProgramsScreen(),
        // Add more routes as needed
      },
    );
  }
}

