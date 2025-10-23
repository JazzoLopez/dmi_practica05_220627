import 'package:flutter/material.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  const CustomBottomNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.secondary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_outline),
          label: 'Favoritos'
        ),
      ],
    );
  }
}