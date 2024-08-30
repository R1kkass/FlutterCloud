import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/token_cubit.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

tokenClear(BuildContext context) {
  Hive.box('token').clear();
  context.read<TokenCubit>().updateToken("");
}
