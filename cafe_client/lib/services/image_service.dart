import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class ImageService {
  final dio = Dio();

  static const baseUrl = 'http://felixtessera-001-site1.gtempurl.com/';

  postImage(File image) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(image.path,
            filename: basename(image.path)),
      });
      final response =
          await dio.post('${baseUrl}api/menuitems/images', data: formData);
      debugPrint(response.statusCode.toString());
      debugPrint(response.data);
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
