import 'package:flutter/material.dart';
import 'package:meals/pages/categories_meals_page.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    //O Navigator é um objeto que permite a navegação entre as telas
    //O método pushNamed é o método que permite a navegação para uma tela específica
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return CategoriesMealsPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    //O inkwell é um widget que permite a aplicação de um efeito visual ao ser clicado
    return InkWell(
      //O onTap é a funcao que é chamada ao ser clicado
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        //O boxdecoration é um objeto que permite a estilização de um container
        decoration: BoxDecoration(
          //O borderRadius é um objeto que permite o aredondamento das bordas de um container
          borderRadius: BorderRadius.circular(15),
          //O gradient é um objeto que permite a aplicação de um gradiente a um container
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
