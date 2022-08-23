import 'package:flutter/material.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';

class AllForumsScreen extends StatelessWidget {
  const AllForumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => const DefaultOnePost(),
      itemCount: 15,
    );
  }
}
