import 'dart:convert';
import 'data1.dart';
import 'package:http/http.dart' as http;

//عشان الدوال اللي زي post الها استخداماث كثير غير هاي البكج، ف ميزتها عشان استدعي ال post الخاصة بيها

class ApiRequest {
  Future<Welcome?> fetchImage() async {
    Welcome? finalResponse;
    //response يتكون من status code and body
    //اشي بعطيه واشي باخده بعدها
    try {
      http.Response response = await http.get(Uri.parse(
          'https://random.imagecdn.app/v1/image?width=500&height=1080&category=buildings&format=json'));
      print('status code: $response.statusCode');

      if (response.statusCode == 200) {
        final jsonDecodedBody = jsonDecode(response.body);

        finalResponse = Welcome.fromJson(jsonDecodedBody);

        return finalResponse;
      } else {
        return finalResponse;
      }
    } catch (e) {
      return Future.error(e);
    }
    //لشو ال post?
    //الاكواد بتكون مشفرة، لانه بياخد ال body بعطيه بس اللينك لعند ال endpoint بدون التفاصيل اللي بتيجي بعدها، ف كل اشي بأمان ومخبى
    //لشو ال get?
    //للأشياء اللي ما فيها سريّة
    //الداتا مش محمية، كل حدا بيشوف اللينك بيعرف المعلومات، سواء عند البحث على شو بحثت، ولا بتسجيل الدخول ايميلي والباسووؤد
  }
}
