import 'package:flutter/material.dart';
import 'package:siade2/src/features/login/pages/pages.dart';
import 'package:siade2/src/features/login/widgets/widgets.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
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
                        child: GradientButton(
                          text: 'Login',
                          isActive: true,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlineButton(
                          text: 'Sign up',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),

                  CustomTextField(
                    icon: Icons.email_outlined,
                    hint: 'E-mail ID',
                  ),
                  SizedBox(height: 18),

                  CustomTextField(
                    icon: Icons.lock_outline,
                    hint: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                              fillColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                              checkColor: Colors.blue,
                              side: BorderSide(color: Colors.blue, width: 1.5),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),

                  GradientButton(
                    text: 'Login',
                    isActive: true,
                    isFullWidth: true,
                    onTap: () {},
                  ),
                  SizedBox(height: 25),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white24,
                          indent: 20,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        'Or login with',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white24,
                          indent: 10,
                          endIndent: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),

                  OutlineButton(
                    text: 'Google',
                    icon: Icons.g_mobiledata,
                    onTap: () {},
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
