import 'dart:convert';
import 'package:myblog/domain/service_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myblog/config/config_reader.dart';
import 'package:myblog/infrastructure/apod/apod_model.dart';
import 'package:myblog/infrastructure/apod/apod_repository.dart';

class ApodRepositoryImpl implements ApodRepository {
  final client = http.Client();
  final String domain = ConfigReader.config().API_HOST;
  final String key = ConfigReader.config().KEY;
  var temp;
  @override
  Future<Either<ServiceFailure, ApodModel>> getApodImage() {
    return _getApodImage(
      Uri.parse('$domain?api_key=$key&count=1'),
    );
  }

  Future<Either<ServiceFailure, ApodModel>> _getApodImage(
    Uri url,
  ) async {
    try {
      final response = await client.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = ApodModel.fromMap(jsonDecode(response.body)[0]);
        if (data.url.contains('.jpg') || data.url.contains('.jpg')) {
          return right(data);
        } else {
          return left(GetFailure(
            code: response.statusCode,
            message: response.body,
          ));
        }
      } else {
        return left(GetFailure(
          code: response.statusCode,
          message: response.body,
        ));
      }
    } catch (e) {
      return left(GetFailure(
        code: 0,
        message: e.toString(),
      ));
    }
  }
}
