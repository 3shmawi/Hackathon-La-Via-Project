import 'package:flutter/material.dart';
import 'package:la_vie_hackathon_project/shared/components/components.dart';
import 'package:la_vie_hackathon_project/shared/cubit/logic_cubit/logic_cubit.dart';

class LayoutAllMobileScreen extends StatelessWidget {
  const LayoutAllMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogicCubit.get(context).changeIndexTapBar(0);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 5.0,
      childAspectRatio: 1 / 1.57,
      children: List.generate(
        12,
        (index) => Stack(
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

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35.0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.remove,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                            Text(
                              ' 5 ',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'GRADENIA PLANT',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                        child: Text(
                          '70 EGP',
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
            Image.asset(
              'assets/images/defalut_plant.png',
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
