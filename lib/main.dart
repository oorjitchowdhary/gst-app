import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/report.dart';
import 'screens/faqs.dart';
import 'screens/chat.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyberbullying',
      routes: {
        Report.id: (context) => Report(),
        FAQs.id: (context) => FAQs(),
        Chat.id: (context) => Chat()
      },
      home: Home()
    );
  }
}
