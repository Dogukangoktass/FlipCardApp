import 'package:denemeuygulama/screens/home_screen.dart';
import 'package:denemeuygulama/screens/login_screen.dart';
import 'package:denemeuygulama/screens/words_screen.dart';
import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/learn_screen.dart';
import '../screens/profile_screen.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    super.key, required this.userId,
  });
  final int userId;
  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.white70.withOpacity(0.5),
      child: ListView(
        children: [
          SizedBox(
            height: 60,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Text('Flip Card App', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ),
          ListTile(
            leading: Icon( Icons.my_library_books_sharp),
            title: const Text('Kelimeler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WordView(userId: userId)),
              );

            },
          ),
          ListTile(
            leading: Icon( Icons.category_outlined),
            title: const Text('Kategoriler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesView(userId: userId)),
              );
            },
          ),
          ListTile(
            leading: Icon( Icons.favorite_border_outlined),
            title: const Text('Favoriler'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesView(userId: userId)),
              );
            },
          ),

          ListTile(
            leading: Icon( Icons.menu_book_sharp),
            title: const Text('Öğreneceklerim'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LearnView(userId: userId)),
              );
            },
          ),
          ListTile(
            leading: Icon( Icons.account_circle_outlined),
            title: const Text('Hesap'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileView(userId: userId)),
              );
            },
          ),
          ListTile(
            leading: Icon( Icons.logout),
            title: const Text('Çıkış Yap'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
          ),

        ],
      ),
    );
  }
}
