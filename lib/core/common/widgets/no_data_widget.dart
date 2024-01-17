
import 'package:assesment_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
///[NoDataWidget] used to show an empty data lottie file
class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetsManager.noDataAnimation,
        height: 200,
      ),
    );
  }
}
