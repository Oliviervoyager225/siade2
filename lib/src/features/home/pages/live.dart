import 'dart:math';
import 'package:flutter/material.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> with TickerProviderStateMixin {
  final List<String> comments = [
    'Moi: Super ❤️',
    'Quelqu’un: Super ❤️',
    'Vania: 👍👍',
    'Moi: 🥰🥰🥰',
  ];

  late AnimationController _heartController;
  final List<Offset> _hearts = [];

  @override
  void initState() {
    super.initState();

    _heartController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  void _addHeart() {
    setState(() {
      _hearts.add(Offset(Random().nextDouble(), 1.0));
    });

    _heartController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08042A),
      body: Stack(
        children: [
          // 🎥 Fond (image simulant la vidéo live)
          Positioned.fill(
            child: Image.asset(
              'assets/images/profile_image.jpg', // ou remplace par un stream video_player
              fit: BoxFit.cover,
            ),
          ),

          // 🌫️ Overlay léger
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // --- Barre supérieure (profil + LIVE + vues + fermer) ---
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profil
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage:
                          AssetImage('assets/images/photo_profile.jpg'),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Fatemate',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.visibility,
                              color: Colors.white, size: 12),
                          SizedBox(width: 3),
                          Text('10K',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
                // Bouton fermer
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),

          // --- Liste des commentaires (bas gauche) ---
          Positioned(
            bottom: 80,
            left: 10,
            right: 80,
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(
                            'assets/images/profile_1.jpg'),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          comment,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // --- Cœurs animés (bas droite) ---
          Positioned.fill(
            child: Stack(
              children: _hearts.map((offset) {
                final index = _hearts.indexOf(offset);
                final animationValue =
                    Curves.easeOut.transform(_heartController.value);
                final dy = 1.0 - (animationValue * 1.2);
                return Positioned(
                  right: 30 + Random().nextDouble() * 20,
                  bottom:
                      MediaQuery.of(context).size.height * (offset.dy * dy),
                  child: Opacity(
                    opacity: 1 - animationValue,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.pinkAccent.shade100,
                      size: 28 + Random().nextDouble() * 10,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // --- Zone de saisie de commentaire (bas) ---
          Positioned(
            bottom: 20,
            left: 10,
            right: 60,
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Comment',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // --- Bouton cœur (bas droite) ---
          Positioned(
            bottom: 18,
            right: 16,
            child: GestureDetector(
              onTap: _addHeart,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.3),
                ),
                child:
                    const Icon(Icons.favorite_border, color: Colors.white, size: 26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
