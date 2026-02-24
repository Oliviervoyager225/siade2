import 'package:flutter/material.dart';
import 'package:siade2/src/commons/data/models.dart';
import 'package:siade2/src/features/home/pages/home_page.dart';
import 'package:siade2/src/features/home/pages/pages.dart';
import 'package:siade2/src/theme/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _searchTextController = TextEditingController();

  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLight ? Colors.white : null,
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> AppLayout()));},
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: isLight ? Color(0xFF60438C).withOpacity(0.8) : null,
                            border: Border.all(color: isLight ? Colors.transparent : AppColors.darkGrey, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
        
                      Text(
                        'MESSAGES', 
                        style: TextStyle(
                          color: isLight ? Color(0xFF60438C).withOpacity(0.6) : Colors.white
                        )
                      ),
        
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                             color: isLight ? Color(0xFF60438C).withOpacity(0.8) : null,
                            border: Border.all(color: isLight ? Colors.transparent : AppColors.darkGrey, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
        
                  TextField(
                    controller: _searchTextController,
                    style: TextStyle(color: isLight ? Colors.white : Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.w),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Rechercher...',
                      suffixIcon: Icon(Icons.search, color: isLight ? Colors.white : null),
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: isLight ? Color(0xFF60438C).withOpacity(0.8) : AppColors.darkGrey,
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppColors.darkGrey, height: 0.5),
        
            Container(
              padding: EdgeInsets.only(top: 20, left: 30),
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, _) => SizedBox(width: 20),
                itemCount: status.length,
                itemBuilder: (context, index) {
                  var currentStatus = status[index];
        
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: AssetImage(currentStatus.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
        
                      Text(
                        currentStatus.name,
                        style: TextStyle(color: isLight ? Color(0xFF60438C) : Colors.white),
                      ),
                    ],
                  );
                },
              ),
            ),
        
            Divider(color: AppColors.darkGrey, height: 0.5),
        
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_, _) => Column(
                children: [
                  SizedBox(height: 10),
                  Divider(color: AppColors.darkGrey, height: 0.5),
                ],
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final currentMessage = messages[index];
        
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConversationPage(message: currentMessage))
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(currentMessage.imagePath),
                      radius: 30,
                    ),
                    title: Text(
                      currentMessage.name,
                      style: TextStyle(
                        color: isLight ? Color(0xFF60438C) : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      currentMessage.message.length > 30
                          ? '${currentMessage.message.substring(0, 30)}...'
                          : currentMessage.message,
                      style: TextStyle(
                        color: isLight ? Color(0xFF60438C).withOpacity(0.6) : Colors.white,
                      ),
                    ),
                    trailing: Text(
                      currentMessage.convertSendDate(),
                      style: TextStyle(color: isLight ? Color(0xFF60438C) : AppColors.greySecondary),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
