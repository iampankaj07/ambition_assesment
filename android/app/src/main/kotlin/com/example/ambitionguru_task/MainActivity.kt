package com.example.ambitionguru_task

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.ambition.platform_channel"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "sendMessage") {
                val message = call.argument<String>("message")
                val timestamp = call.argument<String>("timestamp")
                if (message != null && timestamp != null) {
                    // Your logic here
                    result.success("Message from Android: Received your message.")
                } else {
                    result.error("UNAVAILABLE", "Message or timestamp not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
