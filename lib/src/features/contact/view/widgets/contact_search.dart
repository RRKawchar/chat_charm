import 'package:chat_app_demo/src/core/helpers/helper_method.dart';
import 'package:flutter/material.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer
      ),

      child: Expanded(
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value)=>{
            kPrint(value)
          },
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search)


          ),
        ),
      ),);
  }
}
