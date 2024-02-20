import 'dart:convert';
import 'dart:io';

import 'package:hapind/model/user_image.dart';
import 'package:hapind/service/api/base_api.dart';
import 'package:http/http.dart' as http;

class UploadService extends BaseApi {
  late String getImageByUserURL = url + "/api/mobile/getUserImageById/";
  late String setImageByUserURL = url + "/api/mobile/addOrUpdateUserImage/";

  Future<List<UserImage>?> getUserImage(int? id) async {
    try {
      final response = await http.get(
        Uri.parse(getImageByUserURL + "$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic>? responseData = jsonDecode(response.body);
        if (responseData != null) {
          // Convert the list of dynamic to List<UserImage>
          List<UserImage> userImages =
              responseData.map((data) => UserImage.fromJson(data)).toList();
          return userImages;
        } else {
          print("Error: Response body is null or not a valid JSON object");
          throw Exception('Failed to create user3.');
        }
      }
    } catch (error) {
      throw error;
    }
    return null;
  }

  Future<UserImage?>? addOrUpdateUserImage(UserImage userImage,int? userId) async {
    final response = await http.post(
      Uri.parse(setImageByUserURL+'$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userImage.toMap()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("API response: ${response.body}");
      return UserImage.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print("Error: ${response.statusCode}");
      print("API response: ${response.body}");
      throw Exception('Failed to create user.');
    }
  }

  Future<String> uploadToCloudinary(File imageFile) async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dmkw4f8iw/upload');

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'xd2xcwo1'
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      print("ok");
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      final url = jsonMap['url'];
      print(url);
      return url; // return the URL directly
    } else {
      // Handle error or return a default URL
      return 'https://example.com/default-image.jpg';
    }
  }

  // void uploadToCloudinary(File imageFile) async {
  //   String cloudinaryUrl = 'https://api.cloudinary.com/v1_1/dmkw4f8iw/upload';
  //   String apiKey = '871624782667832';

  //   FormData formData = FormData.fromMap({
  //     'file': await MultipartFile.fromFile(imageFile.path),
  //     'upload_preset':
  //         'YOUR_UPLOAD_PRESET', // Make sure to create this in your Cloudinary dashboard
  //     'api_key': apiKey,
  //   });

  //   try {
  //     Response response = await Dio().post(cloudinaryUrl, data: formData);
  //     String imageUrl = response.data['secure_url'];

  //     // Now you have the image URL, you can use it as needed
  //     print('Uploaded Image URL: $imageUrl');
  //   } catch (error) {
  //     print('Error uploading image to Cloudinary: $error');
  //   }
  // }
}
