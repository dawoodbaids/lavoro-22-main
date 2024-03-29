import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:uuid/uuid.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../../data/model/chat_message.dart';
import '../../data/model/chatuser_db.dart';
import '../../data/model/user_model.dart';
import '../../data/provider/user_firebase.dart';
import 'chat_message.dart';

class ChatDatabase extends GetxController {
  Future addUserInfoToDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  static Future<String> createChat(String userId) async {
    var uuid = const Uuid();

    final CollectionReference chatRef =
        FirebaseFirestore.instance.collection('chat');

    // Check if chat user send to self
    if (userId == userId) {
      return "";
    }
    QuerySnapshot existingChatSnapshot = await chatRef
        .where('from', isEqualTo: userId)
        .where('to', isEqualTo: userId)
        .get();

    QuerySnapshot existingChatSnapshot2 = await chatRef
        .where('from', isEqualTo:userId)
        .where('to', isEqualTo: userId)
        .get();

    if (existingChatSnapshot.docs.isNotEmpty) {
      QuerySnapshot<Object?> chatid = await chatRef
          .where('from', isEqualTo: userId)
          .where('to', isEqualTo: userId)
          .get();

      QueryDocumentSnapshot<Object?> doc = chatid.docs[0];
      // print("from:${doc.id}");
      return doc.id;

      // chat already exists between userId and marketId
    } else if (existingChatSnapshot2.docs.isNotEmpty) {
      QuerySnapshot<Object?> chatid2 = await chatRef
          .where('from', isEqualTo:userId)
          .where('to', isEqualTo: userId)
          .get();

      QueryDocumentSnapshot<Object?> doc = chatid2.docs[0];
      // print("from:${doc.id}");
      return doc.id;
    } else {
      final String docId = uuid.v4();

      Map<String, dynamic> chatInfo = {
        "from": userId,
        "to": userId,
        "messages": [],
      };
      await chatRef.doc(docId).set(chatInfo);
      return docId;
    }
  }

  static Stream<List<QueryDocumentSnapshot>> getUserChat() {
    final String userId = UserAccount.info!.uid;

    final CollectionReference users=
        FirebaseFirestore.instance.collection('chat');

    Stream<QuerySnapshot> fromStream = users
        .where('from', isEqualTo: userId)
        .orderBy('lasttime', descending: true)
        .snapshots();

    Stream<QuerySnapshot> toStream = users
        .where('to', isEqualTo: userId)
        .orderBy('lasttime', descending: true)
        .snapshots();
    Stream<List<QueryDocumentSnapshot>> mergedStream = rxdart.Rx.combineLatest2<
        QuerySnapshot?, QuerySnapshot?, List<QueryDocumentSnapshot>>(
      fromStream,
      toStream,
      (fromSnapshot, toSnapshot) =>
          [...fromSnapshot?.docs ?? [], ...toSnapshot?.docs ?? []],
    ).map((mergedDocs) {
      mergedDocs.sort((a, b) {
        Map<String, dynamic> adata = a.data() as Map<String, dynamic>;
        Map<String, dynamic> bdata = b.data() as Map<String, dynamic>;
        final int lastTimeComparison = (bdata['lasttime'] as String?)
                ?.compareTo(adata['lasttime'] as String) ??
            0;
        if (lastTimeComparison == 0) {
          return (bdata['to'] as String?)?.compareTo(adata['to'] as String) ??
              0;
        } else {
          return lastTimeComparison;
        }
      });
      return mergedDocs;
    });

    return mergedStream;
  }

  static Future<void> sendTextMessage(String docId, String msg) async {
    ChatMessage message = ChatMessage(
      sender: UserAccount.info!.uid,
      msg: msg,
      sendTime: DateTime.now(),
    );

    await FirebaseFirestore.instance.collection("chat").doc(docId).update({
      'messages': FieldValue.arrayUnion([message.toMap()])
    });
  }

  static Future<void> sendImageMessage(String docId, String url) async {
    ChatMessage message = ChatMessage(
      sender: UserAccount.info!.uid,
      msg: url,
      messageType: ChatMessageType.image,
      sendTime: DateTime.now(),
    );

    await FirebaseFirestore.instance.collection("chat").doc(docId).update({
      'messages': FieldValue.arrayUnion([message.toMap()])
    });
  }

  static Future<void> chatChecker({required String uuid}) async {
    final useruuid = UserAccount.info!.uid;
    final userId= uuid;

    if (useruuid == userId) return;

    // Create chat
    final chatId = await ChatDatabase.createChat(useruuid);
    UserAccountChat? userAccountChat =
        await DatabaseFirestore.getUserById(userId);

    if (userAccountChat != null) {
      Get.to(
        () => ChatMessages(
          docId: chatId,
          value: userAccountChat,
        ),
      );
    }
  }
}
