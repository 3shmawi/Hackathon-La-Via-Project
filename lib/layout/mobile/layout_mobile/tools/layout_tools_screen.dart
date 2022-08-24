import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';
import 'package:la_vie_hackathon_project/shared/cubit/logic_cubit/logic_cubit.dart';

import '../../../../shared/cubit/home_cubit/home_cubit.dart';
import '../../../../shared/cubit/home_cubit/home_states.dart';
import '../../../../shared/cubit/logic_cubit/logic_states.dart';

class LayoutToolsMobileScreen extends StatelessWidget {
  const LayoutToolsMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LogicCubit.get(context).changeIndexTapBar(3);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state){},
      builder: (context, state) {
        var cubit = HomeCubit.get(context).fetchToolsModel;
        // HomeCubit.get(context).getFetchProductsModel();
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
                          ? 'https://i.pinimg.com/564x/5f/b7/cc/5fb7cca538bc7d53ecf325462f3a4abd.jpg'
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
