import 'package:flutter/material.dart';

class RouteMapScreen extends StatelessWidget {
  // Начальная точка маршрута
  final Map<String, double> startPoint;
  // Конечная точка маршрута
  final Map<String, dynamic> endPoint;

  // Конструктор класса с обязательными параметрами
  RouteMapScreen({required this.startPoint, required this.endPoint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Маршрут'),  // Заголовок AppBar
      ),
      body: Stack(
        children: [
          // Статическая карта на весь экран
          Positioned.fill(
            child: Image.asset('assets/map.png', fit: BoxFit.cover),  // Отображение карты на весь экран
          ),
          // Начальная точка на карте
          Positioned(
            top: startPoint['top']!,  // Координата по вертикали начальной точки
            left: startPoint['left']!,  // Координата по горизонтали начальной точки
            child: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(8),
              color: Colors.red,  // Цвет начальной точки
              child: Center(
                child: Text(
                  'Start',  // Надпись на начальной точке
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Конечная точка на карте
          Positioned(
            top: endPoint['top'],  // Координата по вертикали конечной точки
            left: endPoint['left'],  // Координата по горизонтали конечной точки
            child: Container(
              width: 100,  // Увеличенный размер блока
              height: 50,  // Увеличенный размер блока
              padding: EdgeInsets.all(8),
              color: Colors.blue,  // Цвет конечной точки
              child: Center(
                child: Text(
                  endPoint['name']!,  // Надпись на конечной точке
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Линия маршрута
          CustomPaint(
            size: Size.infinite,
            painter: RoutePainter(
              startX: startPoint['left']! + 25,  // Смещение по горизонтали от центра начального блока
              startY: startPoint['top']! + 25,   // Смещение по вертикали от центра начального блока
              endX: endPoint['left'] + 50,       // Смещение по горизонтали от центра конечного блока (учитывая увеличенный размер)
              endY: endPoint['top'] + 25,        // Смещение по вертикали от центра конечного блока
              boxSize: 50,                       // Размер бокса
            ),
          ),
        ],
      ),
    );
  }
}

class RoutePainter extends CustomPainter {
  final double startX;
  final double startY;
  final double endX;
  final double endY;
  final double boxSize;

  // Конструктор класса с обязательными параметрами для рисования маршрута
  RoutePainter({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
    required this.boxSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green  // Цвет линии маршрута
      ..strokeWidth = 4.0     // Толщина линии маршрута
      ..style = PaintingStyle.stroke;  // Стиль рисования линии

    // Начальные и конечные точки с учетом смещения
    double adjustedStartX = startX + (startX < endX ? boxSize / 2 : -boxSize / 2);
    double adjustedStartY = startY + (startY < endY ? boxSize / 2 : -boxSize / 2);
    double adjustedEndX = endX + (endX < startX ? boxSize / 2 : -boxSize / 2);
    double adjustedEndY = endY + (endY < startY ? boxSize / 2 : -boxSize / 2);

    // Рисуем маршрут
    final path = Path()
      ..moveTo(adjustedStartX, adjustedStartY)  // Начало маршрута
      ..lineTo(adjustedEndX, adjustedEndY);     // Конец маршрута
    canvas.drawPath(path, paint);  // Отображение маршрута на холсте
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;  // Перерисовка не требуется
  }
}
