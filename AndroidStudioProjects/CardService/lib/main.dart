import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'map_screen.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());  // Запуск приложения, начальная точка входа
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Map App',  // Название приложения
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Тема приложения с основным синим цветом
      ),
      initialRoute: '/',  // Начальный маршрут (экран) приложения
      routes: {
        '/': (context) => AuthScreen(),  // Маршрут для экрана авторизации
        Routes.mapScreen: (context) => MapScreen(),  // Маршрут для экрана с картой
      },
    );
  }
}
