import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';
import 'package:la_vie_hackathon_project/shared/cubit/logic_cubit/logic_cubit.dart';

import '../../../../shared/cubit/home_cubit/home_cubit.dart';
import '../../../../shared/cubit/home_cubit/home_states.dart';
import '../../../../shared/cubit/logic_cubit/logic_states.dart';

class LayoutAllMobileScreen extends StatelessWidget {
  const LayoutAllMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LogicCubit.get(context).changeIndexTapBar(0);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state){},
      builder: (context, state) {
        var cubit = HomeCubit.get(context).fetchProductsModel!;
       // HomeCubit.get(context).getFetchProductsModel();
        for (int i = 0; i < cubit.data.length; i++) {
          LogicCubit.get(context).numberOfProducts.add(0);
        }
        return (cubit != null)
            ? GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: 5.0,
          childAspectRatio: 1 / 1.57,
          children: List.generate(
            cubit.data.length,
                (index) {
              return Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              cubit.data[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4.0, bottom: 8),
                              child: Text(
                                cubit.data[index].price.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            DefaultElevatedButton(
                              onPressed: () {},
                              header: 'Add To Cart',
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 30),
                    child: Image.network(
                      cubit.data[index].imageUrl == ""
                          ? 'data:image/jpeg;base64,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'
                          : 'https://lavie.orangedigitalcenteregypt.com${cubit.data[index].imageUrl}',
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 120.0, 15, 0),
                      child: BlocBuilder<LogicCubit, LogicStates>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<LogicCubit>()
                                      .changeNumberOfProductsDecrement(
                                      index);
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Text(
                                ' ${context.read<LogicCubit>().numberOfProducts[index]} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<LogicCubit>()
                                      .changeNumberOfProductsIncrement(
                                      index);
                                },
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )
            :const Center(
        child: CircularProgressIndicator(),
        );
      },
    );
  }
}
