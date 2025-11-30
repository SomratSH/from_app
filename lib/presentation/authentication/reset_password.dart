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
                      "Reset Password",
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
                  Icons.lock_open,
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
                            "Verify & Reset",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.phone_android,
                                  size: 16,
                                  color: Colors.red.shade700,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.phone,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // OTP FIELD
                        _buildTextField(
                          label: "OTP Code",
                          controller: otpController,
                          icon: Icons.verified_user,
                          keyboardType: TextInputType.number,
                        ),

                        const SizedBox(height: 20),

                        // NEW PASSWORD FIELD
                        _buildTextField(
                          label: "New Password",
                          controller: passwordController,
                          icon: Icons.lock_open,
                          obscure: true,
                        ),

                        const SizedBox(height: 20),

                        // CONFIRM PASSWORD FIELD
                        _buildTextField(
                          label: "Confirm Password",
                          controller: confirmPasswordController,
                          icon: Icons.lock,
                          obscure: true,
                        ),

                        const SizedBox(height: 30),

                        // RESET BUTTON
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
                              final otp = otpController.text.trim();
                              final pass = passwordController.text.trim();
                              final confirm =
                                  confirmPasswordController.text.trim();

                              if (otp.isEmpty || pass.isEmpty || confirm.isEmpty) {
                                LoadingDialog.hide(context);
                                CustomSnackbar.show(
                                  context,
                                  message: "All fields are required",
                                  backgroundColor: Colors.red,
                                );
                                return;
                              }

                              if (pass != confirm) {
                                LoadingDialog.hide(context);
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
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()),
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
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

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
                                  "Enter the OTP sent to your phone and create a new password.",
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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: "Enter $label",
              hintStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: Icon(icon, color: Colors.red),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}