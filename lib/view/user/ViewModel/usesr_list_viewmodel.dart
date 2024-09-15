import '../../../model/user_model/user_model.dart';

class UserListViewModel {
  final Map<String, List<UserModel>> regionUsers = {
    "おすすめのユーザー": [
      UserModel(
          uid: '1',
          userName: 'user1',
          youthGroupFlag: true,
          name: 'User1',
          age: 25,
          gender: '男性',
          bio: 'プロフィール1',
          email: '',
          password: 'password1'),
      UserModel(
          uid: '2',
          userName: 'user2',
          youthGroupFlag: false,
          name: 'User2',
          age: 30,
          gender: '女性',
          bio: 'プロフィール2',
          password: 'password2',
          email: ''),
      UserModel(
          uid: '3',
          userName: 'user3',
          youthGroupFlag: true,
          name: 'User3',
          age: 28,
          gender: 'その他',
          bio: 'プロフィール3',
          password: 'password3',
          email: ''),
    ],
    "辺野古エイサー": [
      UserModel(
          uid: '4',
          userName: 'user4',
          youthGroupFlag: false,
          name: 'User4',
          age: 22,
          gender: '男性',
          bio: 'プロフィール4',
          password: 'password4',
          email: ''),
      UserModel(
          uid: '5',
          userName: 'user5',
          youthGroupFlag: true,
          name: 'User5',
          age: 26,
          gender: '女性',
          bio: 'プロフィール5',
          password: 'password5',
          email: ''),
    ],
    "全島エイサー": [
      UserModel(
          uid: '6',
          userName: 'user6',
          youthGroupFlag: false,
          name: 'User6',
          age: 20,
          gender: '男性',
          bio: 'プロフィール6',
          password: 'password6',
          email: ''),
      UserModel(
          uid: '7',
          userName: 'user7',
          youthGroupFlag: true,
          name: 'User7',
          age: 29,
          gender: '女性',
          bio: 'プロフィール7',
          password: 'password7',
          email: ''),
      UserModel(
          uid: '8',
          userName: 'user8',
          youthGroupFlag: false,
          name: 'User8',
          age: 31,
          gender: '男性',
          bio: 'プロフィール8',
          password: 'password8',
          email: ''),
      UserModel(
          uid: '9',
          userName: 'user9',
          youthGroupFlag: true,
          name: 'User9',
          age: 24,
          gender: '女性',
          bio: 'プロフィール9',
          password: 'password9',
          email: ''),
    ],
  };
}
