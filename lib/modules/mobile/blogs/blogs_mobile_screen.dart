import 'package:flutter/material.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';

class BlogsMobileScreen extends StatelessWidget {
  const BlogsMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white54,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Blogs',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: (true)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 140,
                                    width: 140,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset(
                                      'assets/images/image.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0),
                                          child: Text(
                                            '2 days ago',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(
                                                    color: Colors.green,
                                                    fontSize: 15),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 15.0),
                                          child: Text(
                                            '5 Tips to treat plants',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(fontSize: 18),
                                          ),
                                        ),
                                        Text(
                                            'leaf, in botany, any usually leaf, in botany, any usually',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: 15,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Image.asset(
                    'assets/images/frame.png',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'The cart is empty',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 15,
                        ),
                  ),
                ],
              ),
            ),
    );
  }
}
