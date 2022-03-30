import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enable/Disable Screenshot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disable taking screenshot"),
      ),
      body: SwitchListTile(
        value: isEnabled,
        title: const Text("Disable taking screenshot"),
        onChanged: (value) async {
          if (value) {
            await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
          } else {
            await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
          }
          setState(() {
            isEnabled = value;
          });
        },
      ),
    );
  }
}
