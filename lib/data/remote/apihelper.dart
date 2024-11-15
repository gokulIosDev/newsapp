import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newsapp/domain/constants/appexceptions.dart';
import 'package:newsapp/domain/constants/appprefs.dart';

class ApiHelper {
  // Future<dynamic> getApi({required String url, String? query}) async {
  //   try {
  //     final reponse = await http.get(Uri.parse(url),headers: {
  //       "Content-Type": "application/json"
  //     });
  //     return jsonResponse(reponse);
  //   } on SocketException catch (ex) {
  //     throw FetchDataException(errormsg: ex.toString());
  //   } catch (ex) {
  //     throw FetchDataException(errormsg: ex.toString());
  //   }
  // }

  Future<dynamic> getApi({required String query}) async {
    try {
      final url = "https://newsapi.org/v2/everything?q=${query}&from=2024-10-10&sortBy=publishedAt&apiKey=11f999fcddb54b70b2dab328a0b8c660";

      // Print the URL before making the request
      print("Request URL: $url");

      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      print(response); // This will print the response object itself

      return jsonResponse(response); // Handle response after getting it
    } on SocketException catch (ex) {
      throw FetchDataException(errormsg: ex.toString());
    } catch (ex) {
      throw FetchDataException(errormsg: ex.toString());
    }
  }


  Future<dynamic> postapi(
      {required String url,
      Map<String, dynamic>? bodyparams,
      bool isheaderrequired = false}) async {
    final uri = Uri.parse(url);
    String? token;
    if (isheaderrequired) {
      token = await AppPrefs().getToken();
    }
    try {
      final response =
          await http.post(uri, body: jsonEncode(bodyparams), headers: {
        "Content-Type": "application/json",
        if (isheaderrequired && token != null) "Authorization": "Bearer $token"
      });

      return jsonResponse(response);
    } on SocketException catch (ex) {
      // interNet Exception
      throw FetchDataException(errormsg: ex.toString());
    } catch (ex) {
      throw FetchDataException(errormsg: ex.toString());
    }
  }
}

dynamic jsonResponse(http.Response res) {
  switch (res.statusCode) {
    case 200:
      {
        final dresponse = jsonDecode(res.body);
        return dresponse;
      }
    case 400:
      throw BadRequestException(errormsg: res.body.toString());
    case 401:
    case 500:
      throw BadRequestException(errormsg: "Please Try Again");
    default:
      throw FetchDataException(errormsg: res.body.toString());
  }
}
