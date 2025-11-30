import 'package:flutter/material.dart';
import 'package:from_app/common/custom_laoding_dialog.dart';
import 'package:from_app/presentation/authentication/login_page.dart';
import 'package:from_app/presentation/home/submit_page.dart';
import 'package:from_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
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
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Signup Card
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
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          const Center(
                            child: Text(
                              "Submit your form correctly",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Center(
                            child: Text(
                              "Create your account to get started",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          _textField(
                            label: "Full Name",
                            icon: Icons.person,
                            controller: provider.name,
                            validator: (v) => v!.isEmpty ? "Enter Name" : null,
                          ),

                          const SizedBox(height: 20),

                          _textField(
                            label: "Email",
                            icon: Icons.email,
                            controller: provider.email,
                            validator: (v) => v!.isEmpty || !v.contains("@")
                                ? "Enter valid email"
                                : null,
                          ),

                          const SizedBox(height: 20),

                          _textField(
                            label: "Phone",
                            icon: Icons.phone,
                            controller: provider.phone,
                            keyboard: TextInputType.phone,
                            validator: (v) => v!.isEmpty || v.length < 10
                                ? "Enter valid phone"
                                : null,
                          ),

                          const SizedBox(height: 20),

                          _textField(
                            label: "Password",
                            icon: Icons.lock,
                            controller: provider.password,
                            obscure: true,
                            validator: (v) => v!.length < 6
                                ? "Password must be 6+ chars"
                                : null,
                          ),

                          const SizedBox(height: 20),

                          _genderSelector(provider),

                          const SizedBox(height: 30),

                          _signupButton(context, provider),

                          const SizedBox(height: 20),

                          // Login Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
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

  // ----------------------- WIDGETS -----------------------

  Widget _textField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboard = TextInputType.text,
    bool obscure = false,
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
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscure,
            keyboardType: keyboard,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.red),
              hintText: "Enter $label",
              hintStyle: TextStyle(color: Colors.grey.shade400),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _genderSelector(AuthProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: "Male",
                      groupValue: provider.gender,
                      onChanged: provider.setGender,
                      activeColor: Colors.red,
                    ),
                    const Text(
                      "Male",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: "Female",
                      groupValue: provider.gender,
                      onChanged: provider.setGender,
                      activeColor: Colors.red,
                    ),
                    const Text(
                      "Female",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _signupButton(BuildContext context, AuthProvider provider) {
    return Container(
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
        onPressed: provider.isLoading
            ? null
            : () async {
                LoadingDialog.show(context);
                final result = await provider.registerUser();

                if (result["success"]) {
                  LoadingDialog.hide(context);
                  CustomSnackbar.show(
                    context,
                    message: "Registration Successful",
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                } else {
                  LoadingDialog.hide(context);
                  CustomSnackbar.show(
                    context,
                    message: result["message"],
                    backgroundColor: Colors.red,
                  );
                }
              },
        child: provider.isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}