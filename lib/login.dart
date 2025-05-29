import 'package:flutter/material.dart';
import 'validate.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.redAccent,     //profile Bar color
            child: Center(
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Text('Welcome', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Sign in to continue.', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(height: 32),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                      validator: (value) => validateEmail(value!) ? null : 'Please enter a valid email',
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                      validator: (value) => validatePassword(value!) ? null : 'Please enter a valid password',
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password ?", style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process login
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 16)),
                      
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 4),
                            Text("Sign Up", style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
