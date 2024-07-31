import 'package:ambitionguru_task/core/utils/size_utils.dart';
import 'package:ambitionguru_task/presentation/hierarchy/hierarchy_provider.dart';
import 'package:ambitionguru_task/presentation/provider.dart';
import 'package:ambitionguru_task/routes/app_routes.dart';
import 'package:ambitionguru_task/widgets/coming_soon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => HierarchyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          // theme: theme,
          title: 'AmbitionGuru Task',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return const ComingSoonPage(); // Your default route
              },
            );
          },
        );
      },
    );
  }
}
