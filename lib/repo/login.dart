import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/model/login_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class LoginRepo {
  Future<Either<Failures, LoginModel>> loginUser(String email, String password);
}

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failures, LoginModel>> loginUser(
      String email, String password) async {
    try {
      Response response = await DioHelper.postData(
        url: EndPoint.login,
        data: {
          "emailOrPhone": email,
          "password": password,
          "fcm_token": await FirebaseMessaging.instance.getToken()
        },
      );

      return Right(LoginModel.fromJson(response.data));
    } on DioException catch (dioError) {
      log(dioError.message.toString());
      log(dioError.response.toString());
      log(dioError.toString());
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      // log(e.toString());

      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
