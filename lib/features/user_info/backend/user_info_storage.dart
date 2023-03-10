import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import '../models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> saveUserInfo({
    required String userId,
    required String? displayName,
    required String? email,
  }) async {
    try {
      //first check if we have this user's info from before
      final userInfo = await FirebaseFirestore.instance
          .collection(
            'users',
          )
          .where(
            'uid',
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        //we already have this user's info
        await userInfo.docs.first.reference.update({
          'displayName': displayName,
          'email': email ?? '',
        });
        return true;
      }

      //we don't have this user's info before, create a new user
      final payload = UserInfoPayload(
        userId: userId,
        displayName: displayName,
        email: email,
      );
      await FirebaseFirestore.instance
          .collection(
            'users',
          )
          .add(payload);

      return true;
    } catch (e) {
      return false;
    }
  }
}
