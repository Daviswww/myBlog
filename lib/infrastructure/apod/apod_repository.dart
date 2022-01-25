import 'package:dartz/dartz.dart';
import 'package:myblog/domain/service_failure.dart';
import 'package:myblog/infrastructure/apod/apod_model.dart';

abstract class ApodRepository {
  /// Calls the https://api.nasa.gov/planetary/apod endpoint.
  ///
  /// NASA 最受歡迎的網站之一是今日天文圖片。
  ///
  /// https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=1
  /// If this is specified then randomly chosen images will be returned.
  Future<Either<ServiceFailure, ApodModel>> getApodImage();
}
