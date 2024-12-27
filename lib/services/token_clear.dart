import 'package:TalkSpace/services/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:TalkSpace/cubit/token_cubit.dart';
import 'package:TalkSpace/services/jwt_decode.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

tokenClear(BuildContext context) {
  Hive.box('token').clear();
  HiveBoxes.listToken.delete(jwtDecode().email);
  context.read<TokenCubit>().updateToken("");
}
