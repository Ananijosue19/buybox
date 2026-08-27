import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../search/presentation/custom_search_delegate.dart';
import '../../shop/presentation/providers/shop_provider.dart';
import '../../home/presentation/widgets/home_view.dart';
import '../../../core/theme/app_colors.dart';

class CategoryIndexScreen extends StatelessWidget {
  const CategoryIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () async {
                await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Consumer<ShopProvider>(
        builder: (context, shopProvider, _) {
          if (shopProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                sliver: SliverToBoxAdapter(child: _buildPromoCarousel()),
              ),
              const SliverToBoxAdapter(
                child: Divider(
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = shopProvider.products[index];
                      return ProductCard(product: product);
                    },
                    childCount: shopProvider.products.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 50)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPromoCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
        aspectRatio: 2.2,
      ),
      items: [
        _buildPromoCard('Fresh Organic\nVegetables', '30% OFF', AppColors.primary),
        _buildPromoCard('Healthy Summer\nFruits', '20% OFF', AppColors.secondary),
      ],
    );
  }

  Widget _buildPromoCard(String title, String discount, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  discount,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 60),
        ],
      ),
    );
  }
}
