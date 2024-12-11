// ignore_for_file: deprecated_member_use

import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

import 'package:quran_ai/src/utils/resources/data_state.dart';

abstract class BaseRemoteRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioError(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioError catch (error) {
      return DataFailed(error);
    }
  }
}
