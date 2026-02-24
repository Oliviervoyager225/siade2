import 'package:flutter/material.dart';
import 'package:siade2/src/features/login/pages/pages.dart';
import 'package:siade2/src/features/login/widgets/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:siade2/src/providers/providers.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _posteController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _posteController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final poste = _posteController.text.trim();
    final phone = _phoneController.text.trim();

    if (name.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty || poste.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs obligatoires')),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Le mot de passe doit contenir au moins 6 caractères')),
      );
      return;
    }

    final userData = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'poste': poste,
      if (phone.isNotEmpty) 'phone': phone,
    };

    final success = await context.read<UserProvider>().signup(userData);

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Inscription réussie !')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Note: Inscription ignorée (Mode Bypass)')),
        );
      }
      // On laisse passer dans tous les cas
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Color(0xFFE8E8E8) : Color(0xFF0A0E27),
      body: Stack(
        children: [
          // Background / Avatar
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

          // Light gray section at bottom (Straight borders, lower position)
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
                // In Dark mode, back.png was used in BoxDecoration in Login page differently, 
                // but we unified it to use Stack image.
                // We keep transparent container here to maintain spacing layout.
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
                        controller: _nameController,
                        icon: Icons.person_outline,
                        hint: 'Full Name',
                      ),
                      SizedBox(height: 18),

                      CustomTextField(
                        controller: _emailController,
                        icon: Icons.email_outlined,
                        hint: 'Email-ID',
                      ),
                      SizedBox(height: 18),

                      CustomTextField(
                        controller: _passwordController,
                        icon: Icons.lock_outline,
                        hint: 'Password',
                        isPassword: true,
                      ),
                      SizedBox(height: 18),

                      CustomTextField(
                        controller: _usernameController,
                        icon: Icons.account_circle_outlined,
                        hint: 'Username',
                      ),
                      SizedBox(height: 18),

                      CustomTextField(
                        controller: _posteController,
                        icon: Icons.badge_outlined,
                        hint: 'Poste/Service',
                      ),
                      SizedBox(height: 18),

                      CustomTextField(
                        controller: _phoneController,
                        icon: Icons.phone_outlined,
                        hint: 'Phone No. (Optional)',
                      ),
                      SizedBox(height: 25),

                      Consumer<UserProvider>(
                        builder: (context, userProvider, child) {
                          if (userProvider.isLoading) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                              color: isLight ? Colors.white : Color(0xff2563EB),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: isLight ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ] : null,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: _handleSignup,
                                child: Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: isLight ? Color(0xFFB8A0D0) : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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
