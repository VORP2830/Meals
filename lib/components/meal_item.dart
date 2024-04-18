import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      //O primeiro argumento é o nome da rota
      '/meal-detail',
      //O segundo argumento é o argumento que será passado para a tela
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //O stack permite que um widget fique sobre o outro
            Stack(
              children: <Widget>[
                //O ClipRRect é um widget que permite arredondar as bordas de um widget
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    //Aqui estamos arredondando apenas as bordas superiores
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //A imge.network é um widget que carrega uma imagem da internet
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                //O position permite posicionar um widget em um local específico
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      //O softwrap é um recurso que permite
                      //que o texto quebre de linha caso necessario
                      softWrap: true,
                      //O overflow é um recurso que permite que o texto
                      //seja cortado caso não caiba no espaço disponível
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            //O padding é um widget que permite adicionar espaçamento
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                //O mainAxisAlignment é um recurso que permite alinhar os widgets horizontalmente
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      //O sizedbox é um widget que permite adicionar espaçamento
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.complexityText}')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.costText}')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
