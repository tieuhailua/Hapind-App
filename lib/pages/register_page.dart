import 'package:flutter/material.dart';
import 'package:hapind/components/my_button.dart';
import 'package:hapind/components/my_text_field.dart';
import 'package:hapind/service/auth/auth_service.dart';
import 'package:provider/provider.dart';



class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //sign up
  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match!"),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    //logo
                    Icon(
                      Icons.message,
                      size: 100,
                      color: Colors.grey[800],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //create accounr
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    //email

                    MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false),

                    const SizedBox(
                      height: 10,
                    ),
                    //password textfield
                    MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true),

                    const SizedBox(
                      height: 25,
                    ),

                    //comfirm password
                    MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true),

                    const SizedBox(
                      height: 25,
                    ),

                    //signup button
                    MyButton(onTap: signUp, text: "Sign Up"),
                    const SizedBox(height: 50),
                    // not a member ? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already member?"),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Login Now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
