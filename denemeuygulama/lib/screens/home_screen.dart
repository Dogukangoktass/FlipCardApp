import 'package:denemeuygulama/screens/words_screen.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';
import 'learn_screen.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.userId});
  final int userId;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: _buildScreen(_selectedIndex, widget.userId),
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.red,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined,color: Colors.red),
            label: 'Favorite' ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_outlined,color: Colors.red),
            label: 'Learn' ,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined, color: Colors.red),
            label: 'Category',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildScreen(int index, int userId) {
  switch (index) {
    case 0:
      return WordView(userId: userId);
    case 1:
      return FavoritesView(userId: userId);
    case 2:
      return LearnView(userId: userId);
    case 3:
      return CategoriesView();
    default:
      return WordView(userId: userId);
  }
}
