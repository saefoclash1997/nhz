import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhzchatapp/components/spinner.dart';
import 'package:nhzchatapp/constant.dart';
import 'package:nhzchatapp/screens/welcome_screen.dart';

class MainChatScreen extends StatelessWidget {
  static const String id = 'mainChatScreen';
  MainChatScreen({super.key});

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: ThemeData().iconTheme.copyWith(color: Colors.white),
        elevation: 12.0,
        backgroundColor: Colors.blue.shade700,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Hero(
                  tag: 'AppImage',
                  child: Image.asset(
                      height: 46, width: 46, "assets/images/icon.png")),
              SizedBox(
                width: 5,
              ),
              Text(
                "NHZ Chat",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              onTap: () {
                FirebaseAuth.instance.signOut();

                Navigator.pushReplacementNamed(context, WelcomeScreen.id);
              },
            )
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            MySpinner();
          }
          var data = snapshot.data!.docs;
          print(data[0].data());
          return ListView.builder(
            padding: EdgeInsets.only(bottom: 80),
            reverse: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
            return Container(
              child: Text(
                  data[index]['message'],
              ),
            );
          },);
        },
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
                child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                  hintText: "Type Your Message",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.blue.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  )),
            )),
            SizedBox(
              width: 8.0,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green),
                child: IconButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('messages')
                          .doc()
                          .set({
                        'message': messageController.text.toString(),
                        'sender': (FirebaseAuth.instance.currentUser!.email)
                            .toString(),
                        'time': DateTime.now()
                      });
                      messageController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    )))
          ],
        ),
      ),
    );
  }
}
