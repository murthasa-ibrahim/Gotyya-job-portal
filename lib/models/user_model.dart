import 'package:dio/dio.dart';
import 'package:http/http.dart'as http;



GetRequest()async{
final dio = Dio();
// final request = await dio.post('dio.postUri(uri)',



var request1=await dio.requestUri(Uri.parse('http://127.0.0.1:8000/auth/token',),data:  '''{\n "client_id":"lesL0tHw2VuxWdqczKeSEouvCaTlDKWXN5kqeWB8",\n "client_secret":"ExrRhhu3sPsnzNLLRfY3Ly4b3tQky4Hy4ocJqLkKHvh9i4CyfpciG6fwPDQAA2zHD9jyhdmjbLHe22WzLtF9XEjNr2y2bvINvPPFX6YQ13cEUMOs1vJJMtJCaR3MNKDz",\n "grant_type":"password",\n "username":"adhilsalah06@gmail.com",\n "password":"123"\n}''');
print(request1);
}

httpRequest()async{

var request = http.Request('POST', Uri.parse('http://10.0.2.2:8000/auth/token'),);
request.body = '''{\n "client_id":"bkXeNtOHDGTYW1S7QwRCbN9Vt5xCMJi0w2okdXQ6",\n "client_secret":"6tf9xSEIA1KcT48rJmhOYPyJXUCtDGtFWgecFKOAPsIbwvrXK7rF6vzxGwibg96NaC3qLQWtxzQpOe8DxskodJy1pnNSZRSCoEn5nR4wElYwiTZiHli8dBwKuve6rvrd",\n "grant_type":"password",\n "username":"admin@gmail.com",\n "password":"123"\n}''';

http.StreamedResponse response = await request.send();
final String end = 'http://10.0.2.2:8000/auth/token';

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
}


LoginRequest()async{
  print('clicked moreskjfklsadjfklsj');
 try {
   final redponds = await http.post(Uri.parse('http://10.0.2.2:8000/auth/token'),headers: {'Content-Type': 'application/json'},
  body: '{ "client_id":"bkXeNtOHDGTYW1S7QwRCbN9Vt5xCMJi0w2okdXQ6", "client_secret":"6tf9xSEIA1KcT48rJmhOYPyJXUCtDGtFWgecFKOAPsIbwvrXK7rF6vzxGwibg96NaC3qLQWtxzQpOe8DxskodJy1pnNSZRSCoEn5nR4wElYwiTZiHli8dBwKuve6rvrd", "grant_type":"password","username":"murthasa@gmail.com", "password":"307640"}'
  );
  print(redponds.body);
 } catch (e) {
   print(e.toString());
 }
  
}

SignUpRequest()async{
 final redponds = await http.post(Uri.parse('http://10.0.2.2:8000/auth/signup'),headers: {'Content-Type': 'application/json'},
  body: '{\n    "email": "murthasa@gmail.com",\n    "username": "murthasa",\n    "password": "307640",\n    "first_name": "mur"\n}'
  );
  print(redponds.body);
}
