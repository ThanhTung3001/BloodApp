import 'dart:convert';
import 'dart:io';

import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/data/api/file_client/file_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class FileClient extends GetConnect {
  Future<ResponseUploadFile> UploadFile(String path, File file) async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/Upload?path=avatars';
      //print(url);
      var form = MultipartFile(file,
          filename: file.path.substring(file.path.lastIndexOf("/") + 1));
      final formData = FormData({'file': form});
      var response = await post(url, formData, headers: headers);
      print(form);
      print(response.bodyString);
      if (response.isOk) {
        return ResponseUploadFile.fromJson(
            json.decode(response.bodyString ?? ""));
      } else {
        return ResponseUploadFile();
      }
    } catch (e) {
      print(e);
      ToastCard(
          Text('Get data fail ${e.toString()}'), const Duration(seconds: 5));
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }
}
