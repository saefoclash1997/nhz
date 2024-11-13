import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhzchatapp/constant.dart';

class MainChatScreen extends StatelessWidget {
  static const String id = 'mainChatScreen';
  MainChatScreen({super.key});

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeData().iconTheme.copyWith(
          color: Colors.white
        ),
        elevation: 12.0,
        backgroundColor: Colors.blue.shade700,
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
      ),
      endDrawer: Drawer(

        child: ListView(
          children: [
            ListTile(
              leading: Icon(CupertinoIcons.power),
              title: Text("Log Out"),
              onTap: (){
                FirebaseAuth.instance.signOut();
              },
            )
          ],
        ),
      ),
      body: Container(),
      bottomSheet: Container(
        padding: EdgeInsets.all(8.0),

        child: Row(
          children: [
            Flexible(child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Type Your Message",
                hintStyle: TextStyle(
                  color: Colors.grey
                ),
                fillColor: Colors.blue.shade100,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,

                )
              ),
            )),
            SizedBox(
              width: 8.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green
              ),
                child: IconButton(onPressed: (){},
                    icon: Icon(Icons.send,
                    color: Colors.white,
                    )))
          ],
        ),
      ),

    );
  }
}
