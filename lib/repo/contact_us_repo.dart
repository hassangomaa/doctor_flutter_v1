import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';

abstract class ContactUsRepo {
  Future<Either<Failures, String>> contactUs({
    required String title,
    required String message,
    required String name,
    required String email,
    required String userId,
  });
}

class ContactUsRepoImpl implements ContactUsRepo {
  @override
  Future<Either<Failures, String>> contactUs({
    required String title,
    required String message,
    required String name,
    required String email,
    required String userId,
  }) async {
    try {
      Response response = await DioHelper.postData(
        token: CacheService.getString(key: AppCacheKey.token),
        url: EndPoint.contactUs,
        data: {
          "user_id": userId,
          // "name": name,
          // "email": email,
          "subject": message,
          "message": title,
        },
      );
      log(response.data.toString());
      return Right(response.data["result"]);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDioError(dioError));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
