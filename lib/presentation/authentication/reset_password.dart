import 'package:flutter/material.dart';
import 'package:from_app/common/custom_laoding_dialog.dart';
import 'package:from_app/presentation/home/submit_page.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatefulWidget {
  final String phone;

  const ResetPasswordPage({super.key, required this.phone});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Reset Password",
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

            Text(
              "Enter OTP sent to ${widget.phone}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 20),

            // OTP FIELD
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
                prefixIcon: const Icon(Icons.verified),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NEW PASSWORD FIELD
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                prefixIcon: const Icon(Icons.lock_open),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CONFIRM PASSWORD FIELD
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

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
                  final otp = otpController.text.trim();
                  final pass = passwordController.text.trim();
                  final confirm = confirmPasswordController.text.trim();

                  if (otp.isEmpty || pass.isEmpty || confirm.isEmpty) {
                    CustomSnackbar.show(
                      context,
                      message: "All fields are required",
                      backgroundColor: Colors.red,
                    );
                    return;
                  }

                  if (pass != confirm) {
                    CustomSnackbar.show(
                      context,
                      message: "Passwords do not match",
                      backgroundColor: Colors.red,
                    );
                    return;
                  }

                  // CALL PROVIDER
                  final success = await provider.resetPassword(
                    phone: widget.phone,
                    otp: otp,
                    password: pass,
                  );

                  if (success) {
                    LoadingDialog.hide(context);
                    CustomSnackbar.show(
                      context,
                      message: "Password reset successful!",
                      backgroundColor: Colors.green,
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  } else {
                    LoadingDialog.hide(context);
                    CustomSnackbar.show(
                      context,
                      message: "Invalid OTP or failed. Try Again.",
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: const Text(
                  "Reset Password",
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
