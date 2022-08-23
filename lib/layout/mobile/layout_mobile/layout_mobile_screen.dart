import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:la_vie_hackathon_project/layout/mobile/layout_mobile/plants/layout_plants_screen.dart';
import 'package:la_vie_hackathon_project/layout/mobile/layout_mobile/seeds/layout_seeds_screen.dart';
import 'package:la_vie_hackathon_project/layout/mobile/layout_mobile/tools/layout_tools_screen.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';
import 'package:la_vie_hackathon_project/shared/cubit/logic_cubit/logic_cubit.dart';
import 'package:la_vie_hackathon_project/shared/cubit/logic_cubit/logic_states.dart';
import 'package:la_vie_hackathon_project/shared/icons/icons.dart';

import '../../../modules/mobile/blogs/blogs_mobile_screen.dart';
import '../../../modules/mobile/blogs/open_one.dart';
import '../../../modules/mobile/create_post/create_post_screen.dart';
import '../../../modules/mobile/forums/all_forums/all_forums_screen.dart';
import '../../../modules/mobile/forums/layout_formus_screen.dart';
import '../../../modules/mobile/my_cart/my_cart_screen.dart';
import '../../../modules/mobile/profile/profile_mobile_screen.dart';
import '../../../modules/mobile/scan_qr_code/scan_qr_code_screen.dart';
import '../../../modules/mobile/search/search_mobile_screen.dart';
import 'all/layout_all_screen.dart';

class LayoutMobileScreen extends StatelessWidget {
  const LayoutMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return BlocConsumer<LogicCubit, LogicStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LogicCubit.get(context);
        return DefaultTabController(
          length: 4,
          
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(15, 45, 15, 0),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        'assets/images/icon.png',
                      ),
                      Image.asset(
                        'assets/images/icon2.png',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: DefaultSearch(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 50,
                          child: DefaultElevatedButton(
                            icon: true,
                            onPressed: () {},
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: TabBar(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      onTap: (n) {
                        cubit.changeIndexTapBar(n);
                        print(n);
                      },
                      indicatorColor: Colors.green.withOpacity(.8),
                      unselectedLabelStyle:
                          TextStyle(color: Colors.black.withOpacity(.5)),
                      unselectedLabelColor: Colors.black.withOpacity(.4),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 0.000001,
                      labelColor: Colors.green.withOpacity(.8),
                      tabs: [
                        DefaultTapBar(
                          text: 'All',
                          selected: cubit.index == 0 ? true : false,
                        ),
                        DefaultTapBar(
                          text: 'Plants',
                          selected: cubit.index == 1 ? true : false,
                        ),
                        DefaultTapBar(
                          text: 'Seeds',
                          selected: cubit.index == 2 ? true : false,
                        ),
                        DefaultTapBar(
                          text: 'Tools',
                          selected: cubit.index == 3 ? true : false,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        LayoutAllMobileScreen(),
                        LayoutPlantsMobileScreen(),
                        LayoutSeedsMobileScreen(),
                        LayoutToolsMobileScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              index: 2,
              letIndexChange: (value) => false,
              height: 60,
              color: Colors.white,
              buttonBackgroundColor: Colors.green,
              backgroundColor: Colors.transparent,
              items: const <Widget>[
                Icon(IconBroken.paper, size: 25),
                Icon(IconBroken.scan, size: 25),
                Icon(color: Colors.white, IconBroken.home, size: 25),
                Icon(IconBroken.notification, size: 25),
                Icon(IconBroken.profile, size: 25),
              ],
              onTap: (index) {
                if (index == 1) print('yes');
              },
            ),
          ),
        );
      },
    );
  }
}
