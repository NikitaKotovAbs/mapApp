import 'package:flutter/material.dart';
import 'object_detail_screen.dart';

class MapScreen extends StatelessWidget {
  // Список объектов на карте с их координатами, названиями, описаниями и дополнительной информацией
  final List<Map<String, dynamic>> _objects = [
    {'name': 'Object 1', 'description': 'Description 1', 'info': 'Info about Object 1', 'top': 120.0, 'left': 100.0},
    {'name': 'Object 2', 'description': 'Description 2', 'info': 'Info about Object 2', 'top': 200.0, 'left': 200.0},
    {'name': 'Object 3', 'description': 'Description 3', 'info': 'Info about Object 3', 'top': 350.0, 'left': 50.0},
    {'name': 'Object 4', 'description': 'Description 4', 'info': 'Info about Object 4', 'top': 280.0, 'left': 110.0},
  ];

  // Начальная точка на карте
  final Map<String, double> _initialPoint = {'top': 50.0, 'left': 50.0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Карта'),  // Заголовок AppBar
      ),
      body: Stack(
        children: [
          // Статическая карта на весь экран
          Positioned.fill(
            child: Image.asset('assets/map.png', fit: BoxFit.cover),  // Отображение карты в фоновом режиме
          ),
          // Начальная точка на карте
          Positioned(
            top: _initialPoint['top']!,  // Координата по вертикали
            left: _initialPoint['left']!,  // Координата по горизонтали
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.red,  // Цвет начальной точки
              child: Text(
                'Start',  // Надпись на начальной точке
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Объекты на карте
          ..._objects.map((obj) {
            return Positioned(
              top: obj['top'],  // Координата по вертикали
              left: obj['left'],  // Координата по горизонтали
              child: GestureDetector(
                onTap: () {
                  // Переход на экран с подробной информацией об объекте
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ObjectDetailScreen(
                        name: obj['name']!,  // Название объекта
                        description: obj['description']!,  // Описание объекта
                        info: obj['info']!,  // Дополнительная информация об объекте
                        startPoint: _initialPoint,  // Начальная точка маршрута
                        endPoint: obj,  // Конечная точка маршрута (объект)
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.blue,  // Цвет объектов на карте
                  child: Text(
                    obj['name']!,  // Название объекта
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
