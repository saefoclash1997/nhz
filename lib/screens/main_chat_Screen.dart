import 'package:flutter/material.dart';
import 'package:nhzchatapp/constant.dart';

class MainChatScreen extends StatelessWidget {
  static const String id = 'mainChatScreen';
  const MainChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12.0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Hero(
                  tag: 'AppImage',
                  child: Image.asset(
                    height: 46,
                      width: 46,
                      "assets/images/icon.png")),
          SizedBox(width: 5,),
              Text("NHZ Chat",
              ),

            ],
          ),
        ),
      ),
      endDrawer: Drawer(),
    );
  }
}
