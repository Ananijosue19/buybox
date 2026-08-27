import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shop/presentation/providers/shop_provider.dart';
import '../../home/presentation/widgets/home_view.dart';
import '../../../core/theme/app_colors.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> recentSearch = [
    'Oignons',
    'Champignons',
    'Pomme fraîche',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _buildRecentSearches(context);
    }
    return _buildSearchResults(context);
  }

  Widget _buildRecentSearches(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Searches', style: Theme.of(context).textTheme.titleMedium),
              TextButton(
                onPressed: () {},
                child: const Text('Clear All', style: TextStyle(color: AppColors.secondary)),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: recentSearch.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.history, color: AppColors.textHint),
                title: Text(recentSearch[index]),
                trailing: const Icon(Icons.close, size: 20),
                onTap: () {
                  query = recentSearch[index];
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    final shopProvider = context.read<ShopProvider>();
    final results = shopProvider.products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 80, color: AppColors.primaryContainer),
            const SizedBox(height: 16),
            Text('No results found for "$query"', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ProductCard(product: results[index]);
      },
    );
  }
}
