import 'package:flutter/material.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/features/login/pages/pages.dart';
import 'package:siade2/src/features/login/widgets/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:siade2/src/providers/providers.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    final success = await context.read<UserProvider>().login(email, password);

    if (mounted) {
      // Pour le développement, on accède à l'app même si l'API échoue
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AppLayout(),
        ),
      );
      
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Note: Entré en mode bypass (${context.read<UserProvider>().error ?? "Erreur API"})')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Color(0xFFE8E8E8) : Color(0xFF0A0E27), // Unified with onboarding
      body: Stack(
        children: [
          // Background image for both modes
          Positioned(
            top: -40,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.80,
            child: Image.asset('assets/images/back.png', fit: BoxFit.contain),
          ),

          // Logo SIADE on robot torso
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25, // Adjusted position
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 35, // Reduced size
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Light mode background section (Straight borders, lower position)
          if (isLight)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35, // Moved slightly higher
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE0E0E0), // User specified color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 4), // Thicker border for better visibility
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFE0E0E0), // Start with the requested grey
                        Color(0xFFF5E6F0),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: isLight
                              ? SizedBox()
                              : Image.asset(
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
                              isActive:
                                  true, // In light mode this should be toggle logic, but for now fixed as per request to keep functionality
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
                        controller: _emailController,
                        icon: Icons.email_outlined,
                        hint: 'E-mail ID',
                      ),
                      SizedBox(height: 18),

                      CustomTextField(
                        controller: _passwordController,
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
                                  checkColor: isLight
                                      ? Color(0xFF60438C)
                                      : Colors.blue,
                                  side: BorderSide(
                                    color: isLight
                                        ? Color(0xFF60438C)
                                        : Colors.blue,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: isLight
                                      ? Color(0xFF60438C)
                                      : Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: isLight ? Color(0xFF60438C) : Colors.blue,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),

                      Consumer<UserProvider>(
                        builder: (context, userProvider, child) {
                          if (userProvider.isLoading) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return GradientButton(
                            text: 'Login',
                            isActive: true,
                            isFullWidth: true,
                            onTap: _handleLogin,
                          );
                        },
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: isLight
                                  ? Color(0xFF60438C).withOpacity(0.3)
                                  : Colors.white24,
                              indent: 20,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'Or login with',
                            style: TextStyle(
                              color: isLight
                                  ? Color(0xFF60438C)
                                  : Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: isLight
                                  ? Color(0xFF60438C).withOpacity(0.3)
                                  : Colors.white24,
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
        ],
      ),
    );
  }
}
