import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Руководство'),
          backgroundColor: const Color(0xFF222222),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: ListView(
              children: const [
                ManualItemWidget(
                  manualTitle: 'Вход',
                  manualBody:
                      '\nДля того, чтобы получить доступ к администрированию меню, необходимо открыть боковую панель, далее найти строку "Версия: [версия] Бета" быстро нажать по этому полю 10 раз.\n\nПосле этого, вы перейдете на страницу аторизации, где необходимо ввести логин и пароль, которые вы получили при покупке программы.',
                ),
                ManualItemWidget(
                  manualTitle: 'Создание категории',
                  manualBody:
                      '\nПосле получения доступа к экрану администратора, можно начать создание меню с категорий. Для создания категории необходимо нажать на значок плюса, находящегося под полем для поиска.\nПосле нажатия на значок появится новая категория с названием "Новая категоия" нажмите на нее, чтобы изменить название.',
                ),
                ManualItemWidget(
                  manualTitle: 'Создание блюда',
                  manualBody:
                      '\nПод списком категорий находится еще один значок плюса, нажав на который в списке блюд появится новое пустое блюдо. Нажимая на его компоненты из можно изменять. Наример, нажмите на цену блюда для ее изменения.',
                ),
                ManualItemWidget(
                  manualTitle: 'Привязать блюдо к категории',
                  manualBody:
                      '\nЧтобы разграничить блюда между собой, их необходимо добавить в разные категории. Например, суши, напитки и т.д.\nНа экране администратора в нижнем правом углу блюда появлятся 3 точки, нажмите на них, чтобы открыть специальное меню, среди котого есть пункт "Выбрать категорию"\nНажмите на него и введите название категории. Готово. Теперь пользователю будет удобнее просматривать меню.',
                ),
                ManualItemWidget(
                  manualTitle: 'Удалить блюдо',
                  manualBody:
                      '\nДля удаления блюда нажмине три точки в правом нижнем углу блюда. После открытия меню, выберите пункт "Удаление блюда"',
                ),
                ManualItemWidget(
                  manualTitle: 'Вставить изображение',
                  manualBody:
                      '\nФункция временно недоступна, доступ к ней будет ограничен до следущего обновления.',
                ),
                ManualItemWidget(
                  manualTitle: 'Сортировка',
                  manualBody:
                      '\nФункция сортировки нужна для более эффективного изучения меню. Рассмотрим виды сортировок в приложении:\nНе сортировать - сортирует блюдо по категориям.\nПо цене - сортирует блюда по цене (по возрастанию)\nПо весу - сортирует блюда по весу (по возрастанию)\nПо калорийности - сортирует блюда по калорийности (по возрастанию)',
                ),
              ],
            ),
          ),
        ));
  }
}

class ManualItemWidget extends StatelessWidget {
  final manualTitle;
  final manualBody;

  const ManualItemWidget({
    super.key,
    required this.manualTitle,
    required this.manualBody,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            manualTitle,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          manualBody,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
