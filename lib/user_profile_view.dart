// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'app/data/model/user_model.dart';
// import 'app/global_widgets/custom_button.dart';

// import 'app/modules/user_profile/widgets/user_profile_body.dart';

// class UserProfil extends StatefulWidget {
//   final UserAccountChat user;

//   const UserProfileView({Key? key, required this.user}) : super(key: key);

//   @override
//   State<UserProfileView> createState() => _UserProfileViewState();
// }

// class _UserProfileViewState extends State<UserProfileView> {
//   StreamSubscription<DocumentSnapshot>? _streamSubscription;

//   @override
//   void initState() {
//     setState(() {});
//     super.initState();
//     _streamSubscription = FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.user.uid)
//         .snapshots()
//         .listen((documentSnapshot) {
//       UserAccount.updateViewr(widget.user.uid!);
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _streamSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('userProfile'.tr),
//         centerTitle: true,
//       ),
//       body: const UserProfileBody(),
//       floatingActionButton: CustomButtonWithLoading(
//         width: 20,
//         padding: const EdgeInsets.all(16.0),
//         label: const Icon(Icons.message),
//         color: Get.theme.colorScheme.primary,
//         loadingColor: Get.theme.colorScheme.onBackground,
//         // onPressed: () async {
//         //   await ChatDatabase.chatChecker(uuid: widget.user.uid!);
//         // },
//       ),
//     );
//   }
// }
