import 'dart:math';

import 'package:hapind/service/api/base_api.dart';
import 'package:http/http.dart' as http;

class OtpService extends BaseApi{
  OtpService();
  late String userUrl = url +"/api/auth/sendOtp/" ;

  // String generateOtp() {
  //   // Tạo một mã OTP ngẫu nhiên gồm 4 số
  //   final Random random = Random();
  //   final int otpCode = 1000 + random.nextInt(9000);
  //   return otpCode.toString();
  // }

  Future<bool> validateOtp(Future<String?>? enteredOtp, Future<String?>? correctOtp) async {
    // Kiểm tra xem mã OTP nhập vào có đúng không
    String? actualEnteredOtp = await enteredOtp;
  String? actualCorrectOtp = await correctOtp;
      print(actualEnteredOtp == actualCorrectOtp);

    return actualEnteredOtp == actualCorrectOtp;
  }

   Future<String?>? generateOtp(String? emai) async {
    try {
      final response = await http.post(
        Uri.parse('$userUrl${emai}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        return response.body;
      }
    } catch (error) {
      return null;
    }
  }

  bool isOtpExpired(DateTime generatedTime, Duration validityDuration) {
    // Kiểm tra xem mã OTP đã hết hạn chưa
    final DateTime now = DateTime.now();
    final DateTime expirationTime = generatedTime.add(validityDuration);
    return now.isAfter(expirationTime);
  }
}