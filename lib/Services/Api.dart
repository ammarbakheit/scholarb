import 'package:scholarb/Models/user.dart';
import 'package:http/http.dart' as http;
class Api {

  static const endPoint = "http://10.0.2.2:8000/api";

  var client = http.Client();


  Future<String> signUp(User user) async {
      var response = await client.post('$endPoint/register/apiuser', 
      body: {
        'name': user.username,
        'email':  user.email,
        'password': user.password
      });

      return response.body;
  } 
}