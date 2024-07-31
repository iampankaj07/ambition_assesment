import 'package:ambitionguru_task/routes/app_routes.dart';
import 'package:ambitionguru_task/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const platform = MethodChannel('com.ambition.platform_channel');

  Future<void> _sendMessageToNative() async {
    try {
      final String result = await platform.invokeMethod('sendMessage', {
        'message': 'Message received from Flutter application.',
        'timestamp': DateTime.now().toString(),
      });
      print(result);
    } on PlatformException catch (e) {
      print("Failed to send message: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Task of Ambition Guru",
                style: CustomTextStyles.title,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.hierarchyfinder);
                  },
                  child: const Text("Hierarchy Finder")),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.homeScreen);
                  },
                  child: const Text("ListData Viewer ")),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: _sendMessageToNative,
                child: const Text('Send Message to Native'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
