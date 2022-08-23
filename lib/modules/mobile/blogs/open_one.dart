import 'package:flutter/material.dart';

class OpenOneBlog extends StatelessWidget {
  const OpenOneBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/image.jpeg',
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5 Simple Tips to treat plants\n',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'leaf, in botany, any usually flattened green outgrowth from the stem of\n ',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
