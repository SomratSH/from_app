import 'package:flutter/material.dart';
import 'package:from_app/common/custom_laoding_dialog.dart';
import 'package:from_app/presentation/authentication/reset_password.dart';
import 'package:from_app/presentation/home/submit_page.dart';
import 'package:from_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1976FF),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Enter your phone number to receive an OTP.",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 40),

            // PHONE NUMBER
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // SEND OTP BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  LoadingDialog.show(context);
                  final phone = phoneController.text.trim();

                  if (phone.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter phone number"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // CALL PROVIDER API:
                  bool success = await authProvider.sendOtp(phone);

                  if (success) {
                    LoadingDialog.hide(context);
                    CustomSnackbar.show(context, message: "OTP sent to $phone");

                    // TODO: Navigate to OTP Verification Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResetPasswordPage(phone: phone),
                      ),
                    );
                  } else {
                    LoadingDialog.hide(context);
                    CustomSnackbar.show(
                      context,
                      message: "Failed to send OTP, try again",
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: const Text(
                  "Send OTP",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
