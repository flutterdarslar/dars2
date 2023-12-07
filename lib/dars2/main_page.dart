import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> chatMessage = ["Salom 1 ", "Salom 2"];

  addTextInList({required String messageUser}) async{

    setState(() {
      chatMessage.add(messageUser);
    });

    await Future.delayed(Duration(seconds: 3));
    setState(() {


      chatMessage.add("user yozdi $messageUser");
    });
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Chat UI"),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: SafeArea(
          child: Column(
        children: [
          /// list
          Expanded(
            child: ListView.builder(
              reverse: false,
              itemCount: chatMessage.length,
              itemBuilder: (context, index) => Container(
                child: Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: index % 2 == 0
                      ?    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      child: Text(chatMessage[index]))
                      :
                  Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(0))),
                      child: Text(chatMessage[index]))

                ),
              ),
            ),
          ),

          /// typing
          Container(
            height: 60,
            width: w,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  width: w * 0.8,
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                Expanded(
                    child: IconButton(
                  onPressed: () {
                    addTextInList(messageUser: textEditingController.text);
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
