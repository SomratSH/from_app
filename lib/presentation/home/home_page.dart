import 'package:flutter/material.dart';
import 'package:from_app/common/custom_logout_dialog.dart';
import 'package:from_app/presentation/home/form_page.dart';
import 'package:from_app/provider/auth_provider.dart';
import 'package:from_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1976FF),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              showLogoutDialog(context);
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Dashboard cards
            homeProvider.isLoading
                ? CircularProgressIndicator()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCountCard(
                        'Total',
                        homeProvider.total,
                        Colors.orange,
                      ),
                      _buildCountCard(
                        'Pending',
                        homeProvider.pending,
                        Colors.redAccent,
                      ),
                      _buildCountCard(
                        'Approved',
                        homeProvider.approved,
                        Colors.green,
                      ),
                    ],
                  ),
            const SizedBox(height: 40),
            // Buttons
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to new form
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => InformationFormScreen()),
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'New Form',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xFF1976FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ElevatedButton.icon(
            //   onPressed: () {
            //     // Navigate to forms list
            //   },
            //   icon: const Icon(Icons.list, color: Colors.white),
            //   label: const Text(
            //     'View Forms',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(double.infinity, 50),
            //     backgroundColor: const Color(0xFF1976FF),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountCard(String title, int count, Color color) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
