import 'package:flutter/material.dart';
import 'package:siade2/src/features/login/pages/pages.dart';
import 'package:siade2/src/features/login/widgets/widgets.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/logosiade.png',
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(
                        child: OutlineButton(
                          text: 'Login',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: GradientButton(
                          text: 'Sign up',
                          isActive: true,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),

                  CustomTextField(
                    icon: Icons.person_outline,
                    hint: 'Full Name',
                  ),
                  SizedBox(height: 18),

                  CustomTextField(icon: Icons.email_outlined, hint: 'Email-ID'),
                  SizedBox(height: 18),

                  CustomTextField(
                    icon: Icons.lock_outline,
                    hint: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 18),

                  CustomTextField(
                    icon: Icons.phone_outlined,
                    hint: 'Phone No.',
                  ),
                  SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0xff2563EB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
