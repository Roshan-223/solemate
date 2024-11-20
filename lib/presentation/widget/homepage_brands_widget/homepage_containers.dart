import 'package:flutter/material.dart';
import 'package:solemate/presentation/screens/utils/colors.dart';

class BrandContainer extends StatelessWidget {
  final String label;
  final String? imageUrl;
  final bool showImage;
  final bool isSelected;
  final VoidCallback onTap;

  const BrandContainer({
    super.key,
    required this.label,
    this.imageUrl,
    this.showImage = false,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        width: 60,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : kwhite,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Conditionally display the brand image if showImage is true
            if (showImage && imageUrl != null)
              Image.asset(
                imageUrl!,
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
            if (showImage && imageUrl != null) const SizedBox(height: 5),

            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
