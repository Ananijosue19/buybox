import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'widgets/card_view.dart';
import 'widgets/exchange_view.dart';
import 'widgets/home_view.dart';
import 'widgets/like_view.dart';
import 'widgets/user_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  void itemTap(int index) {
    setState(() => selectedIndex = index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() => selectedIndex = index);
        },
        children: const [
          HomeView(),
          ExchangeView(),
          CardView(),
          LikeView(),
          UserView(),
        ],
      ),
      bottomNavigationBar: _buildFloatingNavBar(),
    );
  }

  Widget _buildFloatingNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(0, Icons.home_rounded),
          _navItem(1, Icons.category_rounded),
          _navItem(2, Icons.shopping_cart_rounded, isCenter: true),
          _navItem(3, Icons.favorite_rounded),
          _navItem(4, Icons.person_rounded),
        ],
      ),
    );
  }

  Widget _navItem(int index, IconData icon, {bool isCenter = false}) {
    bool isSelected = selectedIndex == index;
    
    if (isCenter) {
      return GestureDetector(
        onTap: () => itemTap(index),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Icon(Icons.shopping_cart_rounded, color: Colors.white),
        ),
      );
    }

    return IconButton(
      onPressed: () => itemTap(index),
      icon: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
        size: isSelected ? 28 : 24,
      ),
    );
  }
}
