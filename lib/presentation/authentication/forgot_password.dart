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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red.shade400,
              Colors.red.shade600,
              Colors.red.shade800,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Icon Container
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_reset,
                  size: 80,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Content Card
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        const Center(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Center(
                          child: Text(
                            "Enter your phone number to receive an OTP.",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Label
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // PHONE NUMBER FIELD
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter your phone number',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              prefixIcon: const Icon(Icons.phone, color: Colors.red),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(16),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // SEND OTP BUTTON
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.red.shade600,
                                Colors.red.shade800,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.4),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              LoadingDialog.show(context);
                              final phone = phoneController.text.trim();

                              if (phone.isEmpty) {
                                LoadingDialog.hide(context);
                                CustomSnackbar.show(
                                  context,
                                  message: "Please enter phone number",
                                  backgroundColor: Colors.red,
                                );
                                return;
                              }

                              // CALL PROVIDER API:
                              bool success = await authProvider.sendOtp(phone);

                              if (success) {
                                LoadingDialog.hide(context);
                                CustomSnackbar.show(context, message: "OTP sent to $phone");

                                // Navigate to OTP Verification Page
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
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Info Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.red.shade200,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.red.shade700,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  "You will receive a verification code on your phone number.",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}