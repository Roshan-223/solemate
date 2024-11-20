import 'package:flutter/material.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';

class BrandScreen extends StatelessWidget {
  final String brandName;

  const BrandScreen({super.key, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(brandName),
          bottom: const TabBar(
            indicatorColor: myColor,
            labelColor: myColor,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Sports'),
              Tab(text: 'Casuals'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildPlaceholderGrid('All'),
            _buildPlaceholderGrid('Sports'),
            _buildPlaceholderGrid('Casuals'),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderGrid(String category) {
    final items = List.generate(
      10,
      (index) => 'Product ${index + 1} in $category',
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[300],
            ),
            child: Center(
              child: Text(
                items[index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
