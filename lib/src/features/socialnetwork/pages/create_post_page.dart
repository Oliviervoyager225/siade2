import 'package:flutter/material.dart';
import 'package:siade2/src/theme/theme.dart';
import 'package:siade2/src/features/socialnetwork/pages/page.dart';
import 'package:siade2/src/features/socialnetwork/widgets/page.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
 
  final FocusNode _focusNode = FocusNode();
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Colors.white : Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: isLight ? Colors.white : Color(0xFF0A0E27),
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Annuler',
            style: TextStyle(
                color: isLight ? AppColors.primaryBlue : Colors.blue,
                fontSize: 14),
          ),
        ),
        leadingWidth: 80,
        title: Text(
          'CRÉER',
          style: TextStyle(
            color: isLight ? Color(0xFF60438C) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF62E8E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              child: Text(
                'Publier',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[800],
                  backgroundImage: AssetImage('assets/images/speaker_2.png'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    focusNode: _focusNode,
                    style: TextStyle(
                        color: isLight ? Color(0xFF60438C) : Colors.white,
                        fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Lorem Ipsum',
                      hintStyle: TextStyle(
                          color: isLight
                              ? Color(0xFF60438C).withValues(alpha: 0.6)
                              : Colors.white54,
                          fontSize: 16),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 15, bottom: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isLight
                            ? Color(0xFF60438C).withValues(alpha: 0.5)
                            : Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: isLight
                                ? Color(0xFF60438C).withValues(alpha: 0.3)
                                : Colors.white30,
                            width: 1.5),
                      ),
                      child: Icon(isExpanded ? Icons.close : Icons.add,
                          color: Colors.white, size: 20),
                    ),
                  ),
                  if (isExpanded) ...[
                    SizedBox(width: 12),
                    Container(
                      height: 36,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFF60438C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.image_outlined,
                              color: Colors.white, size: 20),
                          SizedBox(width: 16),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'GIF',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.camera_alt_outlined,
                              color: Colors.white, size: 20),
                          SizedBox(width: 16),
                          Icon(Icons.attach_file,
                              color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          Spacer(),

          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: isLight
                        ? Color(0xFF60438C).withValues(alpha: 0.3)
                        : Colors.white24,
                    width: 1.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: isLight
                          ? LinearGradient(
                              colors: [Color(0xFF60438C), Color(0xFF9E87CE)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                          : LinearGradient(
                              colors: [Color(0xFF07026F), Color(0xFFA01E38)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'POST',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StoryScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'STORY',
                        style: TextStyle(
                          color: isLight
                              ? Color(0xFF60438C).withValues(alpha: 0.6)
                              : Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
