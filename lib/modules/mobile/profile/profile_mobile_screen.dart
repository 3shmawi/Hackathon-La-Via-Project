import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_hackathon_project/shared/cubit/home_cubit/home_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/home_cubit/home_states.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit= HomeCubit.get(context).getCurrentUserModel.data;
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Stack(
                children: [
                  Image.network(
                    cubit.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.black87,
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 30,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 60,
                    child: Image.network(
                      cubit.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${cubit.firstName} ${cubit.lastName}',
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 17,
                                      child: Image.asset(
                                        'assets/images/default_image.png',
                                      ),
                                    ),
                                    Text(
                                      '  You have 30 points',
                                      style:
                                      Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 5),
                              child: Text(
                                'Edit Profile',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Card(
                                elevation: 30,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.send_time_extension_outlined,
                                      ),
                                      Text(
                                        '   Change Name',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            InkWell(
                              onTap: () {},
                              child: Card(
                                elevation: 30,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.send_time_extension_outlined,
                                      ),
                                      Text(
                                        '   Change Email',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.arrow_forward_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
