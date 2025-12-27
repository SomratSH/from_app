import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildShimmerCard()),
        SizedBox(width: 10),
        Expanded(child: _buildShimmerCard()),
        SizedBox(width: 10),
        Expanded(child: _buildShimmerCard()),
      ],
    );
  }

  Widget _buildShimmerCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon Placeholder
            Container(width: 30, height: 30, color: Colors.white),
            SizedBox(height: 12),
            // "Title" Placeholder
            Container(width: 50, height: 12, color: Colors.white),
            SizedBox(height: 12),
            // "Number" Placeholder
            Container(width: 40, height: 24, color: Colors.white),
          ],
        ),
      ),
    );
  }
}