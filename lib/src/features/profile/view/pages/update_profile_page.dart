// import 'package:chat_app_demo/src/core/widgets/k_button.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class UpdateProfilePage extends StatelessWidget {
//   const UpdateProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Update Profile"),),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Theme.of(context).colorScheme.primaryContainer
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 200,
//                           width: 200,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color: Theme.of(context).scaffoldBackgroundColor
//                           ),
//                           child: Icon(Icons.add_photo_alternate_rounded,size: 50,),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Text("Personal Info",style: Theme.of(context).textTheme.labelMedium,),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Text("Name",style: Theme.of(context).textTheme.bodyMedium,),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         TextField(
//                           textInputAction: TextInputAction.next,
//                           decoration: InputDecoration(
//                             hintText: "RRK",
//                             prefixIcon: Icon(Icons.person,color: Theme.of(context).colorScheme.onPrimaryContainer,)
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Text("Email",style: Theme.of(context).textTheme.bodyMedium,),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         TextField(
//                           textInputAction: TextInputAction.next,
//                           decoration: InputDecoration(
//                             hintText: "example@gmail.com",
//                             prefixIcon: Icon(Icons.person,color: Theme.of(context).colorScheme.onPrimaryContainer,)
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Text("Phone",style: Theme.of(context).textTheme.bodyMedium,),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         TextField(
//                           textInputAction: TextInputAction.done,
//                           decoration: InputDecoration(
//                             hintText: "08488....",
//                             prefixIcon: Icon(Icons.person,color: Theme.of(context).colorScheme.onPrimaryContainer,)
//                           ),
//                         ),
//
//                         SizedBox(height: 40),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             KButton(
//                                 btnText: "Save",
//                                 onTap: (){}
//                             ),
//                           ],
//                         )
//
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
