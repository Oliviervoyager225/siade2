class Post {
  String imagePoster;
  String namePoster;
  String elapsedTime;
  int likes;
  int shares;
  List<String> comments;
  List<String> postImages;
  String postLegend;
  bool isSaved = false;
  bool hasLiked = false;

  Post({
    required this.imagePoster,
    required this.namePoster,
    required this.elapsedTime,
    required this.likes,
    required this.shares,
    required this.comments,
    required this.postImages,
    required this.postLegend,
  });

  // Getter pour calculer le nombre de commentaires
  int get commentsNumber => comments.length;
}

final List<Post> posts = [
  Post(
    imagePoster: 'assets/images/avatar_profile.png',
    namePoster: 'Sophie Martin',
    elapsedTime: 'Il y a 2h',
    likes: 245,
    shares: 7,
    comments: [
      'Magnifique photo ! 😍',
      'Trop beau, j\'adore !',
      'Où est-ce que c\'est ?',
      'Superbe coucher de soleil 🌅',
      'Incroyable vue !',
    ],
    postImages: [],
    postLegend:
        'Quelle journée incroyable à la plage ! Le coucher de soleil était absolument magnifique 🌅✨ #beach #sunset #paradise',
  ),

  Post(
    imagePoster: 'assets/images/avatar_profile.png',
    namePoster: 'Thomas Dubois',
    elapsedTime: 'Il y a 5h',
    likes: 892,
    shares: 23,
    comments: [],
    postImages: [
      'assets/images/carousel_2.jpg',
      'assets/images/carousel_1.jpg',
      'assets/images/carousel_3.jpg',
    ],
    postLegend: '',
  ),

  Post(
    imagePoster: 'assets/images/avatar_profile.png',
    namePoster: 'Emma Laurent',
    elapsedTime: 'Il y a 1 jour',
    likes: 1523,
    shares: 45,
    comments: [
      'Trop stylé ! 🔥',
      'J\'adore ton style !',
      'Où tu as acheté cette veste ?',
      'Tu es magnifique ❤️',
      'Fashion icon ! 👑',
      'Sublime tenue !',
      'Les couleurs sont parfaites',
    ],
    postImages: ['assets/images/post_1.jpg'],
    postLegend:
        'Nouveau look pour l\'automne 🍂 Qui aime les couleurs chaudes ? #fashion #ootd #autumnvibes #style',
  ),

  Post(
    imagePoster: 'assets/images/avatar_profile.png',
    namePoster: 'Lucas Bernard',
    elapsedTime: 'Il y a 3 jours',
    likes: 567,
    shares: 12,
    comments: [
      'Trop mignon ! 🐶',
      'Quel adorable chien !',
      'Il a l\'air trop heureux 😊',
      'Race ? Il est magnifique !',
      'Je craque complètement ❤️',
    ],
    postImages: ['assets/images/post_2.jpg'],
    postLegend:
        'Journée au parc avec mon meilleur ami 🐕 Il adore courir partout ! #dog #puppy #doglover #bestfriend #nature',
  ),

  Post(
    imagePoster: 'assets/images/avatar_profile.png',
    namePoster: 'Léa Rousseau',
    elapsedTime: 'Il y a 1 semaine',
    likes: 2145,
    shares: 94,
    comments: [
      'Félicitations ! 🎉',
      'Trop contente pour toi !',
      'Tu le mérites tellement ! 💪',
      'Bravo ! C\'est génial !',
      'Quelle fierté ! 👏',
      'Continue comme ça !',
      'Inspirant ! 🌟',
      'Yes ! Tu assures !',
    ],
    postImages: ['assets/images/post_1.jpg', 'assets/images/post_2.jpg'],
    postLegend: '',
  ),
];
