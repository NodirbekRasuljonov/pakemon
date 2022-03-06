import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poxedon/core/constants/api_const.dart';
import 'package:poxedon/models/pokemonmodel.dart';

class MyService {
  static Future<PokemonsModel> getData() async {
    Response res = await Dio().get(MyApi.myapi);
    return PokemonsModel.fromJson(jsonDecode(res.data));
  }
}
