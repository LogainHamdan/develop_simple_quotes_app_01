import 'dart:convert';
import 'data2.dart';
import 'package:http/http.dart' as http;

//عشان الدوال اللي زي post الها استخداماث كثير غير هاي البكج، ف ميزتها عشان استدعي ال post الخاصة بيها

class ApiRequest2 {
  Future<Welcome2?> login2() async {
    Welcome2? finalResponse;
    //response يتكون من status code and body
    //اشي بعطيه واشي باخده بعدها
    try {
      http.Response response =
          await http.get(Uri.parse('https://api.quotable.io/quotes/random'));

      if (response.statusCode == 200) {
        final List<Welcome2> finalResponse = welcome2FromJson(response.body);

        return finalResponse[0];
      } else {
        return finalResponse;
      }
    } catch (e) {
      return finalResponse;
    }
    //لشو ال post?
    //الاكواد بتكون مشفرة، لانه بياخد ال body بعطيه بس اللينك لعند ال endpoint بدون التفاصيل اللي بتيجي بعدها، ف كل اشي بأمان ومخبى
    //لشو ال get?
    //للأشياء اللي ما فيها سريّة
    //الداتا مش محمية، كل حدا بيشوف اللينك بيعرف المعلومات، سواء عند البحث على شو بحثت، ولا بتسجيل الدخول ايميلي والباسووؤد
  }
}
