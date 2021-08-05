import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
//获取首页列表
Future getHomePageList() async{
    Dio().get(servicePath['homePage']!!);
}