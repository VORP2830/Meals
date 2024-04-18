import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/pages/categories_page.dart';

import 'favorite_page.dart';

class TabsPage extends StatefulWidget {
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedPageIndex = 0;
  final List<Map<String, Object>> _pages = [
    {'page': const CategoriesPage(), 'title': 'Lista de categorias'},
    {'page': const FavoritePage(), 'title': 'Meus favoritos'},
  ];
  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      //Adiciona um menu lateral no appbar
      drawer: MainDrower(),
      //Quando o usuário clicar em uma aba, o valor da variável _selectedPageIndex
      //será alterado e o corpo da página será atualizado
      body: _pages[_selectedPageIndex]['page'] as Widget,
      //Adiciona a barra de abas na parte inferior do appbar
      bottomNavigationBar: BottomNavigationBar(
        //Quando o usuário clicar em uma aba, o método _selectPage será chamado
        onTap: _selectPage,
        //O tipo de barra de abas que será exibida (shifting ou fixed)
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        //A cor do ícone da aba selecionada
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        //A cor do ícone das abas não selecionadas
        unselectedItemColor: Colors.white,
        //O índice da aba selecionada
        currentIndex: _selectedPageIndex,
        //Adiciona a barra de abas na parte inferior do appbar
        items: const [
          //Botões de navegação
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
