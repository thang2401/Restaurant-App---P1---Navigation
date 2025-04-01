import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleSignIn(BuildContext context) {
    if (idController.text == "user" && passwordController.text == "123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid credentials")));
    }
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final TextEditingController newPassController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Reset Password"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newPassController,
                  decoration: InputDecoration(labelText: "New Password"),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: confirmPassController,
                  decoration: InputDecoration(labelText: "Confirm Password"),
                  obscureText: true,
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text("Submit", style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Password reset submitted")),
                  );
                },
              ),
            ],
          ),
    );
  }

  Widget _buildSocialButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Không có background location, nền trắng theo theme
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Center(
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: "User ID"),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 14),
                  ),
                  onPressed: () => _showForgotPasswordDialog(context),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Sign In", style: TextStyle(fontSize: 18)),
                onPressed: () => _handleSignIn(context),
              ),
              SizedBox(height: 16),
              Center(
                child: Text("Or sign in with", style: TextStyle(fontSize: 14)),
              ),
              SizedBox(height: 16),
              _buildSocialButton(
                label: "Google",
                icon: Icons.g_mobiledata,
                color: Colors.red,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Google Sign In not implemented")),
                  );
                },
              ),
              SizedBox(height: 12),
              _buildSocialButton(
                label: "Facebook",
                icon: Icons.facebook,
                color: Colors.blueAccent,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Facebook Sign In not implemented")),
                  );
                },
              ),
              SizedBox(height: 24),
              Center(
                child: TextButton(
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sign Up not implemented")),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
