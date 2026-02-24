import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models/sms.dart';
import 'package:siade2/src/theme/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../gen/assets.gen.dart';

class ConversationPage extends StatelessWidget {
  final Sms message;

  const ConversationPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Color(0xFFF7F7F7) : const Color(0xFF050026),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 60.0,
              right: 60.0,
              top: 30.0,
              bottom: 15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isLight ? Color(0xFF60438C).withOpacity(0.8) : null,
                      border: Border.all(color: isLight ? Colors.transparent : AppColors.greySecondary),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),

                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(message.imagePath),
                      radius: 15,
                    ),
                    Text(
                      message.name,
                      style: TextStyle(
                        color: isLight ? Color(0xFF60438C) : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isLight ? Color(0xFF60438C).withOpacity(0.8) : null,
                      border: Border.all(color: isLight ? Colors.transparent : AppColors.greySecondary),
                    ),
                    child: Icon(Icons.more_vert, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.greySecondary, height: 0.2),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                _buildDateLabel('SEP 14, 2021'),
                _buildMessageBubble(
                  context: context,
                  text: 'Lorem ipsum is placeholder',
                  isMe: false,
                  time: '8:27 PM',
                ),
                _buildMessageBubble(
                  context: context,
                  text: 'text commonly used in the',
                  isMe: true,
                  time: '',
                ),
                _buildMessageBubble(
                  context: context,
                  text: 'text commonly used in the',
                  isMe: true,
                  time: '8:56 PM',
                ),
                _buildMessageBubble(
                  context: context,
                  text: 'text commonly used in the',
                  isMe: false,
                  time: '9:01 PM',
                ),
                _buildMessageBubble(context: context, text: '❤️', isMe: true, time: '9:04 PM'),
                _buildDateLabel('TODAY'),
                _buildMessageBubble(
                  context: context,
                  text: 'text commonly used in the',
                  isMe: false,
                  time: '11:53 AM',
                ),
                _buildMessageBubble(
                  context: context,
                  text: 'text commonly',
                  isMe: true,
                  time: '12:14 PM',
                ),
              ],
            ),
          ),

          // --- Input bar ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: isLight ? Color(0xFFCDCDCD) : Colors.black,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isLight ? Colors.white : AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        style: TextStyle(color: isLight ? Color(0xFF60438C) : Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Type your message here...',
                          hintStyle: TextStyle(color: isLight ? Color(0xFF60438C).withOpacity(0.5) : Colors.grey),
                          border: InputBorder.none,
                          suffixIcon: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add, color: isLight ? Color(0xFF60438C) : AppColors.greySecondary,),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: isLight 
                                        ? [Color(0xFF60438C).withOpacity(0.7), Color(0xFF60438C)]
                                        : [
                                            AppColors.primaryBlue,
                                            AppColors.primaryRed,
                                          ],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(10),
                                child: isLight 
                                  ? Icon(Icons.send, size: 16, color: Colors.white)
                                  : Image(
                                    image: AssetImage("assets/images/send.png"),
                                  ),
                              ),
                            ],
                          ),
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

  Widget _buildDateLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble({
    required BuildContext context,
    required String text,
    required bool isMe,
    required String time,
  }) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    
    // Light mode colors
    final lightMeColor = Colors.black;
    final lightOtherColor = Color(0xFF60438C);
    
    // Dark mode colors (existing)
    final darkMeColor = const Color(0xFF167BF7);
    final darkOtherColor = const Color(0xFF2A2940);

    final bubbleColor = isLight 
        ? (isMe ? lightMeColor : lightOtherColor)
        : (isMe ? darkMeColor : darkOtherColor);

    return Column(
      crossAxisAlignment: isMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: isMe
                  ? const Radius.circular(16)
                  : const Radius.circular(4),
              bottomRight: isMe
                  ? const Radius.circular(4)
                  : const Radius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
          child: Text(
            time,
            style: TextStyle(color: isLight ? Color(0xFF60438C).withOpacity(0.7) : Colors.grey, fontSize: 11),
          ),
        ),
      ],
    );
  }

  Widget _buildEmojiMessage(String emoji, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          child: Text(emoji, style: const TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 6),
          child: Text(
            time,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ),
      ],
    );
  }
}
