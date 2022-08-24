import 'package:flutter/material.dart';
import 'package:la_vie_hackathon_project/shared/icons/icons.dart';

import '../../../shared/components/components.dart';

class SearchMobileScreen extends StatelessWidget {
  const SearchMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.arrowLeft2,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,100,20,20.0),
        child: Column(
          children: [
            const DefaultSearch(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Results for "',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextSpan(
                          text: 'Cactus plant',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.green,
                                  ),
                        ),
                        TextSpan(
                          text: '"',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '0 found',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ),
            const DefaultNotFound(
              text: 'Not found',
            ),
          ],
        ),
      ),
    );
  }
}
