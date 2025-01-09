import 'package:flutter/material.dart';
import 'package:coffe_app/homepage/HomePage.dart';
import '../cartpage/cart_page.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0; // pagina selecionada

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Evita recriar a mesma página
    setState(() {
      _selectedIndex = index;
    });

    // Navega para a página correspondente
    if (index == 0) {
      // Navegar para a Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      ).then((_) {
        // Garante que a Home seja selecionada quando voltar
        setState(() {
          _selectedIndex = 0;
        });
      });
    } else if (index == 1) {
      // Navegar para a página do carrinho
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CartPage()),
      ).then((_) {
        // Restaura o índice da Home quando voltar
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(34, 21, 31, 100),
      currentIndex: _selectedIndex, // Define o ícone selecionado
      onTap: _onItemTapped, // Chamado ao clicar em um ícone
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            size: 40,
          ),
          label: '',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 239, 227, 200),
      unselectedItemColor: const Color.fromARGB(206, 150, 147, 130),
    );
  }
}
