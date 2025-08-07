import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.requestPermission();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final WebViewController _controller;
  String? _fcmToken;

  @override
  void initState() {
    super.initState();

    // Initialisation WebView
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.gardetameuf.com'));

    // Récupération du token FCM
    FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        _fcmToken = token;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generic Webview App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Generic Webview App')),
        body: Column(
          children: [
            if (_fcmToken != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(
                  'FCM Token:\n$_fcmToken',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            Expanded(child: WebViewWidget(controller: _controller)),
          ],
        ),
      ),
    );
  }
}
