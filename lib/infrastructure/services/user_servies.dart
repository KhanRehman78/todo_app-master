import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/infrastructure/model/user_model.dart';

class UserServices {
  /// create user
  Future createUser(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .doc(userModel.uid.toString())
        .set(userModel.toJson(userModel.uid.toString()));
  }

  /// Fetch Users Record
  Stream<UserModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(userID)
        .snapshots()
        .map((userData) =>
            UserModel.fromJson(userData.data() as Map<String, dynamic>));
  }
}
