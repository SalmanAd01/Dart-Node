import 'package:client/client.dart';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
  var users = User();
  users.getUsers();
  users.createUser('Johns1', 'Johns1@gmail.com', '123456');
  users.updateUser(
      '62e04106684c576afe9ac75e', 'Johns2', 'Test@gmail.com', '12');

  users.deleteUser('62e04106684c576afe9ac75e');
}
