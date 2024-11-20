import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nhzchatapp/components/spinner.dart';
import 'package:nhzchatapp/constant.dart';
import 'package:nhzchatapp/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../control/provider_services.dart';

class MainChatScreen extends StatefulWidget {
  static const String id = 'mainChatScreen';
  MainChatScreen({super.key});

  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  TextEditingController messageController = TextEditingController();
  String? currentUser;
  getUserEmail() async {
    currentUser = await FirebaseAuth.instance.currentUser!.email;
    print(currentUser);
  }

  @override
  void initState() {
    getUserEmail();
    super.initState();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double phoneScreenWidth = MediaQuery.of(context).size.width;
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(image:
      //       AssetImage('assets/images/icon.png'),
      //     fit: BoxFit.cover
      //   ),
      // ),
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Hero(
                    tag: 'AppImage',
                    child: Image.asset(
                        height: 46, width: 46, "assets/images/icon.png")),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "NHZ Chat",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        endDrawer: CustomDrawer(),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.waiting &&
                snapshot.data == null) {
              return const MySpinner();
            }
            var data = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              reverse: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: currentUser == data[index]['sender']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: phoneScreenWidth * 4 / 5),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: currentUser == data[index]['sender']
                            ? kBlueFour
                            : Colors.blue.shade100,
                        borderRadius: currentUser == data[index]['sender']
                            ? const BorderRadius.only(
                                topRight: Radius.circular(18.0),
                                bottomLeft: Radius.circular(18.0),
                                topLeft: Radius.circular(18.0),
                              )
                            : const BorderRadius.only(
                                bottomRight: Radius.circular(18.0),
                                topRight: Radius.circular(18.0),
                                topLeft: Radius.circular(18.0),
                              ),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 10,
                          ),
                        ]),
                    child: Text(
                      data[index]['message'],
                      style: TextStyle(
                          color: currentUser == data[index]['sender']
                              ? Colors.white
                              : kBlueFour,
                          fontSize: 18.0),
                    ),
                  ),
                );
              },
            );
          },
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                  child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  focusedErrorBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Type Your Message",
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.blue.shade100,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              )),
              const SizedBox(
                width: 8.0,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                  child: IconButton(
                      onPressed: () {
                        FirebaseFirestore.instance
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
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
