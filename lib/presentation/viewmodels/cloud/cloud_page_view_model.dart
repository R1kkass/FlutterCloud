import 'package:TalkSpace/presentation/viewmodels/cloud/common_cloud_data.dart';
import 'package:flutter/material.dart';

class CloudPageViewModel extends ChangeNotifier {
  CommonCloudData commonCloudData;

  CloudPageViewModel({
    required this.commonCloudData,
  });
}
