import 'dart:developer';

import 'package:flutter/material.dart';

class ChatUi extends StatefulWidget {
  const ChatUi({Key? key}) : super(key: key);

  @override
  _ChatUiState createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {

  TextEditingController textEditingController = TextEditingController();
  List<String> listChat = [];

  late String val;
  chatUiFunc()async{
    val = textEditingController.text.trim();
    textEditingController.clear();
    setState(() {
      listChat.add(val);

    });

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      listChat.add("user yozdi: "+val);

    });
  }

  double hText = 80;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat UI",
        ),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: Column(
        children: [
          /// chat ui
          Expanded(
            child: ListView.builder(
              itemCount: listChat.length,
              itemBuilder: (context, index) => Align(
                alignment: index % 2 == 0
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(index % 2 == 0 ? 8 : 0),
                            bottomRight:
                                Radius.circular(index % 2 == 0 ? 0 : 8))),
                    child: Text(listChat[index])),
              ),
            ),
          ),

          /// Typing

          Container(
            height: hText,
            width: double.infinity,
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Container(
                  width: w * 0.8,

                  padding: EdgeInsets.all(5),
                  child: TextFormField(

                    maxLines: null,

                    controller: textEditingController,

                    onChanged: (val){

                      if (val.trim().length > 10) {

                        setState(() {
                          hText = 100;
                        });
                      }

                      else{
                        setState(() {
                          hText = 80;
                        });
                      }
                      log(val);
                    },

                    decoration: InputDecoration(border: InputBorder.none,
                    // counter: SizedBox.shrink()
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        chatUiFunc();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
