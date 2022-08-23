import 'package:flutter/material.dart';
import 'package:la_vie_hackathon_project/modules/mobile/forums/all_forums/all_forums_screen.dart';
import 'package:la_vie_hackathon_project/modules/mobile/forums/my_forums/my_forums.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';

class ForumsScreen extends StatelessWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            'Discussion Forums',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey[600],
                      ),
                      Text(
                        '  Search ',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 180,
                child: TabBar(
                  indicatorColor: Colors.green.withOpacity(.8),
                  unselectedLabelStyle:
                      TextStyle(color: Colors.black.withOpacity(.5)),
                  unselectedLabelColor: Colors.black.withOpacity(.4),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.green.withOpacity(.8),
                  tabs: const [
                    Tab(
                      child: Text(
                        'All Forums',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'My forums',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    AllForumsScreen(),
                    MyForumsScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
