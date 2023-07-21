import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_just_for_you/widgets/background-image.dart';
import 'package:recipes_just_for_you/widgets/password-input.dart';
import 'package:recipes_just_for_you/widgets/rounded-button.dart';
import '../palatte.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/text-input.dart';
import '../widgets/square_tile.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  //sign user in method
  void signUserin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop up the loading circle
      Navigator.pop(context);
    //show error message
      showErrorMessage(e.code);
    }
  }

  //wrong email message popup
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
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
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
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextInput(
                                icon: FontAwesomeIcons.solidEnvelope,
                                hint: 'Email',
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                              ),
                              PasswordInput(
                                icon: FontAwesomeIcons.lock,
                                hint: 'Password',
                                inputAction: TextInputAction.done,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Forgot Password?',
                                      style: kBodyText,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              MyButton(
                                onTap: signUserin,
                              ),
                              SizedBox(
                                height: 35,
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

                              const SizedBox(height: 30),

                              // google + apple sign in buttons
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // google button
                                  Expanded(
                                      child: SquareTile(
                                          imagePath:
                                              'assets/images/google.png')),

                                  SizedBox(width: 25),

                                  // apple button
                                  Expanded(
                                      child: SquareTile(
                                          imagePath: 'assets/images/apple.png'))
                                ],
                              ),

                              const SizedBox(height: 50),

                              // not a member? register now
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Not a member?',
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: widget.onTap,
                                    child: const Text(
                                      'Register now',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
