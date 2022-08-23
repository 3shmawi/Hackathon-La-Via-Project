import 'package:flutter/material.dart';

import '../../../../shared/cubit/logic_cubit/logic_cubit.dart';

class LayoutToolsMobileScreen extends StatelessWidget {
  const LayoutToolsMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogicCubit.get(context).changeIndexTapBar(3);

    return Container();
  }
}