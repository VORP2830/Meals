import 'package:flutter/material.dart';
import 'package:meals/pages/categories_meals_page.dart';
import 'package:meals/utils/app_routes.dart';
import 'pages/categories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //Aqui ficam as rotas da aplicação
      routes: {
        AppRoutes.HOME: (_) => const CategoriesPage(),
        AppRoutes.CATEGORY_MEALS: (_) => CategoriesMealsPage(),
      },
    );
  }
}
