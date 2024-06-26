import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/pages/categories_meals_page.dart';
import 'package:meals/pages/settings_page.dart';
import 'package:meals/pages/tabs_page.dart';
import 'package:meals/utils/app_routes.dart';
import 'models/meal.dart';
import 'pages/categories_page.dart';
import 'pages/meal_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        AppRoutes.HOME: (_) => TabsPage(_favoriteMeals),
        AppRoutes.CATEGORY_MEALS: (_) => CategoriesMealsPage(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) =>
            MealDetailPage(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (_) => SettingsPage(settings, _filterMeals),
      },
      //Caso não exista uma rota nomeada ou uma rota desconhecida
      //o flutter irá redirecionar para a rota home
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const CategoriesPage();
          },
        );
      },
    );
  }
}
