import 'package:flutter/material.dart';
import 'package:meals/components/meal_detail.dart';
import 'package:meals/models/meal.dart';

class MealDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: MealDetail(meal),
      ),
    );
  }
}