import 'package:bloc/bloc.dart';
import 'package:estore/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:estore/core/block_opserver.dart';

import 'app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  Bloc.observer = MyBlocObserver();
  runApp(const EstoreApp());
}
