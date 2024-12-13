import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:doctor_flutter_v1/core/error/error_hander.dart';
import 'package:doctor_flutter_v1/core/network/dio_helper.dart';
import 'package:doctor_flutter_v1/core/network/end_point.dart';
import 'package:doctor_flutter_v1/core/services/cache/app_cache_key.dart';
import 'package:doctor_flutter_v1/core/services/cache/cache_service.dart';
import 'package:doctor_flutter_v1/model/health_record/health_Record_model.dart';

abstract class HealthRecordRepo {
  Future<Either<Failures, HealthRecordModel>> getHealthRecords({
    required String id,
    required int page,
  });
  Future<Either<Failures, String>> submitHealthRecords({
    required String bloodPressure,
    required String heartRate,
    required String temperature,
    required String treatmentPlan,
    required double lat,
    required double long,
  });
}

class HealthRecordRepoImpl implements HealthRecordRepo {
  @override
  Future<Either<Failures, HealthRecordModel>> getHealthRecords({
    required String id,
    required int page,
  }) async {
    try {
      Response response = await DioHelper.getData(
          url: EndPoint.patientHealthRecords(id: id),
          queryParameters: {"page": page},
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(HealthRecordModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> submitHealthRecords({
    required String bloodPressure,
    required String heartRate,
    required String temperature,
    required String treatmentPlan,
    required double lat,
    required double long,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EndPoint.submitHealthRecords,
          data: {
            "blood_pressure": bloodPressure,
            "heart_rate": heartRate,
            "temperature": temperature,
            "treatment_plan": treatmentPlan,
            "lat": lat,
            "long": long,
          },
          token: CacheService.getString(key: AppCacheKey.token));
      return Right(response.data["message"]);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(LocalFailures(errorMessage: e.toString()));
    }
  }
}
