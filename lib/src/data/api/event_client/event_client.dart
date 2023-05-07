import 'dart:convert';

import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/data/api/event_client/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class EventClient extends GetConnect {
  Future<ResponseEvent> getAllEvent({page = 1, pageSize = 20}) async {
    final headers = {'Authorization': TOKEN};
    try {
      var url = '$BASE_URL/api/Event?PageNumber=$page&PageSize=$pageSize';
      print(url);
      var response = await get(url, headers: headers);
      if (response.isOk) {
        return ResponseEvent.fromJson(json.decode(response.bodyString ?? ""));
      } else {
        return ResponseEvent(data: []);
      }
    } catch (e) {
      ToastCard(
          Text('Get data fail ${e.toString()}'), const Duration(seconds: 5));
      print(e.toString());
      // return ResponseEvent();
      rethrow;
    }
  }
}
