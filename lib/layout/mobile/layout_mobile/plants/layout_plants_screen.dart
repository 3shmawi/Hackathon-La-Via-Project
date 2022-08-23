import 'package:flutter/material.dart';

import '../../../../shared/cubit/logic_cubit/logic_cubit.dart';

class LayoutPlantsMobileScreen extends StatelessWidget {
  const LayoutPlantsMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogicCubit.get(context).changeIndexTapBar(1);

    return Container();
  }
}