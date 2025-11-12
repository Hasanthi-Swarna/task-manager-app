
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/theme/theme.dart';
import 'package:taskmanager/providers/theme_provider.dart';
import 'views/login_view.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Task Manager',
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: themeProvider.themeMode,
            home: LoginView(),
          );
        },
      ),
    );
  }
}
