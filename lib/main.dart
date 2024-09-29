import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_3/management/pages/Create_boolean_question_page.dart';
import 'package:final_project_3/management/pages/Create_mulipale_question_page.dart';
import 'package:final_project_3/management/pages/Create_one%20answer_corect_question.dart';
import 'package:final_project_3/management/pages/Create_word_in_order_question.dart';
import 'package:final_project_3/models/basic_question.dart';
import 'package:final_project_3/models/game_board.dart';
import 'package:final_project_3/models/multipal_question.dart';
import 'package:final_project_3/models/sticker.dart';
import 'package:final_project_3/models/user.dart';
import 'package:final_project_3/pages/login_page_one.dart';
import 'package:final_project_3/services/questions/questions_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'models/album.dart';
import 'models/basic_question.dart';
import 'models/game_board.dart';
import 'models/sticker.dart';
import 'models/user.dart';
import 'pages/intro_screen.dart';
import 'pages/ready_screen.dart';
import 'theme/color_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
        theme: appTheme);
  }
}
