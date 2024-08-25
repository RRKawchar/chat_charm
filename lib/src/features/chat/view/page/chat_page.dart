import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:chat_app_demo/src/features/chat/view/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          ],

          // Padding(
          //   padding: const EdgeInsets.all(4),
          //   child: ClipRRect(
          //       borderRadius: BorderRadius.circular(100),
          //
          //       child: Image.asset(AssetsImage.boyAvatarImage,)),
          // ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Riyazur Rohman Kawchar",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "Ofline",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
          ChatBubble(
            message: "Hello! How are you?",
            imageUrl: "",
            isComing: true,
            status: "read",
             time: "10:20 AM",
          ),
            ChatBubble(
              message: "I am fine",
              imageUrl: "https://i.ytimg.com/vi/8SPBy5vzQrw/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLB2HZrxv2vIM9AjCLnKxxHA2clzuQ",
              isComing: false,
              status: "read",
              time: "10:20 AM",
            ),
            ChatBubble(
              message: "I am fine",
              imageUrl: "",
              isComing: false,
              status: "read",
              time: "10:20 AM",
            ),
            ChatBubble(
              message: "I am fine",
              imageUrl: "",
              isComing: true,
              status: "read",
              time: "10:20 AM",
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,

        ),
        child: Row(
          children: [
            Icon(Icons.mic,size: 25,color: Theme.of(context).colorScheme.onPrimaryContainer,),
            SizedBox(width: 10),
            Expanded(child: TextField(
              decoration: InputDecoration(
                filled: false,
                hintText: "Type message ...."
              ),
        ),),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(Icons.image_outlined,color: Theme.of(context).colorScheme.onPrimaryContainer,size: 28,),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: (){
                kPrint("I am checking this");
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.send,color: Theme.of(context).colorScheme.onPrimaryContainer,size: 28,),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
