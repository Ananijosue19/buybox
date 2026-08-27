import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/auth/presentation/sign_in_screen.dart';
import 'features/category/presentation/category_index_screen.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/search/presentation/search_choice_screen.dart';
import 'features/shop/data/repositories/mock_category_repository.dart';
import 'features/shop/data/repositories/mock_product_repository.dart';
import 'features/shop/presentation/providers/cart_provider.dart';
import 'features/shop/presentation/providers/shop_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(
          create: (_) => ShopProvider(
            productRepository: MockProductRepository(),
            categoryRepository: MockCategoryRepository(),
          )..loadShopData(),
        ),
      ],
      child: MaterialApp(
        title: 'BuyBox',
        theme: AppTheme.lightTheme,
        routes: {
          '/signIn': (context) => const SignInScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/category_index': (context) => const CategoryIndexScreen(),
          '/search_choice': (context) => const SearchChoiceScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
      ),
    );
  }
}
