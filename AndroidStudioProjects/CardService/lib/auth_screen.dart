import 'package:flutter/material.dart';
import 'routes.dart';

class AuthScreen extends StatelessWidget {
  // Контроллер для текстового поля ввода кода
  final TextEditingController _controller = TextEditingController();

  // Список валидных кодов
  final List<String> _validCodes = ['1234', '5678', '9012'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация'),  // Заголовок AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),  // Отступы вокруг содержимого
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,  // Контроллер текстового поля
                decoration: InputDecoration(
                  labelText: 'Введите код',  // Метка внутри текстового поля
                ),
              ),
              SizedBox(height: 20),  // Отступ между текстовым полем и кнопкой
              ElevatedButton(
                onPressed: () {
                  // Проверка введенного кода
                  if (_validCodes.contains(_controller.text)) {
                    // Если код валидный, переход на экран с картой
                    Navigator.pushReplacementNamed(context, Routes.mapScreen);
                  } else {
                    // Если код не валидный, показ окна с ошибкой
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Ошибка'),
                        content: Text('Неверный код!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();  // Закрытие окна ошибки
                            },
                            child: Text('ОК'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Войти'),  // Текст на кнопке
              ),
            ],
          ),
        ),
      ),
    );
  }
}
