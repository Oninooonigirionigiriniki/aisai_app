import 'package:aisai_app/model/quest_model/quest_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String name;
  int age;
  String gender;
  String? bio;
  String? profileImagePath;
  String? backgroundImagePath;
  QuestModel? questModel;
  String? userLocation;
  String userOccpation;
  bool youthGroupFlag;
  String seinennkai;
  String email;
  String password;

  final List<String> genders = ['男性', '女性', 'その他'];
  final List<String> seinennkais = ['非会員', '青年会会員'];

  UserModel({
    required this.uid,
    required this.name,
    required this.age,
    required this.gender,
    required this.bio,
    required this.profileImagePath,
    required this.backgroundImagePath,
    required this.questModel,
    required this.userLocation,
    required this.userOccpation,
    required this.youthGroupFlag,
    required this.seinennkai,
    required this.email,
    required this.password,
  });

  set setPassword(String password) {}

  set setEmail(String email) {}

  static fromFirebaseUser(User user) {}
}
