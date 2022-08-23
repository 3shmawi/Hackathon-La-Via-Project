import 'package:flutter/material.dart';

import '../../../../shared/cubit/logic_cubit/logic_cubit.dart';

class LayoutSeedsMobileScreen extends StatelessWidget {
  const LayoutSeedsMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogicCubit.get(context).changeIndexTapBar(2);

    return Container();
  }
}