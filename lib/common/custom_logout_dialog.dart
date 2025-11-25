import 'package:flutter/material.dart';
import 'package:from_app/presentation/authentication/login_page.dart';
import 'package:from_app/presentation/home/submit_page.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';

void showLogoutDialog(BuildContext context) {
  final provider = context.read<AuthProvider>();

  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.white,
      title: const Text("Confirm Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop(); // close dialog
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // correct way to set color
          ),
          onPressed: () async {
            Navigator.of(ctx).pop(); // close dialog first
            final success = await provider.logout();
            if (success) {
              // Navigate to login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );

              // Show success snackbar
              CustomSnackbar.show(context, message: "Logout successful");
            } else {
              CustomSnackbar.show(
                context,
                message: "Logout failed",
                backgroundColor: Colors.red,
              );
            }
          },
          child: const Text("Logout", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}
