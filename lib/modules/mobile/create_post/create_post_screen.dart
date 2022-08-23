import 'package:flutter/material.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';

class CreateNewPostScreen extends StatelessWidget {
  const CreateNewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    return Scaffold(
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
          'Create New Post',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.green,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Add photo',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.green,
                          ),
                    ),
                  ],
                ),
              ),
            ), const SizedBox(
              height: 30,
            ),
            DefaultFormField(
              textInputType: TextInputType.text,
              header: 'Title',
              maxLines: 1,
              controller: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            DefaultFormField(
              textInputType: TextInputType.text,
              header: 'Description',
              maxLines: 5,
              controller: descriptionController,
            ),
            const SizedBox(
              height: 40,
            ),
            DefaultElevatedButton(
              header: 'Post',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
