import 'package:flutter/material.dart';
import 'route_map_screen.dart';

class ObjectDetailScreen extends StatelessWidget {
  // Параметры экрана с деталями об объекте
  final String name; // Название объекта
  final String description; // Описание объекта
  final String info; // Дополнительная информация об объекте
  final Map<String, double> startPoint; // Начальная точка для маршрута
  final Map<String, dynamic> endPoint; // Конечная точка для маршрута

  // Конструктор класса с обязательными параметрами
  ObjectDetailScreen({
    required this.name,
    required this.description,
    required this.info,
    required this.startPoint,
    required this.endPoint,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name), // Заголовок AppBar, отображающий название объекта
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Отступы вокруг содержимого
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description, // Отображение описания объекта
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20), // Отступ между элементами
            Text(
              info, // Отображение дополнительной информации об объекте
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // Отступ между элементами
            ElevatedButton(
              onPressed: () {
                // Переход на экран с картой маршрута
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RouteMapScreen(
                      startPoint: startPoint, // Начальная точка маршрута
                      endPoint: endPoint, // Конечная точка маршрута
                    ),
                  ),
                );
              },
              child: Text('Задать маршрут'), // Текст на кнопке
            ),
          ],
        ),
      ),
    );
  }
}
