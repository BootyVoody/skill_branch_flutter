import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    final user = User(name: name, phone: phone, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception('A user with this name already exists');
    }
  }

  User registerUserByEmail(String fullName, String email) {
    final user = User(name: fullName, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
      return user;
    } else {
      throw Exception('A user with this email already exists');
    }
  }

  getUserByLogin(String login) => users[login];

  User registerUserByPhone(String fullName, String phone) {
    final user = User(name: fullName, phone: phone);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
      return user;
    } else {
      throw Exception('A user with this phone already exists');
    }
  }

  void setFriends(String login, List<User> friends) {
    users[login].friends.addAll(friends);
  }

  User findUserInFriends(String fullName, User user) =>
      users[fullName].friends.contains(user) ? user : throw Exception('${user.login} is not a friend of the login');

  List<User> importUsers(List<String> list) => list
      .map((lines) => lines
          .split(';')
          .map((line) => line.trim())
          .where((element) => element.isNotEmpty)
          .toList())
      .map((lines) => User(name: lines[0], email: lines[1], phone: lines[2]))
      .toList();
}