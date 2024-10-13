import 'package:flutter/material.dart';
import 'ui/homepage/index.dart';

void main() {
    runApp(const MainApp(appTitle: 'GreenSHeart Test App',));
}

class MainApp extends StatelessWidget {
    final String appTitle;

    // This widget is the root of your application.
    final Widget homeScreen = const HomeScreen(screenTitle: 'Homepage',);

    const MainApp({
        super.key,
        this.appTitle = 'Default App Title',
    });

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'GreenSHeart Test App',
            theme: ThemeData(
                // This is the theme of your application.
                //
                // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a purple toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
                useMaterial3: true,
            ),
            home: homeScreen,
        );
    }
}
