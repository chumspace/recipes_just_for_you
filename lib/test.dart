import 'package:flutter/material.dart';
import 'package:recipes_just_for_you/widgets/background-image.dart';
import 'package:recipes_just_for_you/widgets/password-input.dart';
import 'package:recipes_just_for_you/widgets/rounded-button.dart';
import 'palatte.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/text-input.dart';

final usernameController = TextEditingController();
final passwordController = TextEditingController();

class BackgroundPage extends StatelessWidget {
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
                    Container(
                      height: 150,
                      child: Center(
                        child: Text(
                          'PantryChef',
                          style: kHeading.copyWith(color: Colors.greenAccent),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Column(
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
                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                                height: 100,
                              ),
                              RoundedButton(
                                buttonText: 'Login',
                              ),
                              SizedBox(
                                height: 80,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.white, width: 1),
                                  ),
                                ),
                                child: Text(
                                  'CreateNewAccount',
                                  style: kBodyText,
                                ),
                              ),
                              SizedBox(
                                height: 30,
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
