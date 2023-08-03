import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_just_for_you/widgets/background-image.dart';
import 'package:recipes_just_for_you/widgets/password-input.dart';
import 'package:recipes_just_for_you/widgets/rounded-button.dart';
import '../palatte.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/text-input.dart';
import '../widgets/square_tile.dart';
import 'auth_service.dart';
import 'widgets/confirm-password.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {


  void signUserUp() async {

    // Show loading indicator
    showDialog(context: context, builder: (context) => const CircularProgressIndicator());

    try {

      // Attempt signup with Firebase
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: confirmPasswordController.text
      );

      // Sign up succeeded
      Navigator.pop(context); // Dismiss loading indicator

    } on FirebaseAuthException catch (e) {

      // Sign up failed
      Navigator.pop(context);

      // Check for password mismatch error
      if (e.code == 'weak-password') {
        showErrorMessage('Passwords do not match');
        print(e);
        return;
      }

      // Handle other errors
      showErrorMessage(e.code);
    }

  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              )),
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          const BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      child: Center(
                        child: Text(
                          'PantryChef',
                          style: kHeading.copyWith(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextInput(
                                controller: emailController,
                                icon: FontAwesomeIcons.solidEnvelope,
                                hint: 'Email',
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                              ),
                              PasswordInput(
                                controller: passwordController,
                                icon: FontAwesomeIcons.lock,
                                hint: 'Password',
                                inputAction: TextInputAction.next,
                              ),
                              ConfirmPasswordInput(
                                controller: confirmPasswordController,
                                icon: FontAwesomeIcons.lock,
                                hint: 'Confirm Password',
                                inputAction: TextInputAction.done,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              MyButton(
                                text: "Sign Up",
                                onTap: signUserUp,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Or continue with',
                                        style:
                                            TextStyle(color: Colors.grey[700]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),

                              // google + apple sign in buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // google button
                                  Expanded(
                                      child: SquareTile(
                                          onTap: () => AuthService().signInWithGoogle(),
                                          imagePath:
                                              'assets/images/google.png')),

                                  SizedBox(width: 25),

                                  // apple button
                                  Expanded(
                                      child: SquareTile(
                                        onTap: (){},
                                          imagePath: 'assets/images/apple.png'))
                                ],
                              ),

                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: kBodyText,
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: widget.onTap,
                                    child: const Text('Login now',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
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
