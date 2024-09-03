
import 'package:http/http.dart' as http;
import 'package:users/src/models/user.dart';

const String baseUrl="66d76bc4006bfbe2e650cb2d.mockapi.io";

Future<List<User>> getUsers() async {
  try{
    Uri url = Uri.https(baseUrl, '/users');
    final response = await http.get(url);
    final users = usersFromJson(response.body);
    return users;
  }
  catch(e){
    rethrow;
  }
}