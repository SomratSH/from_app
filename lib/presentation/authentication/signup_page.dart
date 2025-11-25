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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create Account"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: provider.formKey,
          child: Column(
            children: [
              _textField(
                label: "Full Name",
                controller: provider.name,
                validator: (v) => v!.isEmpty ? "Enter Name" : null,
              ),

              SizedBox(height: 16),

              _textField(
                label: "Email",
                controller: provider.email,
                validator: (v) =>
                    v!.isEmpty || !v.contains("@") ? "Enter valid email" : null,
              ),

              SizedBox(height: 16),

              _textField(
                label: "Phone",
                controller: provider.phone,
                keyboard: TextInputType.phone,
                validator: (v) =>
                    v!.isEmpty || v.length < 10 ? "Enter valid phone" : null,
              ),

              SizedBox(height: 16),

              _textField(
                label: "Password",
                controller: provider.password,
                obscure: true,
                validator: (v) =>
                    v!.length < 6 ? "Password must be 6+ chars" : null,
              ),

              SizedBox(height: 16),

              _genderSelector(provider),

              SizedBox(height: 30),

              _signupButton(context, provider),
            ],
          ),
        ),
      ),
    );
  }

  // ----------------------- WIDGETS -----------------------

  Widget _textField({
    required String label,
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
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscure,
          keyboardType: keyboard,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter $label",
          ),
        ),
      ],
    );
  }

  Widget _genderSelector(AuthProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Radio(
              value: "Male",
              groupValue: provider.gender,
              onChanged: provider.setGender,
            ),
            Text("Male"),
            Radio(
              value: "Female",
              groupValue: provider.gender,
              onChanged: provider.setGender,
            ),
            Text("Female"),
          ],
        ),
      ],
    );
  }

  Widget _signupButton(BuildContext context, AuthProvider provider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
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
        child: Text(
          "Sign Up",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(14),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
